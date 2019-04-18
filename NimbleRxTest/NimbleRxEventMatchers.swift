//
//  NimbleRxEventMatchers.swift
//  ProfileTests
//
//  Created by Badlazzor on 2018. 08. 31..
//  Copyright © 2018. Badlazzor. All rights reserved.
//

import Foundation
import RxSwift
import RxTest
import Nimble

public func equal<T: Equatable>(_ expectedValue: [Event<T>]?) -> Predicate<[Event<T>]> {
    return Predicate.define("equal <\(stringify(expectedValue))") { actualExpression, msg in
        let expected = expectedValue?.map { AnyEquatable(target: $0, comparer: ==) }
        let actual = try actualExpression.evaluate()?.map { AnyEquatable(target: $0, comparer: ==) }
        
        switch (expected, actual) {
        case (nil, _?):
            return PredicateResult(status: .fail, message: msg.appendedBeNilHint())
        case (nil, nil), (_, nil):
            return PredicateResult(status: .fail, message: msg)
        case (let expected?, let actual?):
            let matches = expected == actual
            return PredicateResult(bool: matches, message: msg)
        }
    }
}

public func equal<T: Equatable>(_ expectedValue: [SingleEvent<T>]?) -> Predicate<[SingleEvent<T>]> {
    return Predicate.define("equal <\(stringify(expectedValue))") { actualExpression, msg in
        let expected = expectedValue?.map { AnyEquatable(target: $0, comparer: ==) }
        let actual = try actualExpression.evaluate()?.map { AnyEquatable(target: $0, comparer: ==) }
        
        switch (expected, actual) {
        case (nil, _?):
            return PredicateResult(status: .fail, message: msg.appendedBeNilHint())
        case (nil, nil), (_, nil):
            return PredicateResult(status: .fail, message: msg)
        case (let expected?, let actual?):
            let matches = expected == actual
            return PredicateResult(bool: matches, message: msg)
        }
    }
}

public func equal<T: Equatable>(_ expectedValue: [MaybeEvent<T>]?) -> Predicate<[MaybeEvent<T>]> {
    return Predicate.define("equal <\(stringify(expectedValue))") { actualExpression, msg in
        let expected = expectedValue?.map { AnyEquatable(target: $0, comparer: ==) }
        let actual = try actualExpression.evaluate()?.map { AnyEquatable(target: $0, comparer: ==) }
        
        switch (expected, actual) {
        case (nil, _?):
            return PredicateResult(status: .fail, message: msg.appendedBeNilHint())
        case (nil, nil), (_, nil):
            return PredicateResult(status: .fail, message: msg)
        case (let expected?, let actual?):
            let matches = expected == actual
            return PredicateResult(bool: matches, message: msg)
        }
    }
}

public func equal(_ expectedValue: [CompletableEvent]?) -> Predicate<[CompletableEvent]> {
    return Predicate.define("equal <\(stringify(expectedValue))") { actualExpression, msg in
        let expected = expectedValue?.map { AnyEquatable(target: $0, comparer: ==) }
        let actual = try actualExpression.evaluate()?.map { AnyEquatable(target: $0, comparer: ==) }
        
        switch (expected, actual) {
        case (nil, _?):
            return PredicateResult(status: .fail, message: msg.appendedBeNilHint())
        case (nil, nil), (_, nil):
            return PredicateResult(status: .fail, message: msg)
        case (let expected?, let actual?):
            let matches = expected == actual
            return PredicateResult(bool: matches, message: msg)
        }
    }
}

public func equal<T: Equatable>(_ expectedValue: [Recorded<Event<T>>]?) -> Predicate<[Recorded<Event<T>>]> {
    return Predicate.define("equal <\(stringify(expectedValue))") { actualExpression, msg in
        let expected = expectedValue?.map { AnyEquatable(target: $0, comparer: ==) }
        let actual = try actualExpression.evaluate()?.map { AnyEquatable(target: $0, comparer: ==) }
        
        switch (expected, actual) {
        case (nil, _?):
            return PredicateResult(status: .fail, message: msg.appendedBeNilHint())
        case (nil, nil), (_, nil):
            return PredicateResult(status: .fail, message: msg)
        case (let expected?, let actual?):
            let matches = expected == actual
            return PredicateResult(bool: matches, message: msg)
        }
    }
}

public func equal<T: Equatable>(_ expectedValue: [Recorded<Event<T?>>]?) -> Predicate<[Recorded<Event<T?>>]> {
    return Predicate.define("equal <\(stringify(expectedValue))") { actualExpression, msg in
        let expected = expectedValue?.map { AnyEquatable(target: $0, comparer: ==) }
        let actual = try actualExpression.evaluate()?.map { AnyEquatable(target: $0, comparer: ==) }
        
        switch (expected, actual) {
        case (nil, _?):
            return PredicateResult(status: .fail, message: msg.appendedBeNilHint())
        case (nil, nil), (_, nil):
            return PredicateResult(status: .fail, message: msg)
        case (let expected?, let actual?):
            let matches = expected == actual
            return PredicateResult(bool: matches, message: msg)
        }
    }
}
