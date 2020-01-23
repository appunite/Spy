//
//  CurrentTimestampProvider.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class CurrentTimestampProvider: PTimestampProvider {
    public var timestamp: TimeInterval {
        return Date().timeIntervalSince1970
    }
}
