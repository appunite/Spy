//
//  SpiedFunction.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 14/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/* A functor that decorates the function and logs a given message when it is called.

Example usage:
 let function = SpiedFunction(spy: spy, level: .info, channel: .foo, spyableProvider: { value in "Called Math.squared with value \(value)" }, function: Math.squared)
 let x = 3
 let xSquared = function.callAsFunction(x)
 With Swift 5.2 it is available to call it like this
 let xSquared = function(x)
*/
public final class SpiedFunction<Input, Output, SpyLevel: PSpyLevel, SpyChannel: PSpyChannel> {
    private let spy: AnySpy<SpyLevel, SpyChannel>
    private let level: SpyLevel
    private let channel: SpyChannel
    private let spyableProvider: (Input) -> PSpyable
    private let wrappedFunction: (Input) -> Output
    
    /// Creates a function wrapper
    public init(spy: AnySpy<SpyLevel, SpyChannel>, level: SpyLevel, channel: SpyChannel, spyableProvider: @escaping (Input) -> PSpyable, function: @escaping (Input) -> Output) {
        self.spy = spy
        self.level = level
        self.channel = channel
        self.spyableProvider = spyableProvider
        self.wrappedFunction = function
    }
    
    /// Logs the message and calls the underlying function
    public func callAsFunction(_ input: Input) -> Output {
        spy.log(level: level, channel: channel, message: spyableProvider(input))
        return wrappedFunction(input)
    }
}

public extension SpiedFunction where Input == Void {
    func callAsFunction() -> Output {
        return callAsFunction(Void())
    }
}
