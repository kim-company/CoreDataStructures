#
# Be sure to run `pod lib lint CoreDataStructures.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreDataStructures'
  s.version          = '0.1.2'
  s.summary          = 'CoreDataStructures is library of fundamental data structures written in Swift 4.0.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This cocoapod was created for fundamental data structures integration within iOS projects. Swift currently offers Arrays, Sets, and Dictionaries, but these may not be enough in some applications. 
                       DESC

  s.homepage         = 'https://github.com/kim-company/CoreDataStructures.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'michaelcordero' => 'michaelpetercordero@gmail.com' }
  s.source           = { :git => 'https://github.com/kim-company/CoreDataStructures.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.1'

  s.source_files = 'CoreDataStructures/Classes/**/*'

end
