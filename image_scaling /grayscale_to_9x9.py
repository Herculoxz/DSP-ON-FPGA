import cv2

# Load the image
image = cv2.imread('/home/abhinav/Documents/verilog/nine_img.png')

# Convert the image to grayscale
gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Resize the image to 9x9 using interpolation
small_image = cv2.resize(gray_image, (9, 9), interpolation=cv2.INTER_AREA)

# Save the result
cv2.imwrite('/home/abhinav/Documents/verilog/output_image.png', small_image)

# Release the image
cv2.destroyAllWindows()
