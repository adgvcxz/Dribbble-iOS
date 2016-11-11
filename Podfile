platform :ios, '9.0'
use_frameworks!
target 'dribbble' do
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
    pod 'RxDataSources', '~> 1.0'
    pod 'Moya', '8.0.0-beta.4'
    pod 'Moya/RxSwift'
    pod 'R.swift'
    pod 'ObjectMapper', '~> 2.2'
    pod 'R.swift'
    pod 'Kingfisher'
    pod 'SnapKit', '~> 3.0.2'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = "3.0"
        end
    end
end
