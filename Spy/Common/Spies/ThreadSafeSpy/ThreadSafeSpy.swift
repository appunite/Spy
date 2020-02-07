//
//  ThreadSafeSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/**
 Represents a thread safe version of a spy.
 */
public final class ThreadSafeSpy<Spy: PSpy>: PSpy {
    public typealias Level = Spy.Level
    public typealias Channel = Spy.Channel
    
    private let lock: PLock
    private let underlyingSpy: Spy
    
    init(_ underlyingSpy: Spy, lock: PLock = NSLock()) {
        self.underlyingSpy = underlyingSpy
        self.lock = lock
    }
    
    public var configuration: SpyConfiguration<Level, Channel> {
        return underlyingSpy.configuration
    }
    
    public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        lock.lock()
        underlyingSpy.apply(configuration: configuration)
        lock.unlock()
        return self
    }
    
    public func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self {
        lock.lock()
        underlyingSpy.forceLog(level: level, channel: channel, message: message)
        lock.unlock()
        return self
    }
}
