Pod::Spec.new do |s|
  s.name          = "BasisPay"
  s.version       = "1.0.0"
  s.summary       = "iOS SDK for Hello World"
  s.description   = "iOS SDK for Hello World, including example app"
  s.homepage      = "https://github.com/Baabujiventuress/BasisPay-IOS-KIT"
  s.license       = "MIT"
  s.author        = "Basis Pay"
  s.platform      = :ios, "11.0"
  s.vendored_frameworks = 'BasisPay.xcframework'
  s.swift_version = "5.0"
  s.source        = {
    :git => "https://github.com/Baabujiventuress/BasisPay-IOS-KIT.git",
    :tag => "#{s.version}"
  }
 end