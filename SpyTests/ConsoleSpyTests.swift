//
//  ConsoleSpyTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class ConsoleSpyTests: XCTestCase {
    var sut: ConsoleSpy<SpyLevel, SpyChannel, PSpyFormatterMock<SpyLevel, SpyChannel>>!
    var spyFormatterMock: PSpyFormatterMock<SpyLevel, SpyChannel>!
    var timestampProviderMock: PTimestampProviderMock!
    
    override public func setUp() {
        spyFormatterMock = PSpyFormatterMock()
        timestampProviderMock = PTimestampProviderMock()
        sut = ConsoleSpy<SpyLevel, SpyChannel, PSpyFormatterMock>(spyFormatter: spyFormatterMock, timestampProvider: timestampProviderMock, configuration: SpyConfiguration())
    }
    
    func testApplyConfiguration_WhenNewConfigurationPassed_ShouldSetThisConfiguration() {
        let configuration = SpyConfiguration<SpyLevel, SpyChannel>(spyOnLevels: [.config], spyOnChannels: [.foo])
        sut.apply(configuration: configuration)
        XCTAssertEqual(sut.configuration, configuration)
    }
    
    func testForceLog_WhenCalled_ShouldAskFormatterToFormatLogWithPassedArguments() {
        // given
        timestampProviderMock.timestamp = 123
        spyFormatterMock.formatTimestampLevelChannelMessageReturnValue = ""
        // when
        sut.forceLog(level: .config, channel: .bar, message: "message")
        // then
        XCTAssertTrue(spyFormatterMock.formatTimestampLevelChannelMessageCalled)
        XCTAssertEqual(123, spyFormatterMock.formatTimestampLevelChannelMessageReceivedArguments?.timestamp)
        XCTAssertEqual(SpyChannel.bar, spyFormatterMock.formatTimestampLevelChannelMessageReceivedArguments?.channel)
        XCTAssertEqual(SpyLevel.config, spyFormatterMock.formatTimestampLevelChannelMessageReceivedArguments?.level)
        XCTAssertEqual("message", (spyFormatterMock.formatTimestampLevelChannelMessageReceivedArguments?.message as? String))
    }
}
