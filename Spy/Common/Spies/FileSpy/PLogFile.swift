//
//  PLogFile.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/// LogFile abstraction that grants access to current file that the logs are written to.
// sourcery: AutoMockable
public protocol PLogFile {
    /// Writes data to an underlying log file
    func write(_ data: Data)
}
