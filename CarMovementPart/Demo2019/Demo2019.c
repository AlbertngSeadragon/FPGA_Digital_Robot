#include <stdint.h>
#include <stdbool.h>
#include <math.h>
#include "inc/tm4c123gh6pm.h"
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/debug.h"
#include "driverlib/pwm.h"
#include "driverlib/pin_map.h"
#include "inc/hw_gpio.h"
#include "driverlib/qei.h"
#include "driverlib/rom.h"
#include "driverlib/uart.h"
#include "driverlib/interrupt.h"
#include "driverlib/timer.h"

#define PWM_FREQUENCY 55
#define Velocity 200
#define pi 3.14159265359

//PID for sample
#define initPWML 500
#define initPWMR 500

#define P_left 300
#define I_left 20
#define D_left 16

#define P_right 300
#define I_right 20
#define D_right 16


#define MaxAccu 50
#define MinAccu -50

#define DIV  230
#define LEFT90 500
#define RIGHT90 390

//#define GRID 1395
long GRID=9000;
long cntInitVal=9000;

int x,y,DIR;
int stepL,stepR,lastL,lastR;
double l1,l2,theta,tmptheta,tmpx,tmpy;

double deltaLeft,diffLeft,diff2Left,lastLeft,last2Left,accuLeft;
double deltaRight,diffRight,diff2Right,lastRight,last2Right,accuRight;

volatile int qeiPositionL,qeiPositionR;
volatile int qeiVelocityL,qeiVelocityR;

volatile int VL[100],VR[100],vcnt;

volatile int intCnt,stepCnt,ms,updateCnt;
volatile int sensor_val,LidarDist[11],temp_sen,temp_pos;
volatile int phase=1;
volatile int Run,Rotate;
volatile int chkpos=0;

volatile int Load;
volatile int PWMClock;
volatile int AdjustLeft;
volatile int AdjustRight;
volatile char sen,pos;

#define NEWLINE UARTCharPut(UART0_BASE, 0x0a); UARTCharPut(UART0_BASE, 0x0d)
#define NEWLINE1 UARTCharPut(UART1_BASE, 0x0a); UARTCharPut(UART1_BASE, 0x0d)

void initSystem(void) {
    SysCtlClockSet(SYSCTL_SYSDIV_5|SYSCTL_USE_PLL|SYSCTL_OSC_MAIN|SYSCTL_XTAL_16MHZ);

    // Enable UART
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART1);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);

    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);

    // Initialize UART
    GPIOPinConfigure(GPIO_PA0_U0RX);
    GPIOPinConfigure(GPIO_PA1_U0TX);
    GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);

    UARTConfigSetExpClk(UART0_BASE, SysCtlClockGet(), 115200, (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE));

    GPIOPinConfigure(GPIO_PB0_U1RX);
    GPIOPinConfigure(GPIO_PB1_U1TX);
    GPIOPinTypeUART(GPIO_PORTB_BASE, GPIO_PIN_0 | GPIO_PIN_1);

    UARTConfigSetExpClk(UART1_BASE, SysCtlClockGet(), 115200, (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE | UART_CONFIG_PAR_NONE));

    // configure SW1 and SW2 GPIOF PF0 & PF4
    HWREG(GPIO_PORTF_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY;
    HWREG(GPIO_PORTF_BASE + GPIO_O_CR) |= 0x01;
    HWREG(GPIO_PORTF_BASE + GPIO_O_LOCK) = 0;
    GPIODirModeSet(GPIO_PORTF_BASE, GPIO_PIN_4|GPIO_PIN_0, GPIO_DIR_MODE_IN);
    GPIOPadConfigSet(GPIO_PORTF_BASE, GPIO_PIN_4|GPIO_PIN_0, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);

    GPIOPinTypeGPIOOutput(GPIO_PORTA_BASE, GPIO_PIN_3|GPIO_PIN_4);     // configure 3,4 as output (A,B)
    GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, GPIO_PIN_2|GPIO_PIN_3);     // configure PB6,7 as output (C,D)
    GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_2|GPIO_PIN_3); // configure PD2 and PD3 as output pins
    GPIOPinTypeGPIOOutput(GPIO_PORTE_BASE, GPIO_PIN_4|GPIO_PIN_5); // configure PE4 and PE5 as output pins

    GPIOPinTypeGPIOInput(GPIO_PORTA_BASE, GPIO_PIN_2);
}

void initQEI(void) {
    // Enable QEI Peripherals
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_QEI0);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_QEI1);

    //Unlock GPIOD7 - Like PF0 its used for NMI - Without this step it doesn't work
    HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = GPIO_LOCK_KEY; //In Tiva include this is the same as "_DD" in older versions (0x4C4F434B)
    HWREG(GPIO_PORTD_BASE + GPIO_O_CR) |= 0x80;
    HWREG(GPIO_PORTD_BASE + GPIO_O_LOCK) = 0;

    //Set Pins to be PHA0 and PHB0
    GPIOPinConfigure(GPIO_PD6_PHA0);
    GPIOPinConfigure(GPIO_PD7_PHB0);
    //Set Pins to be PHA1 and PHB1
    GPIOPinConfigure(GPIO_PC5_PHA1);
    GPIOPinConfigure(GPIO_PC6_PHB1);

    //Set GPIO pins for QEI. PhA0 -> PD6, PhB0 ->PD7.
    GPIOPinTypeQEI(GPIO_PORTD_BASE, GPIO_PIN_6 |  GPIO_PIN_7);
    //Set GPIO pins for QEI. PhA1 -> PC5, PhB1 ->PC6.
    GPIOPinTypeQEI(GPIO_PORTC_BASE, GPIO_PIN_5 |  GPIO_PIN_6);

    //DISable peripheral and int before configuration
    QEIDisable(QEI0_BASE);
    QEIIntDisable(QEI0_BASE,QEI_INTERROR | QEI_INTDIR | QEI_INTTIMER | QEI_INTINDEX);
    QEIDisable(QEI1_BASE);
    QEIIntDisable(QEI1_BASE,QEI_INTERROR | QEI_INTDIR | QEI_INTTIMER | QEI_INTINDEX);

    // Configure quadrature encoder, use an arbitrary top limit of 10000
    //QEIConfigure(QEI0_BASE, (QEI_CONFIG_CAPTURE_A_B  | QEI_CONFIG_NO_RESET  | QEI_CONFIG_QUADRATURE | QEI_CONFIG_NO_SWAP), 10000);
    //QEIConfigure(QEI1_BASE, (QEI_CONFIG_CAPTURE_A_B  | QEI_CONFIG_NO_RESET  | QEI_CONFIG_QUADRATURE | QEI_CONFIG_NO_SWAP), 10000);
    QEIConfigure(QEI0_BASE, (QEI_CONFIG_CAPTURE_A  | QEI_CONFIG_NO_RESET  | QEI_CONFIG_CLOCK_DIR | QEI_CONFIG_NO_SWAP), 10000);
    QEIConfigure(QEI1_BASE, (QEI_CONFIG_CAPTURE_A  | QEI_CONFIG_NO_RESET  | QEI_CONFIG_CLOCK_DIR | QEI_CONFIG_NO_SWAP), 10000);
    //Initial Disable the QEI Velocity
    QEIVelocityDisable(QEI0_BASE);
    QEIVelocityDisable(QEI1_BASE);

    //Configure the QEI velocity
    QEIVelocityConfigure(QEI0_BASE,QEI_VELDIV_1,8000000);
    QEIVelocityConfigure(QEI1_BASE,QEI_VELDIV_1,8000000);

    // Enable the QEI velocity
    QEIVelocityEnable(QEI0_BASE);
    QEIVelocityEnable(QEI1_BASE);

    // Enable the quadrature encoder.
    QEIEnable(QEI0_BASE);
    QEIEnable(QEI1_BASE);

    //Set initial position to 0
    QEIPositionSet(QEI0_BASE, 0);
    QEIPositionSet(QEI1_BASE, 0);
}

void initPWM(void) {
    SysCtlPWMClockSet(SYSCTL_PWMDIV_64);

    SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM1);

    GPIOPinTypePWM(GPIO_PORTD_BASE, GPIO_PIN_0|GPIO_PIN_1);
    GPIOPinConfigure(GPIO_PD0_M1PWM0);
    GPIOPinConfigure(GPIO_PD1_M1PWM1);

    PWMClock = SysCtlClockGet() / 64;
    Load = (PWMClock / PWM_FREQUENCY) - 1;
    PWMGenConfigure(PWM1_BASE, PWM_GEN_0, PWM_GEN_MODE_DOWN);
    PWMGenConfigure(PWM1_BASE, PWM_GEN_1, PWM_GEN_MODE_DOWN);
    PWMGenPeriodSet(PWM1_BASE, PWM_GEN_0, Load);
    PWMGenPeriodSet(PWM1_BASE, PWM_GEN_1, Load);

    PWMPulseWidthSet(PWM1_BASE, PWM_OUT_0, AdjustLeft * Load / 1000);
    PWMOutputState(PWM1_BASE, PWM_OUT_0_BIT, true);
    PWMGenEnable(PWM1_BASE, PWM_GEN_0);
    PWMPulseWidthSet(PWM1_BASE, PWM_OUT_1, AdjustRight * Load / 1000);
    PWMOutputState(PWM1_BASE, PWM_OUT_1_BIT, true);
    PWMGenEnable(PWM1_BASE, PWM_GEN_1);
}

void initTimer(void){
    uint32_t ui32Period;

    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER0);
    TimerConfigure(TIMER0_BASE, TIMER_CFG_PERIODIC);

    ui32Period = SysCtlClockGet() / 1000;     // Period = 1mS
    TimerLoadSet(TIMER0_BASE, TIMER_A, ui32Period -1);

    IntEnable(INT_TIMER0A);
    TimerIntEnable(TIMER0_BASE, TIMER_TIMA_TIMEOUT);
    IntMasterEnable();

    TimerEnable(TIMER0_BASE, TIMER_A);
}

void delayMS(int ms) {
    SysCtlDelay((SysCtlClockGet()/1000)*ms);
}

int  print(char *p) {
    while(*p!='\0') {
        UARTCharPut(UART0_BASE, (*p++));;
   }
   return(0);
}

int  print1(char *p) {
    while(*p!='\0') {
        UARTCharPut(UART1_BASE, (*p++));;
   }
   return(0);
}

void putint(int count) {
//    UARTCharPut(UART0_BASE,'0' + count/10000);
//    UARTCharPut(UART0_BASE,'0' + (count/1000) % 10);
    UARTCharPut(UART0_BASE,'0' + (count/100) % 10);
    UARTCharPut(UART0_BASE,'0' + (count/10) % 10);
    UARTCharPut(UART0_BASE,'0' + count % 10);
}

void putint1(int count) {
//    UARTCharPut(UART1_BASE,'0' + count/10000);
//    UARTCharPut(UART1_BASE,'0' + (count/1000) % 10);
    UARTCharPut(UART1_BASE,'0' + (count/100) % 10);
    UARTCharPut(UART1_BASE,'0' + (count/10) % 10);
    UARTCharPut(UART1_BASE,'0' + count % 10);
}

void fb_check_position(void){
      if(qeiPositionL<=(cntInitVal-GRID)) {
        GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, 0x0);
        GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, 0x0);
        if(Run==1) Run=2;
        else if(Run==3) Run=0;
      }
      if(qeiPositionR<=(cntInitVal-GRID)) {
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, 0x0);
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0x0);
        if(Run==1) Run=3;
        else if(Run==2) Run=0;
      }
}

void l_check_position(void){
      if(qeiPositionL<=(cntInitVal-LEFT90)) {
        GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, 0x0);
        GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, 0x0);
        if(Run==1) Run=2;
        else if(Run==3) Run=0;
      }
      if(qeiPositionR<=(cntInitVal-LEFT90)) {
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, 0x0);
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0x0);
        if(Run==1) Run=3;
        else if(Run==2) Run=0;
      }
}

void r_check_position(void){
      if(qeiPositionL<=(cntInitVal-RIGHT90)) {
        GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, 0x0);
        GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, 0x0);
        if(Run==1) Run=2;
        else if(Run==3) Run=0;
      }
      if(qeiPositionR<=(cntInitVal-RIGHT90)) {
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, 0x0);
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0x0);
        if(Run==1) Run=3;
        else if(Run==2) Run=0;
      }
}

void stop(void){
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, 0x0);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, 0x0);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, 0x0);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0x0);
    Run = 0;
}

void forward(void) {
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, GPIO_PIN_2);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, 0x0);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, 0x0);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, GPIO_PIN_5);
    Run = 1;
}

void backward(void) {
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, 0x0);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, GPIO_PIN_3);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0x0);
    Run = 1;
}

void rotate_left(void) {
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, 0x0);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, GPIO_PIN_3);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, 0x0);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, GPIO_PIN_5);
    Run = 1;
}

void rotate_right(void) {
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_2, GPIO_PIN_2);
    GPIOPinWrite(GPIO_PORTD_BASE, GPIO_PIN_3, 0x0);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_4, GPIO_PIN_4);
    GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0x0);
    Run = 1;
}

void delayms(int t){
    ms=0;
    while(ms<t){}
}

void forward_dist(int dist){
    GRID = dist;
    forward();
    chkpos=1;
    QEIPositionSet(QEI0_BASE, cntInitVal);
    QEIPositionSet(QEI1_BASE, cntInitVal);
}

void rotate_left_nav(double angle){
    rotate_left();                      //rotate left 90 degree
    chkpos=0;
    QEIPositionSet(QEI0_BASE, cntInitVal);
    QEIPositionSet(QEI1_BASE, cntInitVal);
    lastL=0;
    lastR=0;
    while(theta<angle) {
       delayms(10);
       stepL=cntInitVal-qeiPositionL;
       stepR=cntInitVal-qeiPositionR;
       l2=(stepL-lastL)*0.22;
       l1=(stepR-lastR)*0.22;
       lastL=stepL;
       lastR=stepR;
       tmptheta=(l1+l2)/150;
       theta+=tmptheta;
       }
    theta=angle;
}

void rotate_right_nav(double angle){
    rotate_right();                      //rotate left 90 degree
    chkpos=0;
    QEIPositionSet(QEI0_BASE, cntInitVal);
    QEIPositionSet(QEI1_BASE, cntInitVal);
    lastL=0;
    lastR=0;
    while(theta>angle) {
       delayms(10);
       stepL=cntInitVal-qeiPositionL;
       stepR=cntInitVal-qeiPositionR;
       l2=(stepL-lastL)*0.22;
       l1=(stepR-lastR)*0.22;
       lastL=stepL;
       lastR=stepR;
       tmptheta=(l1+l2)/150;
       theta-=tmptheta;
       }
    theta=angle;
}

void forward_dist_nav(int dist,double angle){
    forward_dist(dist);                  //move forward for 4000 steps
    lastL=0;
    lastR=0;
    while(Run!=0) {
        delayms(500);
        stepL=cntInitVal-qeiPositionL;
        stepR=cntInitVal-qeiPositionR;
        l2=(stepL-lastL)*0.22;  // delta S (left) in mm
        l1=(stepR-lastR)*0.22;  // delta S (right) in mm
        lastL=stepL;
        lastR=stepR;
        tmptheta=(l1-l2)/170;
        theta+=tmptheta/2;
        tmpx=((l2+l1)/20)*cos(theta);
        tmpy=((l2+l1)/20)*sin(theta);

        x+=tmpx;
        y+=tmpy;

        NEWLINE1;
        if(x<0) print1("-");
        else print1("+");
        putint1(abs(x));
        print1(",");
        if(y<0) print1("-");
        else print1("+");
        putint1(abs(y));
    }

    if(theta>angle) rotate_right_nav(angle);
    else if(theta<angle) rotate_left_nav(angle);
}

int main(void)
{
    char cin;
    int i;

    initSystem();
    initTimer();
    initQEI();


    NEWLINE;
        print("=============================================================="); NEWLINE;
        print("*               CUHK CSE CENG2400 (2019)                     *"); NEWLINE;
        print("*                                                            *"); NEWLINE;
        print("*                    Test Program                            *"); NEWLINE;
        print("=============================================================="); NEWLINE;
        print("*                                                            *"); NEWLINE;
        print("*  f - forward 30 cm;                                        *"); NEWLINE;
        print("*                                                            *"); NEWLINE;
        print("*  l - rotate left;        r - rotate right                  *"); NEWLINE;
        print("*                                                            *"); NEWLINE;
        print("=============================================================="); NEWLINE;
    NEWLINE;

    NEWLINE1;
    print1("=============================================================="); NEWLINE1;
    print1("*               CUHK CSE CENG2400 (2019)                     *"); NEWLINE1;
    print1("*                                                            *"); NEWLINE1;
    print1("*                    Test Program                            *"); NEWLINE1;
    print1("=============================================================="); NEWLINE1;
    print1("*                                                            *"); NEWLINE1;
    print1("*  f - forward 30 cm;                                        *"); NEWLINE1;
    print1("*                                                            *"); NEWLINE1;
    print1("*  l - rotate left;        r - rotate right                  *"); NEWLINE1;
    print1("*                                                            *"); NEWLINE1;
    print1("=============================================================="); NEWLINE1;
    NEWLINE1;

    x=0;
    y=0;
    theta=pi/2;
    lastL=0;
    lastR=0;

    while(1) {
      AdjustLeft=initPWML;
      AdjustRight=initPWMR;
      initPWM();

      stop();

      Run = 0;
      while(Run==0) {

        cin=UARTCharGet(UART1_BASE);
        if(cin=='f'){
            forward_dist_nav(1364,pi/2);    // move forward around 30 cm, last direction toward 90 degree
        }

        else if(cin=='l'){
            theta=pi/2;
            rotate_left_nav(pi);            // rotate left around 90 degree
        }
        else if(cin=='r'){
            theta=pi/2;
            rotate_right_nav(0);            // rotate right around 90 degree
        }

        else if(cin=='p'){
            delayMS(10);
            forward();
            chkpos=0;
            vcnt=0;
            while(vcnt<100){}
            stop();

            while(1){
             NEWLINE1;
             for(i=0;i<100;i++){
                UARTCharPut(UART1_BASE,VL[i]);
                UARTCharPut(UART1_BASE,VR[i]);
             }
            }
        }

        else if(cin=='a'){
//
/*            forward_dist_nav(4250,pi);
            forward_dist_nav(4300,pi/2+0.1);
            forward_dist_nav(4300,pi/2+0.1);
            forward_dist_nav(2500,0+0.1);
            forward_dist_nav(2700,0+0.1);
            forward_dist_nav(1900,pi/2);
            forward_dist_nav(2800,pi/2);*/

            forward_dist_nav(4250,3*pi/4);
            forward_dist_nav(6010,pi/4);
            forward_dist_nav(6010,pi/2);
            forward_dist_nav(3000,0);
            /*
            forward_dist_nav(2700,0+0.1);
            forward_dist_nav(1900,pi/2);
            forward_dist_nav(2800,pi/2);*/

//            forward_dist_nav(4450,pi*3/4);
//            forward_dist_nav(6000,pi/4-0.2);
//            theta=pi/4;
//            forward_dist_nav(6200,pi/2);
//            theta=pi/2;
//            forward_dist_nav(2700,pi/2);
        }
      }
   }
}

void Timer0IntHandler(void)
{

    // Clear the timer interrupt
    TimerIntClear(TIMER0_BASE, TIMER_TIMA_TIMEOUT);

    qeiPositionL = QEIPositionGet(QEI0_BASE);
    qeiVelocityL = QEIVelocityGet(QEI0_BASE);
    qeiPositionR = QEIPositionGet(QEI1_BASE);
    qeiVelocityR = QEIVelocityGet(QEI1_BASE);

    ms++;

    if(chkpos==1) fb_check_position();
    else if(chkpos==2) l_check_position();
    else if(chkpos==3) r_check_position();

    intCnt++;
    if(intCnt==50){
        intCnt=0;
        if(vcnt<100){
            VL[vcnt]=qeiVelocityL;
            VR[vcnt]=qeiVelocityR;
            vcnt++;
        }

        if((Run==1)||(Run==3)){
          deltaLeft = Velocity - qeiVelocityL;
          diffLeft = deltaLeft - lastLeft;
          diff2Left = deltaLeft - last2Left;
          last2Left = lastLeft;
          lastLeft = deltaLeft;

          AdjustLeft += (P_left*deltaLeft + I_left*accuLeft*50/1000 + D_left*(diffLeft+2*diff2Left)*1000/50)/1000;

          accuLeft += deltaLeft;
          if(accuLeft>MaxAccu) accuLeft = MaxAccu;
          if(accuLeft<MinAccu) accuLeft = MinAccu;

          PWMPulseWidthSet(PWM1_BASE, PWM_OUT_0, AdjustLeft * Load / 1000);
        }
        if((Run==1)||(Run==2)){
          deltaRight = Velocity - qeiVelocityR;
          diffRight = deltaRight - lastRight;
          diff2Right = deltaRight - last2Right;
          last2Right = lastRight;
          lastRight = deltaRight;

          AdjustRight += (P_right*deltaRight + I_right*accuRight*50/1000 + D_right*(diffRight+2*diff2Right)*1000/50)/1000;

          accuRight += deltaRight;
          if(accuRight>MaxAccu) accuRight = MaxAccu;
          if(accuRight<MinAccu) accuRight = MinAccu;

          PWMPulseWidthSet(PWM1_BASE, PWM_OUT_1, AdjustRight * Load / 1000);
        }
    }
}
