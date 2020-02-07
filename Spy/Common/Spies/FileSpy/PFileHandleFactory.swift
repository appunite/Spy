//
//  PFileHandleFactory.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/// Factory for creating file handles as PFileHandle to absract out FileHandle.
// sourcery: AutoMockable
public protocol PFileHandleFactory {
    /// Creates a file handle for given url
    func createFileHandle(fileURL: URL) throws -> PFileHandle
}
