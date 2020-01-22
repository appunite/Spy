//
//  SpyLevelTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class SpyLevelTests: XCTestCase {
    func testLoggingNames_ShouldReflectEnumName() {
        XCTAssertEqual("finest", SpyLevel.finest.levelName)
        XCTAssertEqual("finer", SpyLevel.finer.levelName)
        XCTAssertEqual("fine", SpyLevel.fine.levelName)
        XCTAssertEqual("info", SpyLevel.info.levelName)
        XCTAssertEqual("config", SpyLevel.config.levelName)
        XCTAssertEqual("warning", SpyLevel.warning.levelName)
        XCTAssertEqual("severe", SpyLevel.severe.levelName)
    }
    
    func testPriorities_ShouldBeAssignedCorrectly() {
        XCTAssertEqual(0, SpyLevel.finest.levelPriority)
        XCTAssertEqual(1, SpyLevel.finer.levelPriority)
        XCTAssertEqual(2, SpyLevel.fine.levelPriority)
        XCTAssertEqual(3, SpyLevel.config.levelPriority)
        XCTAssertEqual(4, SpyLevel.info.levelPriority)
        XCTAssertEqual(5, SpyLevel.warning.levelPriority)
        XCTAssertEqual(6, SpyLevel.severe.levelPriority)
    }
}
