//
//  DecoratedLevelNameBuilder.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/** Defines builder for decorated level name by easily adding decorators.
 
 # Example usage:
 DecoratedLevelNameBuilder().add(EmojiPrefixedSpyLevelNameDecorator()).add(ColoredSpyLevelNameDecorator()).build(.severe)
 */
public final class DecoratedLevelNameBuilder<Level: PSpyLevel> {
    private var decorators: [AnyLevelDecorator<Level>] = []
    
    /// Inits builder with plain level name outpu
    public init() {
        add(decorator: PlainLevelNameDecorator().any())
    }
    
    /// Adds decorator to level name builder
    @discardableResult public func add(decorator: AnyLevelDecorator<Level>) -> DecoratedLevelNameBuilder<Level> {
        decorators.append(decorator)
        return self
    }
    
    /// Builds a name for a given level
    public func build(withLevel level: Level) -> String {
        var decoratedLevelName = ""
        for decorator in decorators {
            decoratedLevelName = decorator.decorate(level: level, value: decoratedLevelName)
        }
        return decoratedLevelName
    }
}
