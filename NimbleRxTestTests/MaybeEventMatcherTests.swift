//
//  MaybeEventMatcherTests.swift
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

final class MaybeEventMatcherTests: QuickSpec {
    override func spec() {
        describe("maybe event") {
            it("matches self") {
                let events: [MaybeEvent<String>] = [
                    .success("🐱")
                ]
                
                expect(events).to(equal(events))
            }
            
            it("matches same") {
                let events: [MaybeEvent<String>] = [
                    .success("🐱")
                ]
                
                let same: [MaybeEvent<String>] = [
                    .success("🐱")
                ]
                
                expect(events).to(equal(same))
            }
            
            it("not matches missing") {
                let events: [MaybeEvent<String>] = [
                    .success("🐱")
                ]
                
                let missing: [MaybeEvent<String>] = [
                ]
                
                expect(events).notTo(equal(missing))
            }
            
            it("not matches same type different content") {
                let events: [MaybeEvent<String>] = [
                    .success("🐱")
                ]
                
                let wrong: [MaybeEvent<String>] = [
                    .success("🐱🐯")
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches other type") {
                enum TestError: Error {
                    case error
                }
                
                let events: [MaybeEvent<String>] = [
                    .success("🐱")
                ]
                
                let wrong: [MaybeEvent<String>] = [
                    .error(TestError.error)
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches nil") {
                let events: [MaybeEvent<String>] = [
                    .success("🐱")
                ]
                
                expect(events).notTo(beNil())
            }
        }
    }
}


