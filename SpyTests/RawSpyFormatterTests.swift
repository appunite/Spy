//
//  RawSpyFormatterTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

final class RawSpyFormatterTests: XCTestCase {
    func testFormat_WhenCalledWithTimestampLevelChannelAndMessage_ShouldReturnStringInCorrectFormat() {
        let formatter = SpyDateFormatter.default
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let sut = RawSpyFormatter<SpyLevel, SpyChannel>(dateFormatter: formatter)
        let formattedLog = sut.format(timestamp: 0, level: .info, channel: .defaultChannel, message: "message")
        XCTAssertEqual("1970-01-01 00:00:00.000000+0000 info::default_channel::message", formattedLog)
    }
}
