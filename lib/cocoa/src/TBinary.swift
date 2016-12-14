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

import Foundation


public struct TBinary : TSerializable {
  
  public static var thriftType : TType { return .STRING }
  
  fileprivate var storage : Data
  
  public init() {
    self.storage = Data()
  }
  
  public init(contentsOfFile file: String, options: NSData.ReadingOptions = []) throws {
    self.storage = try Data(contentsOf: URL(fileURLWithPath: file), options: options)
  }
  
  public init(contentsOfURL URL: Foundation.URL, options: NSData.ReadingOptions = []) throws {
    self.storage = try Data(contentsOf: URL, options: options)
  }
  
  public init?(base64EncodedData base64Data: Data, options: NSData.Base64DecodingOptions = []) {
    guard let storage = Data(base64Encoded: base64Data, options: options) else {
      return nil
    }
    self.storage = storage
  }
  
  public init(data: Data) {
    self.storage = data
  }
  
  public var length : Int {
    return storage.count
  }
  
  public var hashValue : Int {
    return storage.hashValue
  }
  
  public var bytes : UnsafeRawPointer {
    return (storage as NSData).bytes
  }
  
  public func getBytes(_ buffer: UnsafeMutableRawPointer, length: Int) {
    (storage as NSData).getBytes(buffer, length: length)
  }
  
  public func getBytes(_ buffer: UnsafeMutableRawPointer, range: Range<Int>) {
    (storage as NSData).getBytes(buffer, range: NSRange(range))
  }
  
  public func subBinaryWithRange(_ range: Range<Int>) -> TBinary {
    return TBinary(data: storage.subdata(in: Range(range)))
  }
  
  public func writeToFile(_ path: String, options: NSData.WritingOptions = []) throws {
    try storage.write(to: URL(fileURLWithPath: path), options: options)
  }
  
  public func writeToURL(_ url: URL, options: NSData.WritingOptions = []) throws {
    try storage.write(to: url, options: options)
  }
  
  public func rangeOfData(dataToFind data: Data, options: NSData.SearchOptions, range: Range<Int>) -> Range<Int>? {
    return storage.range(of: data, options: options, in: Range(range))
  }
  
  public func enumerateByteRangesUsingBlock(_ block: (UnsafeBufferPointer<UInt8>, Data.Index, inout Bool) -> Void) {
    storage.enumerateBytes { bytes, range, stop in
      block(bytes, range, &stop)
    }
  }
  
  public static func readValueFromProtocol(_ proto: TProtocol) throws -> TBinary {
    var data = NSData()
    try proto.readBinary(&data)
    return TBinary(data: data as Data)
  }
  
  public static func writeValue(_ value: TBinary, toProtocol proto: TProtocol) throws {
    try proto.writeBinary(value.storage)
  }
  
}

extension TBinary : CustomStringConvertible, CustomDebugStringConvertible {
  
  public var description : String {
    return storage.description
  }
  
  public var debugDescription : String {
    return storage.debugDescription
  }
  
}

public func ==(lhs: TBinary, rhs: TBinary) -> Bool {
  return lhs.storage == rhs.storage
}
