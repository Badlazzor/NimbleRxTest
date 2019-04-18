Pod::Spec.new do |s|
  s.name          = 'NimbleRxTest'
  s.version       = '1.0.0'
  s.license       = { :type => "MIT", :file => "LICENSE.md" }
  s.homepage      = 'https://github.com/Badlazzor/NimbleRxTest'
  s.authors       = { 'Balázs Hajagos' => 'badlazzor@gmail.com' }
  s.summary       = "NimbleRxTest couples together RxTest and Nimble from Quick"
  s.description   = <<-DESC
This tiny helper library helps connecting one of the most popular testing library for swift (Quick) with the reactive world. First when I had to write tests for a reactive project I was struggling with RxBlocking or event unwrapping usually using .debug() to help understanding what is exactly happening in a reactive chain. After a while I thought "Oh, come on! I have this lovely Nimble thingy and I know XCAssert helper things was created for RxTest, why not do the same in Nimble?". Before I realised I used the same code to help me with binding Nimble and Rx together in 3 or 4 projects copying the same files in every one of them.

And so the NimbleRxTest lib was born.
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
