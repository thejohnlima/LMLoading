Pod::Spec.new do |s|
  s.name               = "LMLoading"
  s.version            = "1.0.4"
  s.summary            = "LMLoading Framework"
  s.description        = "LMLoading is the best and easy way to show an loading in your view"
  s.requires_arc       = true
  s.homepage           = "https://github.com/thejohnlima/LMLoading"
  s.license            = "MIT"
  s.author             = { "John Lima" => "thejohnlima@icloud.com" }
  s.social_media_url   = "https://twitter.com/thejohnlima"
  s.platform           = :ios, "12.1"
  s.source             = { :git => "https://github.com/thejohnlima/LMLoading.git", :tag => "#{s.version}" }
  s.framework          = "UIKit"
  s.source_files       = "Framework/LMLoading/**/*.{swift}"
  s.resources          = "Framework/LMLoading/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,ttf,json}"
  s.swift_version      = "5.0"
  s.dependency 'lottie-ios'
end
