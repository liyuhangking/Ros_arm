;; Auto-generated. Do not edit!


(when (boundp 'xarm_vision::CallPickPlaceDemo)
  (if (not (find-package "XARM_VISION"))
    (make-package "XARM_VISION"))
  (shadow 'CallPickPlaceDemo (find-package "XARM_VISION")))
(unless (find-package "XARM_VISION::CALLPICKPLACEDEMO")
  (make-package "XARM_VISION::CALLPICKPLACEDEMO"))
(unless (find-package "XARM_VISION::CALLPICKPLACEDEMOREQUEST")
  (make-package "XARM_VISION::CALLPICKPLACEDEMOREQUEST"))
(unless (find-package "XARM_VISION::CALLPICKPLACEDEMORESPONSE")
  (make-package "XARM_VISION::CALLPICKPLACEDEMORESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass xarm_vision::CallPickPlaceDemoRequest
  :super ros::object
  :slots (_call ))

(defmethod xarm_vision::CallPickPlaceDemoRequest
  (:init
   (&key
    ((:call __call) (instance std_msgs::Empty :init))
    )
   (send-super :init)
   (setq _call __call)
   self)
  (:call
   (&rest __call)
   (if (keywordp (car __call))
       (send* _call __call)
     (progn
       (if __call (setq _call (car __call)))
       _call)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Empty _call
    (send _call :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Empty _call
       (send _call :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Empty _call
     (send _call :deserialize buf ptr-) (incf ptr- (send _call :serialization-length))
   ;;
   self)
  )

(defclass xarm_vision::CallPickPlaceDemoResponse
  :super ros::object
  :slots (_success ))

(defmethod xarm_vision::CallPickPlaceDemoResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass xarm_vision::CallPickPlaceDemo
  :super ros::object
  :slots ())

(setf (get xarm_vision::CallPickPlaceDemo :md5sum-) "944b50764da9aeda66eb9649bd9519f2")
(setf (get xarm_vision::CallPickPlaceDemo :datatype-) "xarm_vision/CallPickPlaceDemo")
(setf (get xarm_vision::CallPickPlaceDemo :request) xarm_vision::CallPickPlaceDemoRequest)
(setf (get xarm_vision::CallPickPlaceDemo :response) xarm_vision::CallPickPlaceDemoResponse)

(defmethod xarm_vision::CallPickPlaceDemoRequest
  (:response () (instance xarm_vision::CallPickPlaceDemoResponse :init)))

(setf (get xarm_vision::CallPickPlaceDemoRequest :md5sum-) "944b50764da9aeda66eb9649bd9519f2")
(setf (get xarm_vision::CallPickPlaceDemoRequest :datatype-) "xarm_vision/CallPickPlaceDemoRequest")
(setf (get xarm_vision::CallPickPlaceDemoRequest :definition-)
      "std_msgs/Empty call

================================================================================
MSG: std_msgs/Empty
---
bool success

")

(setf (get xarm_vision::CallPickPlaceDemoResponse :md5sum-) "944b50764da9aeda66eb9649bd9519f2")
(setf (get xarm_vision::CallPickPlaceDemoResponse :datatype-) "xarm_vision/CallPickPlaceDemoResponse")
(setf (get xarm_vision::CallPickPlaceDemoResponse :definition-)
      "std_msgs/Empty call

================================================================================
MSG: std_msgs/Empty
---
bool success

")



(provide :xarm_vision/CallPickPlaceDemo "944b50764da9aeda66eb9649bd9519f2")


