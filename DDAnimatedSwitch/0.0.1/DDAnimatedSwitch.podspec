Pod::Spec.new do |spec|

	spec.name 		= "DDAnimatedSwitch"
	spec.platform 		= :ios
	spec.summary 		= "DDAnimatedSwitch allows a user to create animated switch"
	spec.requires_arc 	= true
	spec.version 		= "0.0.1"
	spec.license 		= { :type => "MIT", :file => "LICENSE" }	
	spec.author 		= { "Dmitriy Dotsenko" => "d.dotsenko@icloud.com" }
	spec.homepage 		= "https://github.com/d-dotsenko/DDAnimatedSwitch"
	spec.source 		= { :git => "https://github.com/d-dotsenko/DDAnimatedSwitch.git", :tag => "#{spec.version}" }
	spec.frameworks 	= "UIKit"
	spec.source_files 	= "DDAnimatedSwitch/**/*.{h,swift}"
	spec.swift_version 	= "4.2"
	spec.ios.deployment_target 	= "9.0"
end
