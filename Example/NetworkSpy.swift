//
//  NetworkSpy.swift
//  Example
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Spy

public final class NetworkSpy<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    private var configuration: SpyConfiguration<Level, Channel> = SpyConfiguration()
    
    public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        self.configuration = configuration
        return self
    }
    
    public func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        guard configuration.shouldLog(level: level, channel: channel) else { return self }
        print("ToDo: send it over network: \(message.spyMessage)")
        return self
    }
}
