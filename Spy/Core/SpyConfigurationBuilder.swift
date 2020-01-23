//
//  SpyConfigurationBuilder.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class SpyConfigurationBuilder<Level: PSpyLevel, Channel: PSpyChannel> {
    private var spyOnLevels: Set<Level> = []
    private var spyOnChannels: Set<Channel> = []
    
    public init() {
        
    }
    
    public func add(level: Level) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnLevels.insert(level)
        return self
    }
    
    public func remove(level: Level) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnLevels.remove(level)
        return self
    }
    
    public func add(levels: Set<Level>) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnLevels = spyOnLevels.union(levels)
        return self
    }
    
    public func remove(levels: Set<Level>) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnLevels = spyOnLevels.subtracting(levels)
        return self
    }
    
    public func add(channel: Channel) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnChannels.insert(channel)
        return self
    }
    
    public func remove(channel: Channel) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnChannels.remove(channel)
        return self
    }
    
    public func add(channels: Set<Channel>) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnChannels = spyOnChannels.union(channels)
        return self
    }
    
    public func remove(channels: Set<Channel>) -> SpyConfigurationBuilder<Level, Channel> {
        spyOnChannels = spyOnChannels.subtracting(channels)
        return self
    }
    
    public func build() -> SpyConfiguration<Level, Channel> {
        return SpyConfiguration(spyOnLevels: spyOnLevels, spyOnChannels: spyOnChannels)
    }
}
