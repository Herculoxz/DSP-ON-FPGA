# Table of contents 
---
- [AIM](https://github.com/Herculoxz/DSP-ON-FPGA-/edit/main/README.md#aim)
- [BRIEFING OF THE PROJECT](https://github.com/Herculoxz/DSP-ON-FPGA-/edit/main/README.md#briefing-of-the-project)
- [THEORY ](https://github.com/Herculoxz/DSP-ON-FPGA-/edit/main/README.md#theory)
- [STEPS INVOLVED ](https://github.com/Herculoxz/DSP-ON-FPGA-/edit/main/README.md#steps-involved)
- [TECH STACK ](https://github.com/Herculoxz/DSP-ON-FPGA-/edit/main/README.md#tech-stack)
- [GETTING STARTED ](https://github.com/Herculoxz/DSP-ON-FPGA-/edit/main/README.md#getting-started)
- [RESULT.](https://github.com/Herculoxz/DSP-ON-FPGA-/edit/main/README.md#result)

## AIM
---
To apply canny edge detection algorithm on  images and  implement it  on  FPGA using Verilog HDL language.

## BRIEFING OF THE PROJECT 
---
We have to take an image, convert it to grayscale form , scale it down to 9x9 pixels and give it as an input to the testbench , then we implement all the steps of canny edge detection on the image , further scaling up the compressed image to its original shape for edges .

## THEORY 
---
### What is FPGA?

FPGA stands for “Field-Programmable Gate Array.” It’s a type of computer chip that can be programmed to perform specific tasks after it’s manufactured. It’s like a digital Swiss army knife that can be customized to do different things, from processing signals to running complex calculations, by programming it with instructions.  

### Edge Detection

Edge detection is a fundamental concept in image processing and computer vision. It refers to the process of identifying the boundaries or edges of objects within an image, where abrupt changes in intensity or color occur. These edges typically correspond to object boundaries, significant features, or regions of interest in the image. Edge detection is a crucial step in various computer vision tasks, including object recognition, image segmentation, and feature extraction.

### Canny edge detection
Canny edge detection is a widely used image processing technique for detecting edges within an image. It was developed by John F. Canny in 1986 and is considered one of the most effective and widely used edge detection algorithms. Canny edge detection is particularly useful in various computer vision and image processing applications, such as object recognition, image segmentation, and feature extraction.

## STEPS INVOLVED 
---
- Gaussian smoothing
- Gradient calculation 
- Double thresholding 
- non-maximum suppression.



## TECH STACK 
---
- Verilog 
- Icarus verilog 
- Gtkwave 
- FPGA

## Getting Started 
---
- Install icarus verilog and gtkwave form the links below 
- Icarus verilog- [[https://bleyer.org/icarus/]]
- Gtkwave - [[https://gtkwave.sourceforge.net/]]
- Save your code file and testbench file separately and execute these commands on your terminal -
```bash
iverilog -o "name of the output file" " code_design.v" "code_testbench.v" 
```
 ```bash 
 vvp " name of the output file"
```
```bash
gtkwave dump.vcd 
```

## RESULT
---

- A 9x9 image given as input ( in the form of individual matrices of 9 elements ) gives the output with edges detected.

## HOW TO SIMULATE MY RESULT
---
-  You can fork my git repository [DSP_ON_FPGA](https://github.com/Herculoxz/DSP-ON-FPGA-)and access the code and its testbench.
- Change the input image values in the testbench as per your image . The input image must be 9x9 and the input must be given in the form of 9 elements at once , i.e operation on one 3x3 matrix at a time.
- You can test the code using either icarus verilog & gtkwave or any other verilog compiler and simulator and check the output signals and debug the code if required.
- Hope this helps you ;)
