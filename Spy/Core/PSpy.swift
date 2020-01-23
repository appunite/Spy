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
    @discardableResult func configure(spyOnLevels: Set<Level>) -> Self
    @discardableResult func configure(spyOnChannels: Set<Channel>) -> Self
    @discardableResult func log(level: Level, channel: Channel, message: PSpyable) -> Self
}

public extension PSpy {
    func toAnySpy() -> AnySpy<Level, Channel> {
        return AnySpy(self)
    }
}
