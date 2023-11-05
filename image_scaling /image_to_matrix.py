import cv2
import numpy as np

# Load the 9x9 grayscale image
image = cv2.imread('/home/abhinav/Documents/verilog/output_image.png', cv2.IMREAD_GRAYSCALE)

# Ensure the image is resized to 9x9 (in case it's not)
image = cv2.resize(image, (9, 9), interpolation=cv2.INTER_AREA)

# Convert the image to a NumPy array
image_matrix = np.array(image)

# Print the 9x9 matrix
print(image_matrix)
