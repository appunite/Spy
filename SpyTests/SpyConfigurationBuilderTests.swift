//
//  SpyConfigurationBuilderTests.swift
//  SpyTests
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import XCTest
import Spy

public final class SpyConfigurationBuilderTests: XCTestCase {
    var sut: SpyConfigurationBuilder<SpyLevel, SpyChannel>!
    
    override public func setUp() {
        super.setUp()
        sut = SpyConfigurationBuilder()
    }
    
    func testAddLevel_WhenCalled_ShouldAddLevel() {
        let configuration = sut.add(level: .info).build()
        XCTAssertEqual([.info], configuration.spyOnLevels)
    }
    
    func testRemoveLevel_WhenCalled_ShouldRemoveLevel() {
        let configuration = sut.add(levels: [.info, .severe]).remove(level: .info).build()
        XCTAssertEqual([.severe], configuration.spyOnLevels)
    }
    
    func testAddLevels_WhenCalled_ShouldAddLevels() {
        let configuration = sut.add(levels: [.info, .severe]).build()
        XCTAssertEqual([.info, .severe], configuration.spyOnLevels)
    }
    
    func testRemoveLevels_WhenCalled_ShouldRemoveLevels() {
        let configuration = sut.add(levels: [.info, .severe, .warning]).remove(levels: [.info, .severe]).build()
        XCTAssertEqual([.warning], configuration.spyOnLevels)
    }
    
    func testAddChannel_WhenCalled_ShouldAddChannel() {
        let configuration = sut.add(channel: .foo).build()
        XCTAssertEqual([.foo], configuration.spyOnChannels)
    }
    
    func testRemoveChannel_WhenCalled_ShouldRemoveChannel() {
        let configuration = sut.add(channels: [.foo, .bar]).remove(channel: .foo).build()
        XCTAssertEqual([.bar], configuration.spyOnChannels)
    }
    
    func testAddChannels_WhenCalled_ShouldAddChannels() {
        let configuration = sut.add(channels: [.foo, .bar]).build()
        XCTAssertEqual([.foo, .bar], configuration.spyOnChannels)
    }
    
    func testRemoveChannels_WhenCalled_ShouldRemoveChannels() {
        let configuration = sut.add(channels: [.foo, .bar, .defaultChannel]).remove(channels: [.foo, .bar]).build()
        XCTAssertEqual([.defaultChannel], configuration.spyOnChannels)
    }
}
