Pod::Spec.new do |s|
  s.name          = 'NimbleRxTest'
  s.version       = '1.0.0'
  s.license       = { :type => "MIT", :file => "LICENSE.md" }
  s.homepage      = 'https://github.com/Badlazzor/NimbleRxTest'
  s.authors       = { 'Balázs Hajagos' => 'badlazzor@gmail.com' }
  s.summary       = "NimbleRxTest couples together RxTest and Nimble from Quick"
  s.description   = <<-DESC
NimbleRxTest couples together RxTest and Nimble from Quick
                       DESC
  s.source        = { :git => 'https://github.com/Badlazzor/NimbleRxTest.git', :tag => s.version.to_s }
  s.requires_arc  = true
  s.swift_version = '4.2'

  s.source_files   = 'NimbleRxTest/**/*.{swift,h,m}'
  s.ios.deployment_target  = '9.0'

  s.dependency 'Nimble'
  s.dependency 'Quick'
  s.dependency 'RxSwift'
  s.dependency 'RxTest'
end
