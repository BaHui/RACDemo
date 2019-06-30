platform :ios, '10.0'
inhibit_all_warnings!

target 'BHDemo' do
	pod 'ReactiveObjC', '~> 3.1.0'
end

# DO: Fix pods deployment target version warning !!!
post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
		end
	end
end
