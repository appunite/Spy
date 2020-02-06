//
//  Environment.swift
//  Example
//
//  Created by Tomasz Lewandowski on 23/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Spy

public struct Environment {
    public static var spy: AnySpy<SpyLevel, SpyChannel> = {
        return CompositeSpy()
            .add(spy: ConsoleSpy<SpyLevel, SpyChannel, DecoratedSpyFormatter>(
                spyFormatter: DecoratedSpyFormatter(
                    levelNameBuilder: DecoratedLevelNameBuilder<SpyLevel>()
                        .add(decorator: EmojiPrefixedSpyLevelNameDecorator().any())
                        ),
                timestampProvider: CurrentTimestampProvider(),
                configuration: SpyConfigurationBuilder()
                    .add(levels: SpyLevel.levelsFrom(loggingLevel))
                    .add(channel: .foo)
                .build()).any())
            .add(spy: NetworkSpy()
                .apply(configuration: SpyConfigurationBuilder()
                    .add(level: .severe)
                    .add(channels: [.foo, .bar])
                    .build()).any()
            )
            .add(spy: FileSpy<SpyLevel, SpyChannel, DecoratedSpyFormatter>(
                directoryURL: logDirectoryURL,
                spyFormatter: DecoratedSpyFormatter(
                    levelNameBuilder: DecoratedLevelNameBuilder<SpyLevel>()
                        .add(decorator: EmojiPrefixedSpyLevelNameDecorator().any())
                ),
                timestampProvider: CurrentTimestampProvider(),
                configuration: SpyConfigurationBuilder()
                    .add(levels: SpyLevel.levelsFrom(loggingLevel))
                    .add(channel: .foo)
                    .build()).any()
            ).any()
    }()
    
    static var loggingLevel: SpyLevel {
        #if DEBUG
        return .info
        #else
        return .warning
        #endif
    }
    
    static var logDirectoryURL: URL {
        do {
            return try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false
            ).appendingPathComponent("spy_test_logs", isDirectory: true)
        } catch {
            fatalError()
        }
    }
}
