//
//  SpyChannel.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Spy

enum SpyChannel: String, PSpyChannel {
    case defaultChannel = "default_channel"
    case foo
    case bar
    
    var channelName: String {
        return rawValue
    }
}
