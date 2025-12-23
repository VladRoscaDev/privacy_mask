#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint privacy_mask.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'privacy_mask'
  s.version          = '1.0.0'
  s.summary          = 'Flutter widget to prevent screenshots and screen recordings.'
  s.description      = <<-DESC
A Flutter plugin that provides a native bridge to prevent sensitive content 
from being captured via screenshots or screen recordings on iOS and Android.
                       DESC
  s.homepage         = 'https://github.com/YOUR_USERNAME/privacy_mask'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Name' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # Important for 2025 App Store compliance:
  s.resource_bundles = {'privacy_mask_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end