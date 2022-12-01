# FPGA_Digital_Robot

<image align="right" src="_readmeIMG/Capture.JPG" alt="Final Product" width=30% height=30%>
 

## Introduction
The main goal of the project is to investigate the possibility of building an artificial intelligence robot - Digital Companion Pet. It aims to have multiple functionalities of sensors so it can have different reactions based on nearby environment changes. Our idea is inspired by the digital pet concept in the past like Digimon Breeding Game and Tamagotchi. The end-user can pet them, and play around with them. Our products can also be treated as real pets and as a companion to mankind. It will have movement ability and understand basic instructions from the owner. It will be equipped with Artificial Intelligence to identify the owner's facial characteristics and hand gestures. We hope that the digital robot can bring joy to us, especially during a hard time in a pandemic.

## Product Design
![Pet gif](https://github.com/AlbertngSeadragon/FPGA_Digital_Robot/blob/main/_readmeIMG/Pet%203D%20animation.gif)
 
## Applications and Functionality
Applications and Functionality
Digital Companion Pet has 5 main functions.
 
1. 	Face Recognition - Owner Mode
First of all, using our python function to register the owner's face will be required in the jetson camera. After registration, the face data will become a model and user can use their face as a key to use the robot [1]. The robot pet will consider you as the owner. It has a deep learning model to distinguish whether you are a stranger or an owner. If it has detected multiple strangers, it will store it in its local storage for the record. [3]
 
2. 	Hand Pose Detection Clamp Control - Grab Mode
With two specific hand poses, open and close, the user can control the Clamp to grab the stuff you need [2]. It has the advantage when you want to grab something remotely.
 
3. 	Hand Pose Interaction Display using the VGA - Pet Mode
It will express the robot’s emotion through a small VGA. For example, if you interact with the robot, it will show you a happy face, and an LED light will be activated. Moreover, it will show a sad face if you scold it [6].
 
4. 	Camera Infra-Red (IR) Tracker Detection
The IR tracker will detect the IR light source, and rotate the sensor module with the jet camera towards the direction of the source automatically. It can be considered that the pet is looking at you [5].
           
5. 	Movement Function [4]
It will use a wheel to move around in your house and the design of the wheel can prevent the assistant stuck in the corner. We have provided the model of self-driving. Users can use the Bluetooth controller to control the assistant.


## Acknowledgement
[1] A. Geitgey, “Build a hardware-based face recognition system for $150 with the nvidia jetson nano and python,” Medium, 25-Jun-2019. [Online]. Available: https://medium.com/@ageitgey/build-a-hardware-based-face-recognition-system-for-150-with-the-nvidia-jetson-nano-and-python-a25cb8c891fd. [Accessed: 11-Apr-2022].

[2] A. Technologies and Instructables, “Bionic wolverine claws,” Instructables, 09-Apr-2022. [Online]. Available: https://www.instructables.com/Bionic-Wolverine-Claws/. [Accessed: 11-Apr-2022].

[3] Ageitgey, “Ageitgey/face_recognition_models: Trained models for the face_recognition python library,” GitHub. [Online]. Available: https://github.com/ageitgey/face_recognition_models. [Accessed: 18-May-2022]. 

[4] “Embedding System Car Design,” Wong Ming Yee. [Online]. Available: https://www.cse.cuhk.edu.hk/~mywong/. [Accessed: 11-Apr-2022].

[5] “Infra-Red (IR) Tracker, Fundamentals of Embedded System Design .” . 

[6] Nvidia-Ai-Iot, “Nvidia-ai-IOT/TRT_POSE_HAND: Real-time hand pose estimation and gesture classification using TENSORRT,” GitHub. [Online]. Available: https://github.com/NVIDIA-AI-IOT/trt_pose_hand. [Accessed: 11-Apr-2022].

[7] “Rapid Prototyping of Digital Systems Lecture 06: Driving ... - cse.cuhk.edu.hk.” [Online]. Available: https://www.cse.cuhk.edu.hk/~mcyang/ceng3430/2122T2/Lec06%20Driving%20Peripheral%20Modules%20with%20ZedBoard.pdf. [Accessed: 11-Apr-2022].

Special Credit to Simon, Wong Ming Yee
