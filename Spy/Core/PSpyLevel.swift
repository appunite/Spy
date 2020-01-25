//
//  PSpyLevel.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/// Protocol representing spy level. It can be used for alert level categorization of logs. You can define your own levels by creating an enum that conforms to this protocol. Please see SpyLevel for shipped concrete implementation.
public protocol PSpyLevel: Hashable {
    /// Name of the lvel that will be logged by Spy
    var levelName: String { get }
}
