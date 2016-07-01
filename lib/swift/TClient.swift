/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */


public class TClient {
  public let inProtocol: TProtocol
  public let outProtocol: TProtocol
  
  public init(inoutProtocol: TProtocol) {
    self.inProtocol = inoutProtocol
    self.outProtocol = inoutProtocol
  }
  
  public init(inProtocol: TProtocol, outProtocol: TProtocol) {
    self.inProtocol = inProtocol
    self.outProtocol = outProtocol
  }
}

public class TAsyncClient {
  public let protocolFactory: TProtocolFactory
  public let transportFactory: TAsyncTransportFactory
  
  public init(with protocolFactory: TProtocolFactory, transportFactory: TAsyncTransportFactory) {
    self.protocolFactory = protocolFactory
    self.transportFactory = transportFactory
  }
}

//public struct TResult<T : TSerializable> : TStruct {
//  var success: T?
//  
//  public init(name: String? = nil, success: T? = nil) {
//    self.success = success
//    if let name = name {
//      structName = name
//    }
//  }
//  
//  // Mark: TStruct
//  
//  public static var fieldIds: [String : Int32] { return ["success": 0] }
//  public static var thriftType: TType { return .struct }
//  
//  // Set in initializer
//  public private(set) var structName = ""
//
//  public static func read(from proto: TProtocol) throws -> TResult<T> {
//    _ = try proto.readStructBegin()
//    var success: T?
//    var exc: ErrorProtocol?
//    fields: while true {
//      
//      let (_, fieldType, fieldID) = try proto.readFieldBegin()
//      
//      switch (fieldID, fieldType) {
//      case (_, .stop):            break fields
//      case (0, T.thriftType):     success = try T.read(from: proto)
//      case let (_, unknownType):  try proto.skipType(unknownType)
//      }
//      
//      try proto.readFieldEnd()
//    }
//    
//    try proto.readStructEnd()
//    
//    return TResult<T>(success: success)
//  }
//}
//
//
//public struct TThrowingResult<T : TSerializable, E : TStruct> : TStruct {
//  var success: T?
//  var exc: E?
//  
//  public init(name: String? = nil, success: T? = nil, exc: E? = nil) {
//    self.success = success
//    self.exc = exc
//    if let name = name {
//      structName = name
//    }
//  }
//  
//  // Mark: TStruct
//  
//  public static var fieldIds: [String : Int32] { return ["success": 0, "exc": 1] }
//  public static var thriftType: TType { return .struct }
//  
//  // Not needed since just for reading
//  public private(set) var structName = ""
//  
//  public static func read(from proto: TProtocol) throws -> TThrowingResult<T, E> {
//    _ = try proto.readStructBegin()
//    var success: T?
//    var exc: E?
//    fields: while true {
//      
//      let (_, fieldType, fieldID) = try proto.readFieldBegin()
//      
//      switch (fieldID, fieldType) {
//      case (_, .stop):            break fields
//      case (0, T.thriftType):     success = try T.read(from: proto)
//      case (1, .struct):          exc = try E.read(from: proto)
//      case let (_, unknownType):  try proto.skipType(unknownType)
//      }
//      
//      try proto.readFieldEnd()
//    }
//    
//    try proto.readStructEnd()
//    
//    return TThrowingResult<T, E>(success: success, exc: exc)
//  }
//}
