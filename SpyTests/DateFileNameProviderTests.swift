//
//  DateFileNameProviderTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

class DateFileNameProviderTests: XCTestCase {
    func testFileExtension_WhenCalled_ShouldReturnLog() {
        let timestampProviderMock = PTimestampProviderMock()
        let sut = DateFileNameProvider(timestampProvider: timestampProviderMock)
        XCTAssertEqual("log", sut.fileExtension())
    }
    
    func testFileName_WhenCalled_ShouldNameInCorrectFormat() {
        let timestampProviderMock = PTimestampProviderMock()
        timestampProviderMock.underlyingTimestamp = 0
        let sut = DateFileNameProvider(timestampProvider: timestampProviderMock)
        XCTAssertEqual("1970-01-01 01:00:00.000000+0100", sut.fileName())
    }
}
