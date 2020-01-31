//
//  PSpyLevelDecorator.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/// Represents level name decorator
public protocol PSpyLevelDecorator {
    associatedtype Level: PSpyLevel
    /// Decorate given value with a per-level specified decoration
    func decorate(level: Level, value: String) -> String
}

public extension PSpyLevelDecorator {
    /// Converts a PSpyLevelDecorator to type-erased AnyLevelDecorator<Level>
    func any() -> AnyLevelDecorator<Level> {
        return AnyLevelDecorator(self)
    }
}
