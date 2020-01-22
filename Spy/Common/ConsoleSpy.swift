//
//  ConsoleSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

class ConsoleSpy<Level, Channel, Formatter: PSpyFormatter>: PSpy where Formatter.Level == Level, Formatter.Channel == Channel {
    var spyOnLevels: Set<Level> = []
    var spyOnChannels: Set<Channel> = []
    let logFormatter: Formatter
    let timestampProvider: PTimestampProvider

    init(logFormatter: Formatter, timestampProvider: PTimestampProvider, spyOnLevels: Set<Level>, spyOnChannels: Set<Channel>) {
        self.logFormatter = logFormatter
        self.timestampProvider = timestampProvider
    }
    
    func configure(spyOnLevels: Set<Level>) -> Self {
        self.spyOnLevels = spyOnLevels
        return self
    }
    
    func configure(spyOnChannels: Set<Channel>) -> Self {
        self.spyOnChannels = spyOnChannels
        return self
    }
    
    func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        print(logFormatter.format(timestamp: timestampProvider.timestamp, level: level, channel: channel, message: message))
        return self
    }
}
