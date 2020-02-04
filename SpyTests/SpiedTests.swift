//
//  SpiedTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 03/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//


import XCTest
import Spy

public final class SpiedTests: XCTestCase {
    func testGetter_WhenValueAccessed_ShouldInvokeMapper() {
        class SUT {
            static var pSpyMock = PSpyMock<SpyLevel, SpyChannel>()
            @Spied(spy: pSpyMock.any(), onLevel: .info, onChannel: .foo)
            var foo: String = "message"
        }
        SUT.pSpyMock.logLevelChannelMessageReturnValue = SUT.pSpyMock
        let sut = SUT()
        print(sut.foo)
        XCTAssertTrue(SUT.pSpyMock.logLevelChannelMessageCalled)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.level, .info)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.channel, .foo)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.message as? String, "Get: message")
    }
    
    func testSetter_WhenValueSet_ShouldInvokeMapper() {
        class SUT {
            static var pSpyMock = PSpyMock<SpyLevel, SpyChannel>()
            @Spied(spy: pSpyMock.any(), onLevel: .info, onChannel: .foo)
            var foo: String = "message"
        }
        SUT.pSpyMock.logLevelChannelMessageReturnValue = SUT.pSpyMock
        let sut = SUT()
        sut.foo = "foo"
        XCTAssertTrue(SUT.pSpyMock.logLevelChannelMessageCalled)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.level, .info)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.channel, .foo)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.message as? String, "Set: foo")
    }
    
    func testCustomGetter_WhenValueAccessed_ShouldInvokeMapper() {
        class SUT {
            static var pSpyMock = PSpyMock<SpyLevel, SpyChannel>()
            @Spied(spy: pSpyMock.any(), onLevel: .info, onChannel: .foo,
                    getMapper: { spyable in
                        let spyable = "CustomGet \(spyable.spyMessage)"
                        return spyable
                    },
                    setMapper: { spyable in
                        let spyable = "CustomSet \(spyable.spyMessage)"
                        return spyable
                    })
            var foo: String = "message"
        }
        SUT.pSpyMock.logLevelChannelMessageReturnValue = SUT.pSpyMock
        let sut = SUT()
        print(sut.foo)
        XCTAssertTrue(SUT.pSpyMock.logLevelChannelMessageCalled)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.level, .info)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.channel, .foo)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.message as? String, "CustomGet message")
    }
    
    func testCustomSetter_WhenValueAccessed_ShouldInvokeMapper() {
        class SUT {
            static var pSpyMock = PSpyMock<SpyLevel, SpyChannel>()
            @Spied(spy: pSpyMock.any(), onLevel: .info, onChannel: .foo,
                    getMapper: { spyable in
                        let spyable = "CustomGet \(spyable.spyMessage)"
                        return spyable
                    },
                    setMapper: { spyable in
                        let spyable = "CustomSet \(spyable.spyMessage)"
                        return spyable
                    })
            var foo: String = "message"
        }
        SUT.pSpyMock.logLevelChannelMessageReturnValue = SUT.pSpyMock
        let sut = SUT()
        sut.foo = "foo"
        XCTAssertTrue(SUT.pSpyMock.logLevelChannelMessageCalled)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.level, .info)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.channel, .foo)
        XCTAssertEqual(SUT.pSpyMock.logLevelChannelMessageReceivedArguments?.message as? String, "CustomSet foo")
    }

}

