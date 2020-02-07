//
//  LogFileType.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/** Represents a type of LogFile. It can be one of two variations
    - monolith -  single file per session
    - chunked - multiple files per session with maximum logs per file specified
*/
public enum LogFileType {
    /// Single file per session
    case monolith
    /// Multiple files per session with maximum logs per file specified
    case chunked(maxLogsPerFile: UInt64)
}
