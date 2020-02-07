//
//  PFileHandleFactory.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol PFileHandleFactory {
    func createFileHandle(fileURL: URL) throws -> PFileHandle
}