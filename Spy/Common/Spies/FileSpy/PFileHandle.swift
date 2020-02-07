//
//  PFileHandle.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/// Represents a handle to file
// sourcery: AutoMockable
public protocol PFileHandle {
    /// Writes given data to the file at cursor position
    func write(_ data: Data)
    /// Places writting cursor on the end of the file
    @discardableResult func seekToEndOfFile() -> UInt64
    /// Closes a file and frees a resource
    func closeFile()
}
