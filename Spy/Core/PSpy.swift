//
//  PSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

// sourcery: AutoMockable
// sourcery: AutoMockableHasSelfReturns
// sourcery: AutoMockableGenerics="<Level: PSpyLevel, Channel: PSpyChannel>"
// sourcery: AutoMockableSelfGenerics="<Level, Channel>"
public protocol PSpy {
    associatedtype Level: PSpyLevel
    associatedtype Channel: PSpyChannel
    var configuration: SpyConfiguration<Level, Channel> { get }
    @discardableResult func apply(configuration: SpyConfiguration<Level, Channel>) -> Self
    @discardableResult func log(level: Level, channel: Channel, message: PSpyable) -> Self
    @discardableResult func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self
}

public extension PSpy {
    @discardableResult func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        guard configuration.shouldLog(level: level, channel: channel) else { return self }
        forceLog(level: level, channel: channel, message: message)
        return self
    }

    func toAnySpy() -> AnySpy<Level, Channel> {
        return AnySpy(self)
    }
}
