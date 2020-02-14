//
//  SpiedFunctionTests.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 14/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
@testable import Spy

public final class SpiedFunctionTests: XCTestCase {
    private struct Math {
        static func squared(_ x: Int) -> Int {
            return x * x
        }
        
        static func getPI() -> Float {
            return 3.1415
        }
    }
    
    private var spyMock: PSpyMock<SpyLevel, SpyChannel>!
    
    public override func setUp() {
        spyMock = PSpyMock()
        spyMock.logLevelChannelMessageReturnValue = spyMock
    }
        
    func testCall_WhenCalled_ShouldCallUnderlyingFunction() {
        let sut = SpiedFunction(spy: spyMock.any(), level: .info, channel: .foo, spyableProvider: { value in "Called Math.squared with value \(value)" }, function: Math.squared)
        XCTAssertEqual(4, sut.callAsFunction(2))
        XCTAssertEqual(9, sut.callAsFunction(3))
    }
    
    func testCall_WhenCalled_ShouldLogMessage() {
        let sut = SpiedFunction(spy: spyMock.any(), level: .info, channel: .foo, spyableProvider: { value in "Called Math.squared with value \(value)" }, function: Math.squared)
        _ = sut.callAsFunction(2)
        XCTAssertEqual("Called Math.squared with value 2", spyMock.logLevelChannelMessageReceivedArguments?.message as? String)
    }
    
    func testCall_WhenSpyingFunctionWithoutInput_ShouldBeAbleToCallWithoutParameters() {
        let sut = SpiedFunction(spy: spyMock.any(), level: .info, channel: .foo, spyableProvider: { "getPI called" }, function: Math.getPI)
        XCTAssertEqual(Math.getPI(), sut.callAsFunction())
    }
}
