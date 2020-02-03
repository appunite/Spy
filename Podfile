# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
project 'Spy.xcodeproj'
 
use_frameworks!

target 'Example' do
  platform :macos, '10.10'
  pod 'SwiftLint'
end

target 'Spy_macOS' do
  platform :macos, '10.10'
  pod 'SwiftLint'

  # Pods for Spy

  target 'SpyTests_macOS' do
    # Pods for testing
  	inherit! :search_paths
  	pod 'Sourcery'
  end

end

target 'Spy_iOS' do
  platform :ios, '8.0'
  pod 'SwiftLint'

  # Pods for Spy

  target 'SpyTests_iOS' do
    # Pods for testing
    inherit! :search_paths
    pod 'Sourcery'
  end

end

target 'Spy_tvOS' do
  platform :tvos, '9.0'
  pod 'SwiftLint'

  # Pods for Spy

  target 'SpyTests_tvOS' do
    # Pods for testing
    inherit! :search_paths
    pod 'Sourcery'
  end

end

target 'Spy_watchOS' do
  platform :watchos, '2.0'
  pod 'SwiftLint'

  # Pods for Spy
end