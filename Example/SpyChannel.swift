//
//  SpyChannel.swift
//  Example
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Spy

public enum SpyChannel: String, PSpyChannel {
    case lifecycle
    case other
    
    public var channelName: String {
        return self.rawValue
    }
}
