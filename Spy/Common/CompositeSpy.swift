//
//  CompositeSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public class CompositeSpy<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    private(set) public var configuration: SpyConfiguration<Level, Channel> = SpyConfiguration()
    
    private var spies: [AnySpy<Level, Channel>] = []
    
    public init() {
    }
    
    @discardableResult public func add(spy: AnySpy<Level, Channel>) -> Self {
        spies.append(spy)
        return self
    }
        
    @discardableResult public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        self.configuration = configuration
        for spy in spies {
            spy.apply(configuration: configuration)
        }
        return self
    }
        
    @discardableResult public func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        for spy in spies {
            spy.log(level: level, channel: channel, message: message)
        }
        return self
    }
    
    @discardableResult public func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self {
        for spy in spies {
            spy.forceLog(level: level, channel: channel, message: message)
        }
        return self
    }
}
