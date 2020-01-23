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
            .add(spy: ConsoleSpy<SpyLevel, SpyChannel, RawSpyFormatter>(
                spyFormatter: RawSpyFormatter(),
                timestampProvider: CurrentTimestampProvider(),
                configuration: SpyConfigurationBuilder()
                    .add(levels: SpyLevel.levelsFrom(loggingLevel))
                    .add(channel: .lifecycle)
                .build()).toAnySpy())
            .add(spy: NetworkSpy()
                .apply(configuration: SpyConfigurationBuilder()
                    .add(level: .severe)
                    .add(channels: [.lifecycle, .other])
                    .build()).toAnySpy()
        ).toAnySpy()
    }()
    
    static var loggingLevel: SpyLevel {
        #if DEBUG
        return .info
        #else
        return .warning
        #endif
    }
}
