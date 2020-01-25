//
//  SpyLevel.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/// Concrete of PSpyLevel with available levels sorted by increasing alert priority; finest, finer, fine, config, info, warning, severe
public enum SpyLevel: Int, PSpyLevel {
    case finest = 0
    case finer = 1
    case fine = 2
    case config = 3
    case info = 4
    case warning = 5
    case severe = 6
    
    /// Alert priority of the current level
    public var levelPriority: Int {
        return rawValue
    }
    
    public var levelName: String {
        switch self {
        case .finest: return "finest"
        case .finer: return "finer"
        case .fine: return "fine"
        case .config: return "config"
        case .info: return "info"
        case .warning: return "warning"
        case .severe: return "severe"
        }
    }
    
    /// Returns levels with alert priority equal or higher than given level
    public static func levelsFrom(_ level: SpyLevel) -> Set<SpyLevel> {
        return Set([SpyLevel.finest, .finer, .fine, .config, .info, .warning, .severe]).filter { $0.levelPriority >= level.levelPriority }
    }
}
