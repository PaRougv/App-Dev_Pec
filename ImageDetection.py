from ultralytics import YOLO
import cv2
import math
import cvzone

cap = cv2.VideoCapture("D:/PythonPECHACKS/videoplayback (1).mp4")
cap.set(3, 1280)
cap.set(4, 720)

model = YOLO("D:/PythonPECHACKS/runs/detect/train8/weights/best.pt")

class_names = ["treedamage", "buildingdamage"]

while True:
    success, img = cap.read()
    results = model(img, stream=True)
    for r in results:
        boxes = r.boxes
        for box in boxes:
            x1, y1, x2, y2 = box.xyxy[0]
            x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
            cv2.rectangle(img, (x1, y1), (x2, y2), (255, 0, 255), 3)

            conf = math.ceil((box.conf[0] * 100)) / 100
            cls = int(box.cls[0])

            label = class_names[cls]
            text = f"{label} {conf}"
            cv2.putText(img, text, (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2)

    cv2.imshow("Image", img)
    key = cv2.waitKey(1)
    if key == 27:
        break

cap.release()
cv2.destroyAllWindows()
