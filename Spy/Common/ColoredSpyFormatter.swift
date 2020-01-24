//
//  ColoredSpyFormatter.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

public final class ColoredSpyFormatter<Level: PColoredSpyLevel, Channel: PSpyChannel>: PSpyFormatter {
    public init() {
        
    }
    
    public func format(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable) -> String {
        return "\(Date(timeIntervalSince1970: timestamp)) \(level.levelName.colored(with: level.color))::\(channel.channelName)::\(message.spyMessage)"
    }
}
