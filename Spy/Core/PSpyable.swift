//
//  PSpyable.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

// sourcery: AutoMockable
/// Represents an entity that can be spied on
public protocol PSpyable {
    /// A value logged by Spy
    var spyMessage: String { get }
}
