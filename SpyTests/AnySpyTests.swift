//
//  AnySpyTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

final class AnySpyTests: XCTestCase {
    var sut: PSpyMock<SpyLevel, SpyChannel>!
    
    override func setUp() {
        sut = PSpyMock()
        sut.configuration = .init(spyOnLevels: [.fine], spyOnChannels: [.defaultChannel])
        sut.applyConfigurationReturnValue = sut
        sut.forceLogLevelChannelMessageReturnValue = sut
        sut.logLevelChannelMessageReturnValue = sut
    }
    
    func testApplyConfiguration_WhenCalled_ShouldPassCallToWrappedSpy() {
        // given
        let configuration = SpyConfiguration<SpyLevel, SpyChannel>(spyOnLevels: [.info], spyOnChannels: [.foo])
        // when
        let anySpy = sut.any()
        anySpy.apply(configuration: configuration)
        // then
        XCTAssertTrue(sut.applyConfigurationCalled)
        XCTAssertEqual(configuration, sut.applyConfigurationReceivedConfiguration)
    }
    
    func testForceLog_WhenCalled_ShouldPassCallToWrappedSpy() {
        // when
        let anySpy = sut.any()
        anySpy.forceLog(level: .info, channel: .foo, message: "message")
        // then
        XCTAssertTrue(sut.forceLogLevelChannelMessageCalled)
        XCTAssertEqual(.info, sut.forceLogLevelChannelMessageReceivedArguments?.level)
        XCTAssertEqual(.foo, sut.forceLogLevelChannelMessageReceivedArguments?.channel)
        XCTAssertEqual("message", sut.forceLogLevelChannelMessageReceivedArguments?.message as? String)
    }

    func testLog_WhenCalled_ShouldPassCallToWrappedSpy() {
        // when
        let anySpy = sut.any()
        anySpy.log(level: .info, channel: .foo, message: "message")
        // then
        XCTAssertTrue(sut.logLevelChannelMessageCalled)
        XCTAssertEqual(.info, sut.logLevelChannelMessageReceivedArguments?.level)
        XCTAssertEqual(.foo, sut.logLevelChannelMessageReceivedArguments?.channel)
        XCTAssertEqual("message", sut.logLevelChannelMessageReceivedArguments?.message as? String)
    }
    
    func testConfiguration_WhenCalled_ShouldReturnWrappedSpyConfiguration() {
        XCTAssertEqual(sut.configuration, AnySpy(sut).configuration)
    }
}
