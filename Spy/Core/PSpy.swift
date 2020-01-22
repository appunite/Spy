//
//  PSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public protocol PSpy {
    associatedtype Level: PSpyLevel
    associatedtype Channel: PSpyChannel
    func configure(spyOnLevels: Set<Level>) -> Self
    func configure(spyOnChannels: Set<Channel>) -> Self
    func log(level: Level, channel: Channel, message: PSpyable) -> Self
}

