Pod::Spec.new do |s|
  s.name         = "UIButton+SBAInspectableHitExtension"
  s.version      = "1.1.0"
  s.summary      = "Extension of UIButton to control it's touch area."
  s.homepage     = "https://github.com/shoaib-akhtar/UIButton-InspectableHitExtension"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Shoaib Akhtar" => "shoaib.akhtar1@live.com" }
  s.source       = { :git => "https://github.com/shoaib-akhtar/UIButton-InspectableHitExtension",
                     :tag => "#{s.version}" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
end
