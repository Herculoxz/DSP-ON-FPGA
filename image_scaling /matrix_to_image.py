from PIL import Image
import numpy as np

# Given 9x9 matrix
grayscale_matrix = [
    [255, 0, 128, 128, 0, 255, 255, 0, 128],
    [255, 0, 128, 128, 0, 255, 255, 0, 128],
    [255, 0, 128, 128, 0, 255, 255, 0, 128],
    [128, 0, 255, 255, 0, 128, 0, 0, 255],
    [128, 0, 255, 255, 0, 128, 0, 0, 255],
    [128, 0, 255, 255, 0, 128, 0, 0, 255],
    [128, 0, 255, 255, 0, 128, 128, 0, 255],
    [128, 0, 255, 255, 0, 128, 128, 0, 255],
    [128, 0, 255, 255, 0, 128, 128, 0, 255]
]

# Convert the matrix to a NumPy array
grayscale_array = np.array(grayscale_matrix, dtype=np.uint8)

# Create an image from the array
image = Image.fromarray(grayscale_array, mode='L')  # 'L' mode represents grayscale

# Save the image to a file (optional)
image.save("output_image.png")

# Display the image (optional)
image.show()
