//
//  AnySpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class AnySpy<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    private let spy: _AnySpyBase<Level, Channel>
    
    public init<Spy: PSpy>(_ spy: Spy) where Spy.Level == Level, Spy.Channel == Channel {
        self.spy = _AnySpyBox(spy)
    }
    
    @discardableResult public func configure(spyOnLevels: Set<Level>) -> Self {
        spy.configure(spyOnLevels: spyOnLevels)
        return self
    }
    
    @discardableResult public func configure(spyOnChannels: Set<Channel>) -> Self {
        spy.configure(spyOnChannels: spyOnChannels)
        return self
    }
    
    @discardableResult public func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        spy.log(level: level, channel: channel, message: message)
        return self
    }
}

private final class _AnySpyBox<Spy: PSpy>: _AnySpyBase<Spy.Level, Spy.Channel> {
    public typealias Level = Spy.Level
    public typealias Channel = Spy.Channel
    private let spy: Spy
    
    init(_ spy: Spy) {
        self.spy = spy
        super.init()
    }
    
    @discardableResult public override func configure(spyOnLevels: Set<Spy.Level>) -> Self {
        spy.configure(spyOnLevels: spyOnLevels)
        return self
    }
    
    @discardableResult public override func configure(spyOnChannels: Set<Spy.Channel>) -> Self {
        spy.configure(spyOnChannels: spyOnChannels)
        return self
    }
    
    @discardableResult public override func log(level: Spy.Level, channel: Spy.Channel, message: PSpyable) -> Self {
        spy.log(level: level, channel: channel, message: message)
        return self
    }
}

private class _AnySpyBase<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    init() {
        guard type(of: self) != _AnySpyBase.self else {
            fatalError("_AnyCollectionProviderBase<Item> instances can not be created; create a subclass instance instead")
        }
    }
    
    @discardableResult public func configure(spyOnLevels: Set<Level>) -> Self {
        fatalError("Must override")
    }
    
    @discardableResult public func configure(spyOnChannels: Set<Channel>) -> Self {
        fatalError("Must override")
    }
    
    @discardableResult public func log(level: Level, channel: Channel, message: PSpyable) -> Self {
        fatalError("Must override")
    }
    
    func hasLoadedData() -> Bool {
        fatalError("Must override")
    }
}

