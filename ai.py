#Code to train AI model
from ultralytics import YOLO

model = YOLO("yolov8n.yaml")
model = YOLO("yolov8n.pt")

model.train(data="D:\PythonPECHACKS\custom_yaml.yaml",epochs=10 0)
metrics = model.val()
path = model.export(format="onnx")
