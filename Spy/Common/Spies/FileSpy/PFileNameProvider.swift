//
//  PFileNameProvider.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

// sourcery: AutoMockable
public protocol PFileNameProvider {
    func fileName() -> String
}
