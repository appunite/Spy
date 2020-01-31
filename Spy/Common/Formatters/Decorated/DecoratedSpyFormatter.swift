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
    
    public init(levelNameBuilder: DecoratedLevelNameBuilder<Level>) {
        self.levelNameBuilder = levelNameBuilder
    }
    
    public func format(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable) -> String {
        return "\(Date(timeIntervalSince1970: timestamp)) \(levelNameBuilder.build(withLevel: level))::\(channel.channelName)::\(message.spyMessage)"
    }
}
