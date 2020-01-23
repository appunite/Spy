//
//  SpyConfiguration.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public struct SpyConfiguration<Level: PSpyLevel, Channel: PSpyChannel> {
    public let spyOnLevels: Set<Level>
    public let spyOnChannels: Set<Channel>
    
    public init() {
        spyOnLevels = []
        spyOnChannels = []
    }
    
    public init(spyOnLevels: Set<Level>,
                spyOnChannels: Set<Channel>) {
        self.spyOnLevels = spyOnLevels
        self.spyOnChannels = spyOnChannels
    }
    
    public func shouldLog(level: Level,
                          channel: Channel) -> Bool {
        return spyOnLevels.contains(level) && spyOnChannels.contains(channel)
    }
}
