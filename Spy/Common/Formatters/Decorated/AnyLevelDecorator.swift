//
//  AnyLevelDecorator.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 24/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/** Type-erased implementation of PSpyLevelDecorator.
 
 #Example usage:
 - AnyLevelDecorator(decorator)
 - decorator.any()
*/
public final class AnyLevelDecorator<Level: PSpyLevel>: PSpyLevelDecorator {
    private let decorator: _AnyLevelDecoratorBase<Level>
    
    public init<Decorator: PSpyLevelDecorator>(_ decorator: Decorator) where Decorator.Level == Level {
        self.decorator = _AnyLevelDecoratorBox(decorator)
    }

    public func decorate(level: Level, value: String) -> String {
        return decorator.decorate(level: level, value: value)
    }
}

private final class _AnyLevelDecoratorBox<Decorator: PSpyLevelDecorator>: _AnyLevelDecoratorBase<Decorator.Level> {
    let decorator: Decorator
    
    init(_ decorator: Decorator) {
        self.decorator = decorator
        super.init()
    }

    override func decorate(level: Level, value: String) -> String {
        return decorator.decorate(level: level, value: value)
    }
}

private class _AnyLevelDecoratorBase<Level: PSpyLevel>: PSpyLevelDecorator {
    func decorate(level: Level, value: String) -> String {
        fatalError("Must be overriden")
    }
}
