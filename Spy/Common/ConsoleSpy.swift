//
//  ConsoleSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public class ConsoleSpy<Level, Channel, Formatter: PSpyFormatter>: PSpy where Formatter.Level == Level, Formatter.Channel == Channel {
    private var spyOnLevels: Set<Level> = []
    private var spyOnChannels: Set<Channel> = []
    private let spyFormatter: Formatter
    private let timestampProvider: PTimestampProvider

    public init(spyFormatter: Formatter, timestampProvider: PTimestampProvider, spyOnLevels: Set<Level>, spyOnChannels: Set<Channel>) {
        self.spyFormatter = spyFormatter
        self.timestampProvider = timestampProvider
    }
    
    @discardableResult public func configure(spyOnLevels: Set<Level>) -> Self {
        self.spyOnLevels = spyOnLevels
        return self
    }
    
    @discardableResult public func configure(spyOnChannels: Set<Channel>) -> Self {
        self.spyOnChannels = spyOnChannels
        return self
    }
    
    @discardableResult public func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        guard spyOnLevels.contains(level), spyOnChannels.contains(channel) else { return self }
        print(spyFormatter.format(timestamp: timestampProvider.timestamp, level: level, channel: channel, message: message))
        return self
    }
}
