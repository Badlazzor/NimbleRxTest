//
//  SingleEventMatcherTests.swift
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

final class SingleEventMatcherTests: QuickSpec {
    override func spec() {
        describe("single event") {
            it("matches self") {
                let events: [SingleEvent<String>] = [
                    .success("🐱")
                ]
                
                expect(events).to(equal(events))
            }
            
            it("matches same") {
                let events: [SingleEvent<String>] = [
                    .success("🐱")
                ]
                
                let same: [SingleEvent<String>] = [
                    .success("🐱")
                ]
                
                expect(events).to(equal(same))
            }
            
            it("not matches missing") {
                let events: [SingleEvent<String>] = [
                    .success("🐱")
                ]
                
                let missing: [SingleEvent<String>] = [
                ]
                
                expect(events).notTo(equal(missing))
            }
            
            it("not matches same type different content") {
                let events: [SingleEvent<String>] = [
                    .success("🐱")
                ]
                
                let wrong: [SingleEvent<String>] = [
                    .success("🐱🐯")
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches other type") {
                enum TestError: Error {
                    case error
                }
                
                let events: [SingleEvent<String>] = [
                    .success("🐱")
                ]
                
                let wrong: [SingleEvent<String>] = [
                    .error(TestError.error)
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches nil") {
                let events: [SingleEvent<String>] = [
                    .success("🐱")
                ]
                
                expect(events).notTo(beNil())
            }
        }
    }
}

