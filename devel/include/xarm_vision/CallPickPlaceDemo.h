// Generated by gencpp from file xarm_vision/CallPickPlaceDemo.msg
// DO NOT EDIT!


#ifndef XARM_VISION_MESSAGE_CALLPICKPLACEDEMO_H
#define XARM_VISION_MESSAGE_CALLPICKPLACEDEMO_H

#include <ros/service_traits.h>


#include <xarm_vision/CallPickPlaceDemoRequest.h>
#include <xarm_vision/CallPickPlaceDemoResponse.h>


namespace xarm_vision
{

struct CallPickPlaceDemo
{

typedef CallPickPlaceDemoRequest Request;
typedef CallPickPlaceDemoResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct CallPickPlaceDemo
} // namespace xarm_vision


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::xarm_vision::CallPickPlaceDemo > {
  static const char* value()
  {
    return "944b50764da9aeda66eb9649bd9519f2";
  }

  static const char* value(const ::xarm_vision::CallPickPlaceDemo&) { return value(); }
};

template<>
struct DataType< ::xarm_vision::CallPickPlaceDemo > {
  static const char* value()
  {
    return "xarm_vision/CallPickPlaceDemo";
  }

  static const char* value(const ::xarm_vision::CallPickPlaceDemo&) { return value(); }
};


// service_traits::MD5Sum< ::xarm_vision::CallPickPlaceDemoRequest> should match
// service_traits::MD5Sum< ::xarm_vision::CallPickPlaceDemo >
template<>
struct MD5Sum< ::xarm_vision::CallPickPlaceDemoRequest>
{
  static const char* value()
  {
    return MD5Sum< ::xarm_vision::CallPickPlaceDemo >::value();
  }
  static const char* value(const ::xarm_vision::CallPickPlaceDemoRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::xarm_vision::CallPickPlaceDemoRequest> should match
// service_traits::DataType< ::xarm_vision::CallPickPlaceDemo >
template<>
struct DataType< ::xarm_vision::CallPickPlaceDemoRequest>
{
  static const char* value()
  {
    return DataType< ::xarm_vision::CallPickPlaceDemo >::value();
  }
  static const char* value(const ::xarm_vision::CallPickPlaceDemoRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::xarm_vision::CallPickPlaceDemoResponse> should match
// service_traits::MD5Sum< ::xarm_vision::CallPickPlaceDemo >
template<>
struct MD5Sum< ::xarm_vision::CallPickPlaceDemoResponse>
{
  static const char* value()
  {
    return MD5Sum< ::xarm_vision::CallPickPlaceDemo >::value();
  }
  static const char* value(const ::xarm_vision::CallPickPlaceDemoResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::xarm_vision::CallPickPlaceDemoResponse> should match
// service_traits::DataType< ::xarm_vision::CallPickPlaceDemo >
template<>
struct DataType< ::xarm_vision::CallPickPlaceDemoResponse>
{
  static const char* value()
  {
    return DataType< ::xarm_vision::CallPickPlaceDemo >::value();
  }
  static const char* value(const ::xarm_vision::CallPickPlaceDemoResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // XARM_VISION_MESSAGE_CALLPICKPLACEDEMO_H
