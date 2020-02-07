//
//  LogFileType.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public enum LogFileType {
    case monolith
    case chunked(maxLogsPerFile: UInt64)
}
