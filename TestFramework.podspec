Pod::Spec.new do |s|
  s.name         = "TestFramework"
  s.version      = "1.0.0"
  s.summary      = "Test Framework for iOS"
  s.description  = "Any text"
  s.homepage     = "https://github.com/zhukov-ever/TestFramework"
  s.license      = "MIT"
  s.author       = "Nikita Zhukov"
  s.platform     = :ios, "12.0"
  s.source       = { :git => "https://github.com/zhukov-ever/TestFramework.git", :tag => "#{s.version}" }
 # s.frameworks   = 'UIKit'
  s.dependency 'CryptoSwift', '~> 1.0'
  s.dependency 'SwiftProtobuf', '~> 1.0'
  s.dependency 'Curve25519'
  s.ios.vendored_frameworks = "Framework/TestFramework.framework"
  s.swift_version = "5.2"
end
