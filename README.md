# Nimble RxTests

[![Build Status](https://api.travis-ci.org/Badlazzor/NimbleRxTest.svg?branch=master)](https://travis-ci.org/Badlazzor/NimbleRxTest)
[![CocoaPods](https://img.shields.io/cocoapods/v/NimbleRxTest.svg)](https://cocoapods.org/pods/NimbleRxTest)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

This tiny helper library helps connecting one of the most popular testing library for swift ([Quick](https://github.com/Quick/Quick)) with the reactive world. First when I had to write tests for a reactive project I was struggling with RxBlocking or event unwrapping usually using _.debug()_ to help understanding what is exactly happening in a reactive chain. After a while I thought "Oh, come on! I have this lovely Nimble thingy and I know XCAssert helper things was created for RxTest, why not do the same in Nimble?". Before I realised I used the same code to help me with binding Nimble and Rx together in 3 or 4 projects copying the same files in every one of them.

And so the NimbleRxTest lib was born.

## Use case

Chances are if you are using [Nimble](https://github.com/Quick/Nimble) __and__ [Quick](https://github.com/Quick/Quick)/[Nimble](https://github.com/Quick/Nimble) you have stumbled upon something like this:

```swift
// Swift

import Quick
import Nimble
import RxSwift
import RxTest

protocol Alive {}
    
struct Fish: Alive {}
struct Shark: Alive {}
struct Boat {}
    
final class Dolphin {
    var soundEmissions: Observable<String> {
        return encounter.flatMapLatest { thing -> Observable<String> in
            switch thing {
            case is Fish:
                return .just("click")
            case is Alive:
                return .just("whistle")
            default:
                return .empty()
            }
        }
    }
    
    let encounter = PublishSubject<Any>()
}

final class FactionSelectionViewModelTests: QuickSpec {
    override func spec() {
        
        describe("a reactive 🐬") {
            var dolphin: Dolphin!
            var testScheduler: TestScheduler!
            var disposeBag: DisposeBag!
            
            beforeEach {
                dolphin = Dolphin()
                testScheduler = TestScheduler(initialClock: 0)
                disposeBag = DisposeBag()
            }
            
            describe("encountering things") {
                var encounters: [Recorded<Event<Any>>]!
                
                context("with a series of things") {
                    beforeEach {
                        encounters = [
                            .next(100, Boat()),
                            .next(200, Fish()),
                            .next(300, Fish()),
                            .next(400, Shark()),
                            .next(500, Boat()),
                            .completed(600)
                        ]
                    }
                    
                    it("emits sounds accordingly") {
                        let observer = testScheduler.createObserver(String.self)
                        
                        testScheduler
                            .createHotObservable(encounters)
                            .bind(to: dolphin.encounter)
                            .disposed(by: disposeBag)
                        
                        dolphin
                            .soundEmissions
                            .bind(to: observer)
                            .disposed(by: disposeBag)
                        
                        // Yeah let's just expect these sounds
                        let expected = ["click", "click", "whistle"]
                        
                        testScheduler.start()
                        
                        // Uhh, let's just assume checking the returned strings is enough.
                        // Also just hide those pesky nils. (If you are vigilant enough you 
                        // see that the below compact map is intended to filter out one extra 
                        // nil emission from the .completed event.)
                        expect(observer.events.compactMap { $0.value.element }).to(equal(expected))
                    }
                }
            }
        }
	}
}
```

Instead if we write the proper matchers for Nimble we could just write:

```swift
// Same as above

                    it("emits sounds accordingly") {
                        let observer = testScheduler.createObserver(String.self)
                        
                        testScheduler
                            .createHotObservable(encounters)
                            .bind(to: dolphin.encounter)
                            .disposed(by: disposeBag)
                        
                        dolphin
                            .soundEmissions
                            .bind(to: observer)
                            .disposed(by: disposeBag)
                        
                        let expected: [Recorded<Event<String>>] = [
                            .next(200, "click"),
                            .next(300, "click"),
                            .next(400, "whistle"),
                            .completed(600)
                        ]
                        
                        testScheduler.start()
                        
                        expect(observer.events).to(equal(expected))
                    }
                    
// Same as above
```

Isn't it beautiful? It solves the problem of ignoring events and timing and spares us from the mapping misery, resulting in cleaner and more sophisticated tests.

## Requirements

- XCode 10.0
- Swift 4.2

## Installation

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

**Tested with `pod --version`: `1.6.1`**

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'NimbleRxTest',    '~> 1.0.0'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```