//
//  FileHandleFactory.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

public final class FileHandleFactory: PFileHandleFactory {
    /// Creates a FIleHandleFactory
    public init() {
        
    }

    public func createFileHandle(fileURL: URL) throws -> PFileHandle {
        return try FileHandle.init(forWritingTo: fileURL)
    }
}
