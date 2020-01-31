//
//  PSpyFormatter.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
// sourcery: AutoMockableGenerics="<Level: PSpyLevel, Channel: PSpyChannel>"
/// Represents logger output formatter
public protocol PSpyFormatter {
    associatedtype Level: PSpyLevel
    associatedtype Channel: PSpyChannel
    /// Formats given log data into the output format
    func format(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable) -> String
}
