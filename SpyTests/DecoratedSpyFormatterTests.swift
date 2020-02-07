//
//  DecoratedSpyFormatterTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

final class DecoratedSpyFormatterTests: XCTestCase {
    func testFormat_WhenCreatedWithBuilderWithColorDecorator_ShouldReturnStringInCorrectFormat() {
        let sut = DecoratedSpyFormatter<SpyLevel, SpyChannel>(levelNameBuilder: DecoratedLevelNameBuilder<SpyLevel>().add(decorator: ColoredSpyLevelNameDecorator().any()))
        let formattedLog = sut.format(timestamp: 0, level: .info, channel: .defaultChannel, message: "message")
        XCTAssertEqual("1970-01-01 01:00:00.000000+0100 \u{001B}[0;32minfo\u{001B}[0;0m::default_channel::message", formattedLog)
    }
    
    func testFormat_WhenCreatedWithBuilderWithEmijiDecorator_ShouldReturnStringInCorrectFormat() {
        let sut = DecoratedSpyFormatter<SpyLevel, SpyChannel>(levelNameBuilder: DecoratedLevelNameBuilder<SpyLevel>().add(decorator: EmojiPrefixedSpyLevelNameDecorator().any()))
        let formattedLog = sut.format(timestamp: 0, level: .info, channel: .defaultChannel, message: "message")
        XCTAssertEqual("1970-01-01 01:00:00.000000+0100 ℹ️ info::default_channel::message", formattedLog)
    }
    
    func testFormat_WhenCreatedWithBuilderWithTwoDecorators_ShouldReturnStringInCorrectFormat() {
        let sut = DecoratedSpyFormatter<SpyLevel, SpyChannel>(levelNameBuilder: DecoratedLevelNameBuilder<SpyLevel>()
            .add(decorator: ColoredSpyLevelNameDecorator().any())
            .add(decorator: EmojiPrefixedSpyLevelNameDecorator().any())
        )
        let formattedLog = sut.format(timestamp: 0, level: .info, channel: .defaultChannel, message: "message")
        XCTAssertEqual("1970-01-01 01:00:00.000000+0100 ℹ️ \u{001B}[0;32minfo\u{001B}[0;0m::default_channel::message", formattedLog)
    }
}
