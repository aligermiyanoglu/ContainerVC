#
# Be sure to run `pod lib lint ContainerVC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ContainerVC'
  s.version          = '1.0.0'
  s.summary          = 'ContainerVC is a custom container view controller which subclasses UINavigationController for basic customization.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	ContainerVC is a custom container view controller which subclasses UINavigationController for basic customization. In order to customize animation transitions, UINavigationController Delegate class is manipulated. Because of this, it should be noted that ordinary delegate method would not be working as usual. ContainerNavigationDelegate can be used as standard delegate implementation
                       DESC

  s.homepage         = 'https://github.com/aligermiyanoglu/ContainerVC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aligermiyanoglu' => 'anibal23736@hotmail.com' }
  s.source           = { :git => 'https://github.com/aligermiyanoglu/ContainerVC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.source_files = 'ContainerVC/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ContainerVC' => ['ContainerVC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
