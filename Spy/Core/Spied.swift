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
    private var accessingMapper: (PSpyable) -> PSpyable
    private var settingMapper: (PSpyable) -> PSpyable
    
    public var wrappedValue: T {
        get {
            spy.log(level: level, channel: channel, message: accessingMapper(value))
            return value
        }
        set {
            spy.log(level: level, channel: channel, message: settingMapper(value))
            value = newValue
        }
    }
    
    public init(wrappedValue: T, spy: AnySpy<SpyLevel, SpyChannel>, onLevel level: SpyLevel, onChannel channel: SpyChannel) {
        self.value = wrappedValue
        self.spy = spy
        self.level = level
        self.channel = channel
        self.accessingMapper = { spyable in "Accessing: \(spyable.spyMessage)" }
        self.settingMapper = { spyable in "Setting: \(spyable.spyMessage)" }
    }
    
    public init(wrappedValue: T,
                spy: AnySpy<SpyLevel, SpyChannel>,
                onLevel level: SpyLevel,
                onChannel channel: SpyChannel,
                accessingMapper: @escaping (PSpyable) -> PSpyable,
                settingMapper: @escaping (PSpyable) -> PSpyable) {
        self.value = wrappedValue
        self.spy = spy
        self.level = level
        self.channel = channel
        self.accessingMapper = accessingMapper
        self.settingMapper = settingMapper
    }

}
