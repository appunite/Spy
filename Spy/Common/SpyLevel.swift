//
//  SpyLevel.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public enum SpyLevel: Int, PColoredSpyLevel {
    case finest = 0
    case finer = 1
    case fine = 2
    case config = 3
    case info = 4
    case warning = 5
    case severe = 6
    
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
    
    public static func levelsFrom(_ level: SpyLevel) -> Set<SpyLevel> {
        return Set([SpyLevel.finest, .finer, .fine, .config, .info, .warning, .severe]).filter { $0.levelPriority >= level.levelPriority }
    }
    
    public var color: SpyColor {
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
