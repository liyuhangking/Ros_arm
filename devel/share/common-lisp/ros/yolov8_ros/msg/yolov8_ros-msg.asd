
(cl:in-package :asdf)

(defsystem "yolov8_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Detection3D" :depends-on ("_package_Detection3D"))
    (:file "_package_Detection3D" :depends-on ("_package"))
  ))