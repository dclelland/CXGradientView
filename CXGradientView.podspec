#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name                    = "CXGradientView"
  s.version                 = "0.0.2"
  s.summary                 = "Ultra-basic UIView/CAGradientLayer class. Animates using CATransaction."
  s.homepage                = "https://github.com/dclelland/CXGradientView"
  s.license                 = { :type => 'MIT' }
  s.author                  = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  s.source                  = { :git => "https://github.com/dclelland/CXGradientView.git", :tag => "0.0.2" }
  s.platform                = :ios, '6.1'
  s.ios.deployment_target   = '6.1'
  s.ios.source_files        = 'CXGradientView/*.{h,m}'
  s.requires_arc            = true
end