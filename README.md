# Project 5: Medical Image Classifier with Explainability

## How to Run the Application

TODO

## High-Level Description

This project involves building an image classification system for a medical imaging task, such as detecting pneumonia from chest X-rays or diabetic retinopathy from retinal images. The emphasis is on both accuracy and interpretability—your model must not only predict the correct class but also offer visual explanations using techniques like Grad-CAM or integrated gradients. The project simulates real-world expectations for explainable AI in healthcare and high-stakes domains.

## Software Requirements

### Basic Functionality:
- Load and preprocess a medical image dataset (e.g., Chest X-ray, Retinopathy, Skin Lesion).
- Train a CNN-based classifier with appropriate evaluation metrics (e.g., AUC, precision/recall).
- Save the trained model and generate prediction outputs.

### Explainability:
- Implement at least one method for visual explanation (e.g., Grad-CAM, LIME, SHAP).
- Generate visual overlays on images showing the region of attention.
- Save these explanations for later review.

### Evaluation:
- Compute metrics appropriate to imbalanced datasets (e.g., confusion matrix, ROC curves).
- Include error analysis or discussion of failure modes.

### Optional Advanced Features:
- Build a simple UI to browse predictions and explanations.
- Use ensemble models or advanced architectures (e.g., EfficientNet, Vision Transformers).
- Compare multiple explainability methods.

## Acceptance Criteria:

### Functionality:
- Trained model achieves reasonable accuracy on test data (>= 85% preferred).
- Explanations are visualized and interpretable.

### Usability:
- Scripts to run predictions and generate explanations are clear.
- Output files are labeled and accessible.

### Code Quality:
- Clean structure with reusable components.
- Documented preprocessing, training, and explanation steps.

### Interpretability:
- Visual explanation highlights match known anatomical relevance.
- Tools used are scientifically defensible (e.g., Grad-CAM on CNNs).

## Rubric:

### Basic Functionality (40 points):
- Data loading and preprocessing (10 points)
- CNN training and evaluation (10 points)
- Prediction generation and output saving (10 points)
- Use of appropriate metrics (10 points)

### Explainability (20 points):
- Grad-CAM or equivalent implemented (10 points)
- Visual overlays saved and interpretable (10 points)

### Evaluation and Analysis (10 points):
- ROC curves, confusion matrix, or other error analysis (10 points)

### Code Quality and Reproducibility (20 points):
- Modular code and documentation (10 points)
- Environment and config management (10 points)

### Advanced Features (Optional - 20 points):
- UI for browsing, multiple explainability tools, model ensembling (10–20 points)

**Total: 120 points (100 if advanced features are not implemented)**

