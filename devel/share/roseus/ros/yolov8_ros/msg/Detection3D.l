;; Auto-generated. Do not edit!


(when (boundp 'yolov8_ros::Detection3D)
  (if (not (find-package "YOLOV8_ROS"))
    (make-package "YOLOV8_ROS"))
  (shadow 'Detection3D (find-package "YOLOV8_ROS")))
(unless (find-package "YOLOV8_ROS::DETECTION3D")
  (make-package "YOLOV8_ROS::DETECTION3D"))

(in-package "ROS")
;;//! \htmlinclude Detection3D.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass yolov8_ros::Detection3D
  :super ros::object
  :slots (_header _class_name _confidence _bbox _position ))

(defmethod yolov8_ros::Detection3D
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:class_name __class_name) "")
    ((:confidence __confidence) 0.0)
    ((:bbox __bbox) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _class_name (string __class_name))
   (setq _confidence (float __confidence))
   (setq _bbox __bbox)
   (setq _position __position)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:bbox
   (&optional __bbox)
   (if __bbox (setq _bbox __bbox)) _bbox)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _class_name
    4 (length _class_name)
    ;; float32 _confidence
    4
    ;; float32[] _bbox
    (* 4    (length _bbox)) 4
    ;; float32[] _position
    (* 4    (length _position)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _bbox
     (write-long (length _bbox) s)
     (dotimes (i (length _bbox))
       (sys::poke (elt _bbox i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _bbox
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bbox (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _bbox i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get yolov8_ros::Detection3D :md5sum-) "10feea4dded533dc176309f10ff7df1a")
(setf (get yolov8_ros::Detection3D :datatype-) "yolov8_ros/Detection3D")
(setf (get yolov8_ros::Detection3D :definition-)
      "# Detection3D.msg
std_msgs/Header header
string class_name
float32 confidence
float32[] bbox  # [x_min, y_min, x_max, y_max]
float32[] position  # [x, y, z] (3D position, optional)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :yolov8_ros/Detection3D "10feea4dded533dc176309f10ff7df1a")


