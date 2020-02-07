//
//  PFileNameProvider.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/// Provides name and extension for log files
// sourcery: AutoMockable
public protocol PFileNameProvider {
    /// Returns name for a log file
    func fileName() -> String
    /// Returns extension for a log file
    func fileExtension() -> String
}
