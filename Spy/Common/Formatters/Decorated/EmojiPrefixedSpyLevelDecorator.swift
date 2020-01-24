//
//  EmojiPrefixedSpyLevelNameDecorator.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class EmojiPrefixedSpyLevelNameDecorator: PSpyLevelDecorator {
    public init() {
        
    }
    
    public func decorate(level: SpyLevel, value: String) -> String {
        return level.prefix + " " + value
    }
    
    public typealias Level = SpyLevel
}

private extension SpyLevel {
    var prefix: String {
        switch self {
        case .finest: return "💬"
        case .finer: return "🔊"
        case .fine: return "📣"
        case .config: return "✅"
        case .info: return "ℹ️"
        case .warning: return "⚠️"
        case .severe: return "⛔"
        }
    }
}
