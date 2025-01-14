
(cl:in-package :asdf)

(defsystem "xarm_vision-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CallPickPlaceDemo" :depends-on ("_package_CallPickPlaceDemo"))
    (:file "_package_CallPickPlaceDemo" :depends-on ("_package"))
  ))