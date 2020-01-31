//
//  SpyConfigurationBuilder.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/* Used to easily build your spy configuration by adding or emoving levels and channels
 
 #Example usage:
 SpyConfigurationBuilder()
 .add(level: SpyLevel.levelsFrom(.fine))
 .add(channels: [.foo, .bar])
 .remove(level: .severe)
 .build()
 */
public final class SpyConfigurationBuilder<Level: PSpyLevel, Channel: PSpyChannel> {
    private var spyOnLevels: Set<Level> = []
    private var spyOnChannels: Set<Channel> = []
    
    /// Creates instance of the builder with no initial levels and channels specified
    public init() {
        
    }
    
    /// Creates instance of the builder with levels and channels copied from already existing configuration
    public init(withConfiguration configuration: SpyConfiguration<Level, Channel>) {
        self.spyOnLevels = configuration.spyOnLevels
        self.spyOnChannels = configuration.spyOnChannels
    }
    
    /// Adds level to be spied on to the configuration
    public func add(level: Level) -> Self {
        spyOnLevels.insert(level)
        return self
    }
    
    /// Removes level form the configuration
    public func remove(level: Level) -> Self {
        spyOnLevels.remove(level)
        return self
    }
    
    /// Adds given levels to be spied on to the configuration
    public func add(levels: Set<Level>) -> Self {
        spyOnLevels = spyOnLevels.union(levels)
        return self
    }
    
    /// Removes given levels from the configuration
    public func remove(levels: Set<Level>) -> Self {
        spyOnLevels = spyOnLevels.subtracting(levels)
        return self
    }
    
    /// Adds channel to be spied on to the configuration
    public func add(channel: Channel) -> Self {
        spyOnChannels.insert(channel)
        return self
    }
    
    /// Removes channel form the configuration
    public func remove(channel: Channel) -> Self {
        spyOnChannels.remove(channel)
        return self
    }
    
    /// Adds given channels to be spied on to the configuration
    public func add(channels: Set<Channel>) -> Self {
        spyOnChannels = spyOnChannels.union(channels)
        return self
    }
    
    /// Removes given channels from the configuration
    public func remove(channels: Set<Channel>) -> Self {
        spyOnChannels = spyOnChannels.subtracting(channels)
        return self
    }
    
    /// Builds and returns the configuration
    public func build() -> SpyConfiguration<Level, Channel> {
        return SpyConfiguration(spyOnLevels: spyOnLevels, spyOnChannels: spyOnChannels)
    }
}
