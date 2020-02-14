//
//  ThreadSafeSpyTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
@testable import Spy

public final class ThreadSafeSpyTests: XCTestCase {
    var sut: ThreadSafeSpy<PSpyMock<SpyLevel, SpyChannel>>!
    var spyMock: PSpyMock<SpyLevel, SpyChannel>!
    var lockMock: PLockMock!
    
    override public func setUp() {
        spyMock = PSpyMock()
        lockMock = PLockMock()
        sut = ThreadSafeSpy(spy: spyMock, lock: lockMock)
    }
    
    func testApplyConfiguration_WhenCalled_ShouldLockAndUnlock() {
        spyMock.applyConfigurationReturnValue = spyMock
        let configuration = SpyConfiguration<SpyLevel, SpyChannel>(spyOnLevels: [.config], spyOnChannels: [.foo])
        sut.apply(configuration: configuration)
        XCTAssertTrue(lockMock.lockCalled)
        XCTAssertTrue(lockMock.unlockCalled)
    }
        
    func testForceLog_WhenCalled_ShouldLockAndUnlock() {
        spyMock.forceLogLevelChannelMessageReturnValue = spyMock
        sut.forceLog(level: .info, channel: .foo, message: "foo")
        XCTAssertTrue(lockMock.lockCalled)
        XCTAssertTrue(lockMock.unlockCalled)
    }
    
    func testLog_WhenCalled_ShouldLockAndUnlock() {
        spyMock.logLevelChannelMessageReturnValue = spyMock
        sut.log(level: .info, channel: .foo, message: "foo")
        XCTAssertTrue(lockMock.lockCalled)
        XCTAssertTrue(lockMock.unlockCalled)
    }
}
