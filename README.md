# Project 4: Real-Time Sign Language Classifier

## How to Run the Application

TODO 

## High-Level Description

This project involves building an image classification system to recognize hand gestures from the American Sign Language (ASL) alphabet. The system will be trained using a labeled dataset of gesture images and extended to support real-time prediction from a webcam feed. The goal is to demonstrate knowledge of image preprocessing, CNN architecture design, real-time inference, and optionally edge deployment. This project blends classical image classification with practical computer vision implementation.

## Software Requirements

### Basic Functionality:
- Train a convolutional neural network on the ASL alphabet dataset (e.g., from Kaggle).
- Evaluate the model on a test set with accuracy or F1 score.
- Save the trained model for inference.

### Real-Time Classification:
- Capture frames from a webcam using OpenCV.
- Apply preprocessing to extract hand region and match training format.
- Use the trained model to predict gestures in real time.
- Display live video feed with overlaid predictions.

### Preprocessing:
- Resize and normalize input images.
- Convert color channels and apply background filtering (if needed).
- Optional: Hand detection or segmentation before classification.

### Optional Advanced Features:
- Add sequence-level modeling to recognize whole words.
- Deploy the classifier to mobile or edge devices.
- Add gesture-based control (e.g., "open app" with a specific sign).

## Acceptance Criteria:

### Functionality:
- The model trains and achieves at least 80% accuracy on the test set.
- Real-time predictions work on live webcam input.

### Usability:
- Output predictions are overlaid on live video.
- Frame rate is responsive (>= 10 FPS preferred).

### Code Quality:
- Training and inference logic are modular and clean.
- Configuration and logging are included.

### Preprocessing Pipeline:
- Input frames are normalized correctly.
- Optional: additional hand segmentation adds robustness.

## Rubric:

### Basic Functionality (40 points):
- Model trains on ASL data (10 points)
- Evaluation metrics reported (10 points)
- Model saves and loads correctly (10 points)
- Working real-time prediction (10 points)

### Real-Time System (20 points):
- Webcam feed integration and frame processing (10 points)
- Responsive output with overlaid predictions (10 points)

### Preprocessing and Data Handling (10 points):
- Image normalization and consistency (5 points)
- Hand detection/filtering (5 points)

### Code Quality and Modularity (20 points):
- Clean architecture and modular files (10 points)
- Reproducible training/inference pipelines (10 points)

### Advanced Features (Optional - 20 points):
- Word-level prediction, mobile deployment, gesture interaction (10–20 points)

**Total: 120 points (100 if advanced features are not implemented)**

