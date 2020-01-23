//
//  SpyableStringTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class SpyableStringTests: XCTestCase {
    func testSpyMessage_WhenCalledOnString_ShouldReturnThatString() {
        let sut1 = "ABC"
        let sut2 = "def"
        XCTAssertEqual("ABC", sut1.spyMessage)
        XCTAssertEqual("def", sut2.spyMessage)
    }
}
