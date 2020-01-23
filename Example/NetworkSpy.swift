//
//  NetworkSpy.swift
//  Example
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Spy

public final class NetworkSpy<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    private(set) public var configuration: SpyConfiguration<Level, Channel> = SpyConfiguration()
    
    @discardableResult public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        self.configuration = configuration
        return self
    }
        
    @discardableResult public func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self {
        print("ToDo: send it over network: \(message.spyMessage)")
        return self
    }
}
