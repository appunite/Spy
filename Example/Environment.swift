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
            .add(spy: ConsoleSpy(
                spyFormatter: RawSpyFormatter<SpyLevel, SpyChannel>(),
                timestampProvider: CurrentTimestampProvider(),
                spyOnLevels: [],
                spyOnChannels: []).toAnySpy())
            .configure(spyOnLevels: [.info, .warning, .severe])
            .configure(spyOnChannels: [.lifecycle])
            .toAnySpy()
    }()
}
