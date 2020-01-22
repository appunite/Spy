//
//  RawSpyFormatter.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

final class RawSpyFormatter<Level: PSpyLevel, Channel: PSpyChannel>: PSpyFormatter {
    func format(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable) -> String {
        return "\(timestamp)::\(level.levelName)::\(channel.channelName)::\(message.spyMessage)"
    }
}
