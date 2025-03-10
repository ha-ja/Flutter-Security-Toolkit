#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_security_toolkit.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_security_toolkit'
  s.version          = '1.0.1'
  s.summary          = 'Internal flutter_security_toolkit'
  s.description      = <<-DESC
Internal flutter_security_toolkit
                       DESC
  s.homepage         = 'https://pub.dev/packages/flutter_security_toolkit'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Exxeta' => 'denis.dobanda@exxeta.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'
  s.dependency 'SecurityToolkit', '~> 1.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
