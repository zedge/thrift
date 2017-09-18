#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "Thrift"
s.version          = "20170918.3"
s.summary          = "Thrift framework in Swift 3.0"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
s.description      = "Thrift framework in Swift 3.0"

s.homepage         = "https://github.com/eysteinbye/thrift"
s.license          = 'Proprietary'
s.author           = { "Mr. Jenkins" => "jenkins-ops@zedge.net" }

s.platform     = :ios, '9.0'
s.requires_arc = true

s.source       = { :path => "." }

s.source_files = 
"LinuxHelper.swift", 
    "TApplicationError.swift", 
    "TBinary.swift", 
    "TBinaryProtocol.swift", 
    "TClient.swift", 
    "TCompactProtocol.swift", 
    "TEnum.swift", 
    "TError.swift", 
    "TFileHandleTransport.swift", 
    "TFileTransport.swift", 
    "TFramedTransport.swift", 
    "THTTPSessionTransport.swift", 
    "TList.swift", 
    "TMap.swift", 
    "TMemoryBufferTransport.swift", 
    "TMultiplexedProtocol.swift", 
    "TProcessor.swift", 
    "TProtocol.swift", 
    "TProtocolError.swift", 
    "TSSLSocketTransport.swift", 
    "TSSLSocketTransportError.swift", 
    "TSerializable.swift", 
    "TSet.swift", 
    "TSocketServer.swift", 
    "TSocketTransport.swift", 
    "TStreamTransport.swift", 
    "TStruct.swift", 
    "TTransport.swift", 
    "TTransportError.swift", 
    "TWrappedProtocol.swift", 
    "Thrift.swift"

    s.module_name  = "Thrift"

end

