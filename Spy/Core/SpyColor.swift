//
//  SpyColor.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public enum SpyColor: Int {
    case `default` = 0
    case black = 30
    case red = 31
    case green = 32
    case yellow = 33
    case blue = 34
    case magenta = 35
    case cyan = 36
    case white = 37
    
    public var modificator: String {
        return "\u{001B}[0;\(colorCode)m"
    }
    
    public var colorCode: Int {
        return rawValue
    }
}
