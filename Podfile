platform :ios, '12.0'
use_frameworks!

target 'NimbleRxTest' do

    pod 'Nimble'
    pod 'RxSwift'
    pod 'RxTest'

    target 'NimbleRxTestTests' do
        inherit! :search_paths
        pod 'Quick'

        # CocoaPods... don't even ask... ( https://github.com/CocoaPods/CocoaPods/issues/4752#issuecomment-305101269 )
        pod 'Nimble'
        pod 'RxSwift'
        pod 'RxTest'
    end

end
