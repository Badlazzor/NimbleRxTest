//
//  EventArrayMatcherTests.swift
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

final class EventArrayMatcherTests: QuickSpec {
    override func spec() {
        describe("event array") {
            it("matches self") {
                let events: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                expect(events).to(equal(events))
            }
            
            it("matches same") {
                let events: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                let same: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                expect(events).to(equal(same))
            }
            
            it("not matches misordered") {
                let events: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                let misordered: [Event<String>] = [
                    .next("🐱"),
                    .next("🦊"),
                    .next("🐶"),
                    .next("🐭")
                ]
                
                expect(events).notTo(equal(misordered))
            }
            
            it("not matches missing") {
                let events: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                let missing: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🐭")
                ]
                
                expect(events).notTo(equal(missing))
            }
            
            it("not matches same type different content") {
                let events: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                let wrong: [Event<String>] = [
                    .next("🐱🐯"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches different type") {
                let events: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                let wrong: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .completed
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches nil") {
                let events: [Event<String>] = [
                    .next("🐱"),
                    .next("🐶"),
                    .next("🦊"),
                    .next("🐭")
                ]
                
                expect(events).notTo(beNil())
            }
        }
    }
}
