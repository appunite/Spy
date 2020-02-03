//
//  Spied.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 01/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

@propertyWrapper
public struct Spied<SpyLevel: PSpyLevel, SpyChannel: PSpyChannel, T: PSpyable> {
    private var spy: AnySpy<SpyLevel, SpyChannel>
    private var value: T
    private var level: SpyLevel
    private var channel: SpyChannel
    private var getMapper: (PSpyable) -> PSpyable
    private var setMapper: (PSpyable) -> PSpyable
    
    public var wrappedValue: T {
        get {
            spy.log(level: level, channel: channel, message: getMapper(value))
            return value
        }
        set {
            spy.log(level: level, channel: channel, message: setMapper(value))
            value = newValue
        }
    }
    
    public init(wrappedValue: T, spy: AnySpy<SpyLevel, SpyChannel>, onLevel level: SpyLevel, onChannel channel: SpyChannel) {
        self.value = wrappedValue
        self.spy = spy
        self.level = level
        self.channel = channel
        self.getMapper = { spyable in "Get: \(spyable.spyMessage)" }
        self.setMapper = { spyable in "Set: \(spyable.spyMessage)" }
    }
    
    public init(wrappedValue: T,
                spy: AnySpy<SpyLevel, SpyChannel>,
                onLevel level: SpyLevel,
                onChannel channel: SpyChannel,
                getMapper: @escaping (PSpyable) -> PSpyable,
                setMapper: @escaping (PSpyable) -> PSpyable) {
        self.value = wrappedValue
        self.spy = spy
        self.level = level
        self.channel = channel
        self.getMapper = getMapper
        self.setMapper = setMapper
    }

}
