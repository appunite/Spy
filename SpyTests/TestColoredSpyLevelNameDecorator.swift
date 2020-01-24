//
//  TestColoredSpyLevelNameDecorator.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class ColoredSpyLevelNameDecoratorTests: XCTestCase {
    func testDecorate_WhenCalledWithLevel_ShouldReturnCorrectString() {
        // given
        let sut = ColoredSpyLevelNameDecorator()
        // then
        XCTAssertEqual("name".colored(with: .white), sut.decorate(level: .finest, value: "name"))
        XCTAssertEqual("name".colored(with: .cyan), sut.decorate(level: .finer, value: "name"))
        XCTAssertEqual("name".colored(with: .blue), sut.decorate(level: .fine, value: "name"))
        XCTAssertEqual("name".colored(with: .magenta), sut.decorate(level: .config, value: "name"))
        XCTAssertEqual("name".colored(with: .green), sut.decorate(level: .info, value: "name"))
        XCTAssertEqual("name".colored(with: .yellow), sut.decorate(level: .warning, value: "name"))
        XCTAssertEqual("name".colored(with: .red), sut.decorate(level: .severe, value: "name"))
    }
}
