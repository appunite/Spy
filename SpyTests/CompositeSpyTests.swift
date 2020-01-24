//
//  CompositeSpyTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

final class CompositeSpyTests: XCTestCase {
    var mocks: [PSpyMock<SpyLevel, SpyChannel>] = []
    var sut: CompositeSpy<SpyLevel, SpyChannel>!
    
    override func setUp() {
        sut = CompositeSpy()
        createMocks()
        for mock in mocks {
            sut.add(spy: mock.toAnySpy())
        }
    }
    
    func testApplyConfiguration_WhenCalled_ShouldPassCallToWrappedSpies() {
        // given
        let configuration = SpyConfiguration<SpyLevel, SpyChannel>(spyOnLevels: [.info], spyOnChannels: [.foo])
        // when
        sut.apply(configuration: configuration)
        // then
        for mock in mocks {
            XCTAssertTrue(mock.applyConfigurationCalled)
            XCTAssertEqual(configuration, mock.applyConfigurationReceivedConfiguration)
        }
    }
    
    func testForceLog_WhenCalled_ShouldPassCallToWrappedSpies() {
        // when
        sut.forceLog(level: .info, channel: .foo, message: "message")
        // then
        for mock in mocks {
            XCTAssertTrue(mock.forceLogLevelChannelMessageCalled)
            XCTAssertEqual(.info, mock.forceLogLevelChannelMessageReceivedArguments?.level)
            XCTAssertEqual(.foo, mock.forceLogLevelChannelMessageReceivedArguments?.channel)
            XCTAssertEqual("message", mock.forceLogLevelChannelMessageReceivedArguments?.message as? String)
        }
    }

    func testLog_WhenCalled_ShouldPassCallToWrappedSpies() {
        // when
        sut.log(level: .info, channel: .foo, message: "message")
        // then
        for mock in mocks {
            XCTAssertTrue(mock.logLevelChannelMessageCalled)
            XCTAssertEqual(.info, mock.logLevelChannelMessageReceivedArguments?.level)
            XCTAssertEqual(.foo, mock.logLevelChannelMessageReceivedArguments?.channel)
            XCTAssertEqual("message", mock.logLevelChannelMessageReceivedArguments?.message as? String)
        }
    }
    
    private func createMocks() {
        for _ in 0..<3 {
            createMock()
        }
    }

    private func createMock() {
        let mock: PSpyMock<SpyLevel, SpyChannel>! = PSpyMock()
        mock.configuration = .init(spyOnLevels: [.fine], spyOnChannels: [.defaultChannel])
        mock.applyConfigurationReturnValue = mock
        mock.forceLogLevelChannelMessageReturnValue = mock
        mock.logLevelChannelMessageReturnValue = mock
        mocks.append(mock)
    }
}
