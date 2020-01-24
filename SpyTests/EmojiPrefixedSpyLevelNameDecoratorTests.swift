//
//  EmojiPrefixedSpyLevelNameDecoratorTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class EmojiPrefixedSpyLevelNameDecoratorTests: XCTestCase {
    func testDecorate_WhenCalledWithLevel_ShouldReturnCorrectString() {
        // given
        let sut = EmojiPrefixedSpyLevelNameDecorator()
        // then
        XCTAssertEqual("💬 name", sut.decorate(level: .finest, value: "name"))
        XCTAssertEqual("🔊 name", sut.decorate(level: .finer, value: "name"))
        XCTAssertEqual("📣 name", sut.decorate(level: .fine, value: "name"))
        XCTAssertEqual("✅ name", sut.decorate(level: .config, value: "name"))
        XCTAssertEqual("ℹ️ name", sut.decorate(level: .info, value: "name"))
        XCTAssertEqual("⚠️ name", sut.decorate(level: .warning, value: "name"))
        XCTAssertEqual("⛔ name", sut.decorate(level: .severe, value: "name"))
    }    
}
