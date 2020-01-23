//
//  PSpyTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class PSpyTests: XCTestCase {
    final class Spy: PSpy {
        typealias Level = SpyLevel
        typealias Channel = SpyChannel
        
        var forceLogCalled: Bool = false
        var levelReceived: SpyLevel? = nil
        var channelReceived: SpyChannel? = nil
        var messageReceived: PSpyable? = nil
        
        var configuration: SpyConfiguration<SpyLevel, SpyChannel> = .init()
        
        @discardableResult func apply(configuration: SpyConfiguration<SpyLevel, SpyChannel>) -> Spy {
            self.configuration = configuration
            return self
        }
        
        @discardableResult func forceLog(level: SpyLevel, channel: SpyChannel, message: PSpyable) -> Spy {
            forceLogCalled = true
            self.levelReceived = level
            self.channelReceived = channel
            self.messageReceived = message
            return self
        }
    }
    
    var sut: Spy!
    
    public override func setUp() {
        sut = Spy()
    }
    
    func testLog_WhenSupportedLevelButNotSupportedChannelUsed_ShouldNotCallForceLog() {
        // given
        sut.apply(configuration: .init(spyOnLevels: [.config], spyOnChannels: [.foo]))
        // when
        sut.log(level: .config, channel: .bar, message: "msg")
        // then
        XCTAssertFalse(sut.forceLogCalled)
    }
    
    func testLog_WhenUnsupportedLevelButSupportedChannelUsed_ShouldNotCallForceLog() {
        // given
        sut.apply(configuration: .init(spyOnLevels: [.config], spyOnChannels: [.foo]))
        // when
        sut.log(level: .info, channel: .foo, message: "msg")
        // then
        XCTAssertFalse(sut.forceLogCalled)
    }
    
    func testLog_WhenBothLevelAndChannelAreUnsupported_ShouldNotCallForceLog() {
        // given
        sut.apply(configuration: .init(spyOnLevels: [.config], spyOnChannels: [.foo]))
        // when
        sut.log(level: .info, channel: .bar, message: "msg")
        // then
        XCTAssertFalse(sut.forceLogCalled)
    }
    
    func testLog_WhenBothLevelAndChannelAreSupported_ShouldNotCallForceLogWithPassedArguments() {
        // given
        sut.apply(configuration: .init(spyOnLevels: [.config], spyOnChannels: [.foo]))
        // when
        sut.log(level: .config, channel: .foo, message: "msg")
        // then
        XCTAssertTrue(sut.forceLogCalled)
        XCTAssertEqual(.config, sut.levelReceived)
        XCTAssertEqual(.foo, sut.channelReceived)
        XCTAssertEqual("msg", sut.messageReceived as? String)
    }


}
