; Auto-generated. Do not edit!


(cl:in-package xarm_vision-srv)


;//! \htmlinclude CallPickPlaceDemo-request.msg.html

(cl:defclass <CallPickPlaceDemo-request> (roslisp-msg-protocol:ros-message)
  ((call
    :reader call
    :initarg :call
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass CallPickPlaceDemo-request (<CallPickPlaceDemo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CallPickPlaceDemo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CallPickPlaceDemo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xarm_vision-srv:<CallPickPlaceDemo-request> is deprecated: use xarm_vision-srv:CallPickPlaceDemo-request instead.")))

(cl:ensure-generic-function 'call-val :lambda-list '(m))
(cl:defmethod call-val ((m <CallPickPlaceDemo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xarm_vision-srv:call-val is deprecated.  Use xarm_vision-srv:call instead.")
  (call m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CallPickPlaceDemo-request>) ostream)
  "Serializes a message object of type '<CallPickPlaceDemo-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'call) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CallPickPlaceDemo-request>) istream)
  "Deserializes a message object of type '<CallPickPlaceDemo-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'call) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CallPickPlaceDemo-request>)))
  "Returns string type for a service object of type '<CallPickPlaceDemo-request>"
  "xarm_vision/CallPickPlaceDemoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CallPickPlaceDemo-request)))
  "Returns string type for a service object of type 'CallPickPlaceDemo-request"
  "xarm_vision/CallPickPlaceDemoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CallPickPlaceDemo-request>)))
  "Returns md5sum for a message object of type '<CallPickPlaceDemo-request>"
  "944b50764da9aeda66eb9649bd9519f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CallPickPlaceDemo-request)))
  "Returns md5sum for a message object of type 'CallPickPlaceDemo-request"
  "944b50764da9aeda66eb9649bd9519f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CallPickPlaceDemo-request>)))
  "Returns full string definition for message of type '<CallPickPlaceDemo-request>"
  (cl:format cl:nil "std_msgs/Empty call~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CallPickPlaceDemo-request)))
  "Returns full string definition for message of type 'CallPickPlaceDemo-request"
  (cl:format cl:nil "std_msgs/Empty call~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CallPickPlaceDemo-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'call))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CallPickPlaceDemo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CallPickPlaceDemo-request
    (cl:cons ':call (call msg))
))
;//! \htmlinclude CallPickPlaceDemo-response.msg.html

(cl:defclass <CallPickPlaceDemo-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CallPickPlaceDemo-response (<CallPickPlaceDemo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CallPickPlaceDemo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CallPickPlaceDemo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xarm_vision-srv:<CallPickPlaceDemo-response> is deprecated: use xarm_vision-srv:CallPickPlaceDemo-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <CallPickPlaceDemo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xarm_vision-srv:success-val is deprecated.  Use xarm_vision-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CallPickPlaceDemo-response>) ostream)
  "Serializes a message object of type '<CallPickPlaceDemo-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CallPickPlaceDemo-response>) istream)
  "Deserializes a message object of type '<CallPickPlaceDemo-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CallPickPlaceDemo-response>)))
  "Returns string type for a service object of type '<CallPickPlaceDemo-response>"
  "xarm_vision/CallPickPlaceDemoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CallPickPlaceDemo-response)))
  "Returns string type for a service object of type 'CallPickPlaceDemo-response"
  "xarm_vision/CallPickPlaceDemoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CallPickPlaceDemo-response>)))
  "Returns md5sum for a message object of type '<CallPickPlaceDemo-response>"
  "944b50764da9aeda66eb9649bd9519f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CallPickPlaceDemo-response)))
  "Returns md5sum for a message object of type 'CallPickPlaceDemo-response"
  "944b50764da9aeda66eb9649bd9519f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CallPickPlaceDemo-response>)))
  "Returns full string definition for message of type '<CallPickPlaceDemo-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CallPickPlaceDemo-response)))
  "Returns full string definition for message of type 'CallPickPlaceDemo-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CallPickPlaceDemo-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CallPickPlaceDemo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CallPickPlaceDemo-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CallPickPlaceDemo)))
  'CallPickPlaceDemo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CallPickPlaceDemo)))
  'CallPickPlaceDemo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CallPickPlaceDemo)))
  "Returns string type for a service object of type '<CallPickPlaceDemo>"
  "xarm_vision/CallPickPlaceDemo")