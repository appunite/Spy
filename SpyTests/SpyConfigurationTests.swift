//
//  SpyConfigurationTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class SpyConfigurationTests: XCTestCase {
    private var sut: SpyConfiguration<SpyLevel, SpyChannel>!
    public override func setUp() {
        sut = SpyConfiguration(spyOnLevels: [.info], spyOnChannels: [.foo])
    }
    
    func testInit_WhenInitializedWithNoLevelsAndChannels_ShouldNotHaveLevelsAndChannelsSet() {
        sut = SpyConfiguration()
        XCTAssertEqual([], sut.spyOnLevels)
        XCTAssertEqual([], sut.spyOnChannels)
    }
    
    func testInit_WhenInitializedWithLevelsAndChannels_ShouldNotHaveTheseLevelsAndChannelsSet() {
        sut = SpyConfiguration(spyOnLevels: [.info, .warning], spyOnChannels: [.foo, .bar])
        XCTAssertEqual([.info, .warning], sut.spyOnLevels)
        XCTAssertEqual([.foo, .bar], sut.spyOnChannels)
    }
    
    func testShouldLog_WhenOnlyChannelIsValid_ShouldReturnFalse() {
        XCTAssertFalse(sut.shouldLog(level: .warning, channel: .foo))
    }
    
    func testShouldLog_WhenOnlyLevelIsValid_ShouldReturnFalse() {
        XCTAssertFalse(sut.shouldLog(level: .info, channel: .bar))
    }
    
    func testShouldLog_WhenBothLevelChannelAreInvalid_ShouldReturnFalse() {
        XCTAssertFalse(sut.shouldLog(level: .warning, channel: .bar))
    }
    
    func testShouldLog_WhenBothLevelChannelAreValid_ShouldReturnTrue() {
        XCTAssertTrue(sut.shouldLog(level: .info, channel: .foo))
    }
}
