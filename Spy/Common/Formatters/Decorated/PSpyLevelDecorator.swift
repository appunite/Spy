//
//  PSpyLevelDecorator.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public protocol PSpyLevelDecorator {
    associatedtype Level: PSpyLevel
    func decorate(level: Level, value: String) -> String
}

public extension PSpyLevelDecorator {
    func toAnyDecorator() -> AnyLevelDecorator<Level> {
        return AnyLevelDecorator(self)
    }
}
