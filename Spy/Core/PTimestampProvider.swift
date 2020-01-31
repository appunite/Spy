//
//  PTimestampProvider.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
/// Timestamp provider protocol created for testing purposes. Please see CurrentTimestampProvider for concrete implementation.
public protocol PTimestampProvider {
    /// Returns a timestamp since 1970
    var timestamp: TimeInterval { get }
}
