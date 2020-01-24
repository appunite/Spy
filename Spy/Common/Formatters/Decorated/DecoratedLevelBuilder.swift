//
//  DecoratedLevelNameBuilder.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class DecoratedLevelNameBuilder<Level: PSpyLevel> {
    private var decorators: [AnyLevelDecorator<Level>] = []
    
    public init() {
        add(decorator: PlainLevelNameDecorator().toAnyDecorator())
    }
    
    @discardableResult public func add(decorator: AnyLevelDecorator<Level>) -> DecoratedLevelNameBuilder<Level> {
        decorators.append(decorator)
        return self
    }
    
    public func build(withLevel level: Level) -> String {
        var decoratedLevelName = ""
        for decorator in decorators {
            decoratedLevelName = decorator.decorate(level: level, value: decoratedLevelName)
        }
        return decoratedLevelName
    }
}
