//
//  FileSpyTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class FileSpyTest: XCTestCase {
    var sut: FileSpy<SpyLevel, SpyChannel, PSpyFormatterMock<SpyLevel, SpyChannel>>!
    var spyFormatterMock: PSpyFormatterMock<SpyLevel, SpyChannel>!
    var timestampProviderMock: PTimestampProviderMock!
    var logFileMock: PLogFileMock!
    
    override public func setUp() {
        spyFormatterMock = PSpyFormatterMock()
        timestampProviderMock = PTimestampProviderMock()
        logFileMock = PLogFileMock()
        sut = FileSpy<SpyLevel, SpyChannel, PSpyFormatterMock>(logFile: logFileMock, spyFormatter: spyFormatterMock, timestampProvider: timestampProviderMock, configuration: SpyConfiguration())
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
        XCTAssertEqual("\n".data(using: .utf8), logFileMock.writeReceivedData)
    }
}
