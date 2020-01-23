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
    
    public func add(level: Level) -> Self {
        spyOnLevels.insert(level)
        return self
    }
    
    public func remove(level: Level) -> Self {
        spyOnLevels.remove(level)
        return self
    }
    
    public func add(levels: Set<Level>) -> Self {
        spyOnLevels = spyOnLevels.union(levels)
        return self
    }
    
    public func remove(levels: Set<Level>) -> Self {
        spyOnLevels = spyOnLevels.subtracting(levels)
        return self
    }
    
    public func add(channel: Channel) -> Self {
        spyOnChannels.insert(channel)
        return self
    }
    
    public func remove(channel: Channel) -> Self {
        spyOnChannels.remove(channel)
        return self
    }
    
    public func add(channels: Set<Channel>) -> Self {
        spyOnChannels = spyOnChannels.union(channels)
        return self
    }
    
    public func remove(channels: Set<Channel>) -> Self {
        spyOnChannels = spyOnChannels.subtracting(channels)
        return self
    }
    
    public func build() -> SpyConfiguration<Level, Channel> {
        return SpyConfiguration(spyOnLevels: spyOnLevels, spyOnChannels: spyOnChannels)
    }
}
