//
//  PTimestampProvider.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol PTimestampProvider {
    var timestamp: TimeInterval { get }
}
