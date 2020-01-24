//
//  SpyColorTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class SpyColorTests: XCTestCase {
    func testModificator_WhenCalledForColor_ShouldReturnCorrectString() {
        // then
        XCTAssertEqual("\u{001B}[0;0m", SpyColor.`default`.modificator)
        XCTAssertEqual("\u{001B}[0;30m", SpyColor.black.modificator)
        XCTAssertEqual("\u{001B}[0;31m", SpyColor.red.modificator)
        XCTAssertEqual("\u{001B}[0;32m", SpyColor.green.modificator)
        XCTAssertEqual("\u{001B}[0;33m", SpyColor.yellow.modificator)
        XCTAssertEqual("\u{001B}[0;34m", SpyColor.blue.modificator)
        XCTAssertEqual("\u{001B}[0;35m", SpyColor.magenta.modificator)
        XCTAssertEqual("\u{001B}[0;36m", SpyColor.cyan.modificator)
        XCTAssertEqual("\u{001B}[0;37m", SpyColor.white.modificator)
    }
    
    func testColored_WhenCalledOnString_ShouldReturnColoredString() {
        XCTAssertEqual("\u{001B}[0;31mtext\u{001B}[0;0m", "text".colored(with: .red))
    }
}
