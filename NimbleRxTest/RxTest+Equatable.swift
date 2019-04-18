//
//  RxTest+Equatable.swift
//  ProfileTests
//
//  Created by Badlazzor on 2018. 09. 03..
//  Copyright © 2018. Badlazzor. All rights reserved.
//

import Foundation

// Badlazzor - extracted from RxTest AnyEquatable which is unfortunately not public
public struct AnyEquatable<Target>
: Equatable {
    typealias Comparer = (Target, Target) -> Bool
    
    let target: Target
    let comparer: Comparer
    
    init(target: Target, comparer: @escaping Comparer) {
        self.target = target
        self.comparer = comparer
    }
}

public func == <T>(lhs: AnyEquatable<T>, rhs: AnyEquatable<T>) -> Bool {
    return lhs.comparer(lhs.target, rhs.target)
}

extension AnyEquatable: CustomDebugStringConvertible, CustomStringConvertible {
    public var description: String {
        return "\(target)"
    }
    
    public var debugDescription: String {
        return "\(target)"
    }
}
