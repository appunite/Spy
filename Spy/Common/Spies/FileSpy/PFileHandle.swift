//
//  PFileHandle.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol PFileHandle {
    func write(_ data: Data)
    @discardableResult func seekToEndOfFile() -> UInt64
    func closeFile()
}
