//
//  RawSpyFormatter.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/// Raw output formatter which create logs in following format: date level::channel::message
public final class RawSpyFormatter<Level: PSpyLevel, Channel: PSpyChannel>: PSpyFormatter {
    public init() {
        
    }
    
    public func format(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable) -> String {
        return "\(Date(timeIntervalSince1970: timestamp)) \(level.levelName)::\(channel.channelName)::\(message.spyMessage)"
    }
}
