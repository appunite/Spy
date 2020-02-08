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
/// A base logger protocol. Represents logger output destination.
public protocol PSpy {
    associatedtype Level: PSpyLevel
    associatedtype Channel: PSpyChannel
    // Current spy configuration
    var configuration: SpyConfiguration<Level, Channel> { get }
    // Applies new configuration to a spy
    @discardableResult func apply(configuration: SpyConfiguration<Level, Channel>) -> Self
    /// Performs log with configuration checks
    @discardableResult func log(level: Level, channel: Channel, message: PSpyable) -> Self
    /// Performs log without configuration checks
    @discardableResult func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self
}

public extension PSpy {
    @discardableResult func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        guard configuration.shouldLog(level: level, channel: channel) else { return self }
        forceLog(level: level, channel: channel, message: message)
        return self
    }

    /// Converts PSpy to type-erased AnySoy<Level, Channel>
    func any() -> AnySpy<Level, Channel> {
        return AnySpy(self)
    }
    
    /// Converts PSpy to thread safe spy
    func safe() -> ThreadSafeSpy<Self> {
        return ThreadSafeSpy(spy: self)
    }
}
