// Auto-generated. Do not edit!

// (in-package xarm_vision.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class CallPickPlaceDemoRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.call = null;
    }
    else {
      if (initObj.hasOwnProperty('call')) {
        this.call = initObj.call
      }
      else {
        this.call = new std_msgs.msg.Empty();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CallPickPlaceDemoRequest
    // Serialize message field [call]
    bufferOffset = std_msgs.msg.Empty.serialize(obj.call, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CallPickPlaceDemoRequest
    let len;
    let data = new CallPickPlaceDemoRequest(null);
    // Deserialize message field [call]
    data.call = std_msgs.msg.Empty.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xarm_vision/CallPickPlaceDemoRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '22a4d46e3805f1c07152518d635b48f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Empty call
    
    ================================================================================
    MSG: std_msgs/Empty
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CallPickPlaceDemoRequest(null);
    if (msg.call !== undefined) {
      resolved.call = std_msgs.msg.Empty.Resolve(msg.call)
    }
    else {
      resolved.call = new std_msgs.msg.Empty()
    }

    return resolved;
    }
};

class CallPickPlaceDemoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CallPickPlaceDemoResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CallPickPlaceDemoResponse
    let len;
    let data = new CallPickPlaceDemoResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xarm_vision/CallPickPlaceDemoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CallPickPlaceDemoResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: CallPickPlaceDemoRequest,
  Response: CallPickPlaceDemoResponse,
  md5sum() { return '944b50764da9aeda66eb9649bd9519f2'; },
  datatype() { return 'xarm_vision/CallPickPlaceDemo'; }
};
