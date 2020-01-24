//
//  PlainLevelNameDecorator.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class PlainLevelNameDecorator<Level: PSpyLevel>: PSpyLevelDecorator {
    public init() {
        
    }
    public func decorate(level: Level, value: String) -> String {
        return level.levelName
    }
}
