//
//  ColoredSpyLevelNameDecorator.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class ColoredSpyLevelNameDecorator: PSpyLevelDecorator {
    public typealias Level = SpyLevel
    
    public init() {
        
    }
    
    public func decorate(level: SpyLevel, value: String) -> String {
        return value.colored(with: level.color)
    }
}

private extension SpyLevel {
    var color: SpyColor {
        switch self {
        case .finest: return .white
        case .finer: return .cyan
        case .fine: return .blue
        case .config: return .magenta
        case .info: return .green
        case .warning: return .yellow
        case .severe: return .red
        }
    }
}
