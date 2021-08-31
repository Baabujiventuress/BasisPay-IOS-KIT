Pod::Spec.new do |s|
  s.name          = "BasisPay"
  s.version       = "1.0.7"
  s.summary       = "Payment gateway framework by Basispay team"
  s.description   = "iOS SDK kit for payment gateway transactions within India"
  s.homepage      = "https://github.com/Baabujiventuress/BasisPay-IOS-KIT"
  s.license       = "MIT"
  s.author        = "Basis Pay"
  s.platform      = :ios, "11.0"
  s.vendored_frameworks = 'BasisPaySDK/BasisPay.xcframework'
  s.swift_version = "5.0"
  s.source        = {
    :git => "https://github.com/Baabujiventuress/BasisPay-IOS-KIT.git",
    :tag => "#{s.version}"
  }
 end