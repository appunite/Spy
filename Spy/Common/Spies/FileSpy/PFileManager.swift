//
//  PFileManager.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

// sourcery: AutoMockable
public protocol PFileManager {
    func fileExists(atPath: String) -> Bool
    func createDirectory(at: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey: Any]?) throws
    @discardableResult func createFile(atPath: String, contents: Data?, attributes: [FileAttributeKey: Any]?) -> Bool
}
