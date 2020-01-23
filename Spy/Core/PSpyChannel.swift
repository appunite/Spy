//
//  PSpyChannel.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public protocol PSpyChannel: Hashable {
    var channelName: String { get }
}
