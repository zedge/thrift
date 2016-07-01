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

public class TMemoryBuffer: TTransport {
  public static let garbageBufferSize = 4096 // 4KiB

  private var buffer = Data()
  var bufferOffset = 0
  
  public convenience init(data: Data) {
    self.init()
    self.buffer = data
    self.bufferOffset = 0
  }

  // Mark: - TTransport
  public func readAll(size: Int) throws -> Data {
    let read = try self.read(size: size)
    if read.count != size {
      // report an end of file exception
      throw TTransportError(error: .endOfFile)
    }
    return read
  }
  
  public func read(size: Int) throws -> Data {
    let avail = buffer.count - bufferOffset
    if avail == 0 { return Data() }


    let out = buffer.subdata(in: bufferOffset..<(bufferOffset + min(size, avail)))
    bufferOffset += out.count
    
    if bufferOffset >= TMemoryBuffer.garbageBufferSize {
      buffer = Data()
      bufferOffset = 0
    }
    
    return out
  }
  
  public func write(data: Data) throws {
    buffer.append(data)
  }
  
  public func flush() throws {
    return
  }
}

