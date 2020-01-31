//
//  SpyConfiguration.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/// Represents configuration of the spy by defining levels and channels the spy should spy on.
public struct SpyConfiguration<Level: PSpyLevel, Channel: PSpyChannel>: Equatable {
    /// Levels that the spy should spy on
    public let spyOnLevels: Set<Level>
    /// Channels that the spy should spy on
    public let spyOnChannels: Set<Channel>
    
    /// Creates an instance without levels and channels defined
    public init() {
        spyOnLevels = []
        spyOnChannels = []
    }
    
    /// Creates an instance with given levels and channels
    public init(spyOnLevels: Set<Level>,
                spyOnChannels: Set<Channel>) {
        self.spyOnLevels = spyOnLevels
        self.spyOnChannels = spyOnChannels
    }
    
    /// For given level and channel returns true if the event should be logged for current configuration
    public func shouldLog(level: Level,
                          channel: Channel) -> Bool {
        return spyOnLevels.contains(level) && spyOnChannels.contains(channel)
    }
}
