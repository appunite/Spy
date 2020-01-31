//
//  String+Colored.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public extension String {
    /// Returns text wrapped with color modificators
    func colored(with color: SpyColor) -> String {
        return color.modificator + self + SpyColor.default.modificator
    }
}
