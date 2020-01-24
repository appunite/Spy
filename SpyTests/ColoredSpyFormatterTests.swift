//
//  ColoredSpyFormatterTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

final class ColoredSpyFormatterTests: XCTestCase {
    func testFormat_WhenCalledWithTimestampLevelChannelAndMessage_ShouldReturnStringInCorrectFormat() {
        let sut = ColoredSpyFormatter<SpyLevel, SpyChannel>()
        let formattedLog = sut.format(timestamp: 0, level: .info, channel: .defaultChannel, message: "message")
        XCTAssertEqual("1970-01-01 00:00:00 +0000 \u{001B}[0;32minfo\u{001B}[0;0m::default_channel::message", formattedLog)
    }
}
