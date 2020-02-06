//
//  FileHandleFactory.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public final class FileHandleFactory: PFileHandleFactory {
    public init() {
        
    }

    public func createFileHandle(fileURL: URL) throws -> PFileHandle {
        return try FileHandle.init(forWritingTo: fileURL)
    }
}
