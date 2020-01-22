//
//  SpyLevel.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public enum SpyLevel: Int, PSpyLevel {    
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
}
