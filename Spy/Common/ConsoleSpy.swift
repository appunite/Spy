//
//  ConsoleSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class ConsoleSpy<Level, Channel, Formatter: PSpyFormatter>: PSpy where Formatter.Level == Level, Formatter.Channel == Channel {
    public private(set) var configuration: SpyConfiguration<Level, Channel>
    private let spyFormatter: Formatter
    private let timestampProvider: PTimestampProvider

    public init(spyFormatter: Formatter,
                timestampProvider: PTimestampProvider,
                configuration: SpyConfiguration<Level, Channel> = SpyConfiguration()) {
        self.spyFormatter = spyFormatter
        self.timestampProvider = timestampProvider
        self.configuration = configuration
    }
    
    @discardableResult public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        self.configuration = configuration
        return self
    }
    
    @discardableResult public func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self {
        print(spyFormatter.format(timestamp: timestampProvider.timestamp, level: level, channel: channel, message: message))
        return self
    }
}
