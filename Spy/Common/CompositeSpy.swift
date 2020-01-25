//
//  CompositeSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/** A concrete implementation of spy which groups multiple spies into one.
 
 # Example usage:
 CompositeSpy().add(consoleSpy.any()).add(networkSpy.any())
 */
public class CompositeSpy<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    private(set) public var configuration: SpyConfiguration<Level, Channel> = SpyConfiguration()
    
    private var spies: [AnySpy<Level, Channel>] = []
    
    public init() {
    }
    
    /// Add spy to the composite
    @discardableResult public func add(spy: AnySpy<Level, Channel>) -> Self {
        spies.append(spy)
        return self
    }

    /// Apply configuration to spy and all underlying spies
    @discardableResult public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        self.configuration = configuration
        for spy in spies {
            spy.apply(configuration: configuration)
        }
        return self
    }
    
    /// Log the message data onto every underlying spy
    /// Please note that configuration checks are performed per underlying spy
    @discardableResult public func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        for spy in spies {
            spy.log(level: level, channel: channel, message: message)
        }
        return self
    }
    
    /// Force log the message data onto every underlying spy wihtout configuration checking
    @discardableResult public func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self {
        for spy in spies {
            spy.forceLog(level: level, channel: channel, message: message)
        }
        return self
    }
}
