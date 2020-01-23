//
//  CompositeSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public class CompositeSpy<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    private var spies: [AnySpy<Level, Channel>] = []
    
    public init() {
    }
    
    public func add(spy: AnySpy<Level, Channel>) -> CompositeSpy<Level, Channel> {
        spies.append(spy)
        return self
    }
        
    public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        for spy in spies {
            spy.apply(configuration: configuration)
        }
        return self
    }
        
    public func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        for spy in spies {
            spy.log(level: level, channel: channel, message: message)
        }
        return self
    }
}
