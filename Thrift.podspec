#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Thrift"
  s.version          = "20160209"
  s.summary          = "Cocoa fork of Thrift framework"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Generated Obj-C / Cocoa code for Thrift.
                       DESC

  s.homepage         = "https://github.com/eysteinbye/thrift"
  s.license          = 'Proprietary'
  s.author           = { "Mr. Jenkins" => "jenkins-ops@zedge.net" }
  s.source           = { :git => "https://github.com/eysteinbye/thrift.git", :branch => "master" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = "lib/cocoa/src/*.{h,m}", "lib/cocoa/src/protocol/*.{h,m}", "lib/cocoa/src/server/*.{h,m}", "lib/cocoa/src/transport/*.{h,m}"

  s.public_header_files = "lib/cocoa/src/*.h", "lib/cocoa/src/protocol/*.h", "lib/cocoa/src/server/*.h", "lib/cocoa/src/transport/*.h"

end

