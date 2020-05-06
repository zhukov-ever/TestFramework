Pod::Spec.new do |s|
  s.name         = "MyKit"
  s.version      = "1.0.0"
  s.summary      = "MyKit for iOS"
  s.description  = "Any text"
  s.homepage     = "https://github.com/atereshkov/mykit"
  s.license      = "MIT"
  s.author    = "Nikita Zhukov"
  s.platform = :ios, "12.0"
  s.source       = { :git => "https://github.com/atereshkov/mykit.git", :tag => "#{s.version}" }
  s.frameworks = 'UIKit', 'WebKit'
  s.dependency 'Alamofire', '~> 4.8'
  s.ios.vendored_frameworks = "Framework/TestFramework.framework"
  s.swift_version = "4.2"
end
