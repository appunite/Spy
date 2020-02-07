//
//  PFileManager.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/// Protocol for accessing file system basic operations
// sourcery: AutoMockable
public protocol PFileManager {
    /// Returns true if file exists
    func fileExists(atPath: String) -> Bool
    /// Creates a directory at given path
    func createDirectory(at: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey: Any]?) throws
    /// Creates a file at given path
    @discardableResult func createFile(atPath: String, contents: Data?, attributes: [FileAttributeKey: Any]?) -> Bool
}
