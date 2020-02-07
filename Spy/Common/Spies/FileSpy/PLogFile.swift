//
//  PLogFile.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
public protocol PLogFile {
    func write(_ data: Data)
}
