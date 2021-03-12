import cv2
import time
import numpy

# inicitalizar camara
video = cv2.VideoCapture(0)

# captura de frames
check, frame = video.read()

print(check)
# esta es la imagen
print(frame)

# llevar a escala de grises
imagenGrises = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

# imagen con bordes detectados
borders = frame

# detectar bordes
for i in range(0, 479):
    for j in range(0, 639):
        borders[i, j] = (frame[i + 1, j] - frame[i, j]) + (frame[i, j + 1] - frame[i, j])
# imagen en esacala de grises
cv2.imshow("capturing", borders)
key = cv2.waitKey(0)

video.release()






