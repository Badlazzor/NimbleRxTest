//
//  CompletableEventMatcherTests.swift
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

final class CompletableEventMatcherTests: QuickSpec {
    enum TestError: Error {
        case error
        case differentError
    }
    
    override func spec() {
        describe("completable event") {
            it("matches self") {
                let events: [CompletableEvent] = [
                    .completed
                ]
                
                expect(events).to(equal(events))
            }
            
            it("matches same") {
                let events: [CompletableEvent] = [
                    .completed
                ]
                
                let same: [CompletableEvent] = [
                    .completed
                ]
                
                expect(events).to(equal(same))
            }
            
            it("not matches missing") {
                let events: [CompletableEvent] = [
                    .completed
                ]
                
                let missing: [CompletableEvent] = [
                ]
                
                expect(events).notTo(equal(missing))
            }
            
            it("not matches same type different content") {
                
                let events: [CompletableEvent] = [
                    .error(TestError.error)
                ]
                
                let wrong: [CompletableEvent] = [
                    .error(TestError.differentError)
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches other type") {
                enum TestError: Error {
                    case error
                }
                
                let events: [CompletableEvent] = [
                    .completed
                ]
                
                let wrong: [CompletableEvent] = [
                    .error(TestError.error)
                ]
                
                expect(events).notTo(equal(wrong))
            }
            
            it("not matches nil") {
                let events: [CompletableEvent] = [
                    .completed
                ]
                
                expect(events).notTo(beNil())
            }
        }
    }
}


