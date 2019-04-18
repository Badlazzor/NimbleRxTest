//
//  RecordedEventOptionalMatcherTests.swift
//  NimbleRxTestTests
//
//  Created by Balazs Hajagos on 2019. 04. 18..
//  Copyright © 2019. Balazs Hajagos. All rights reserved.
//

import Nimble
import Quick
import RxSwift
import RxTest

@testable import NimbleRxTest

final class RecordedEventOptionalMatcherTests: QuickSpec {
    override func spec() {
        describe("event array") {
            it("matches self") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                expect(events).to(equal(events))
            }
            
            it("matches same") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                let same: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                expect(events).to(equal(same))
            }
            
            it("not matches misordered") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                let misordered: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🦊"),
                    .next(2, "🐶"),
                    .next(3, "🐭")
                ]
                
                expect(events).notTo(equal(misordered))
            }
            
            it("not matches missing") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                let missing: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(3, "🐭")
                ]
                
                expect(events).notTo(equal(missing))
            }
            
            it("not matches same type different content") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                let wrong: [Recorded<Event<String?>>] = [
                    .next(0, "🐱🐯"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches different type") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                let wrong: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .completed(3)
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches nil") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                expect(events).notTo(beNil())
            }
            
            it("not matches different times") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                let mistimed: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🦊"),
                    .next(2, "🐶"),
                    .next(4, "🐭")
                ]
                
                expect(events).notTo(equal(mistimed))
            }
            
            it("not matches nil values with non-nil values") {
                let events: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🐶"),
                    .next(2, "🦊"),
                    .next(3, "🐭")
                ]
                
                let nilled: [Recorded<Event<String?>>] = [
                    .next(0, "🐱"),
                    .next(1, "🦊"),
                    .next(2, nil),
                    .next(3, "🐭")
                ]
                
                expect(events).notTo(equal(nilled))
            }
        }
    }
}


