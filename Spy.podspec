Pod::Spec.new do |spec|
  spec.name         = "Spy"
  spec.version      = "0.0.1"
  spec.summary      = "Spy is a simple, lightweight logging utility that allows to log with different levels and on different channgels written in pure Swift."
  spec.homepage     = "https://github.com/appunite/Spy"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author       = { "Tomasz Lewandowski" => "tomasz.t.lewandowski@gmail.com" }
  spec.source       = { :git => "https://https://github.com/appunite/Spy.git", :tag => "#{spec.version}" }
  spec.source_files  = "Spy/**/*.swift"
  spec.swift_versions = "5.1"
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.tvos.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
end