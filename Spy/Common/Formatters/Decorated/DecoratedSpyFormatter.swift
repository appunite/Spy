//
//  DecoratedSpyFormatter.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/// Raw output formatter which create logs in following format: date decorate(level)::channel::message
public final class DecoratedSpyFormatter<Level: PSpyLevel, Channel: PSpyChannel>: PSpyFormatter {
    private let levelNameBuilder: DecoratedLevelNameBuilder<Level>
    private let dateFormatter: DateFormatter
    
    public init(levelNameBuilder: DecoratedLevelNameBuilder<Level>, dateFormatter: DateFormatter = SpyDateFormatter.default) {
        self.levelNameBuilder = levelNameBuilder
        self.dateFormatter = dateFormatter
    }
    
    public func format(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable) -> String {
        return "\(dateFormatter.string(from: Date(timeIntervalSince1970: timestamp))) \(levelNameBuilder.build(withLevel: level))::\(channel.channelName)::\(message.spyMessage)"
    }
}
