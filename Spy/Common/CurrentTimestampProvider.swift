//
//  CurrentTimestampProvider.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/// Concrete implementation of timestamp provider. It provides current time.
public final class CurrentTimestampProvider: PTimestampProvider {
    public init() {
        
    }
    
    /// Returns current interval since 1970 as timestamp
    public var timestamp: TimeInterval {
        return Date().timeIntervalSince1970
    }
}
