//
//  LogFile.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

import Foundation

/** LogFile grants access to current file that the logs are written to.
It can be one of two types:
- monolith - single log file per session
- chunked - multiple log files per session
*/
public final class LogFile: PLogFile {
    private let type: LogFileType
    private let directoryURL: URL
    private let fileNameProvider: PFileNameProvider
    private let fileManager: PFileManager
    private let fileHandleFactory: PFileHandleFactory
    private var logsRegistered: UInt64 = 0
    private lazy var currentLogFile: PFileHandle! = {
        return createNewLogFile()
    }()

    /// Initializes the LogFile
    public init(
        type: LogFileType,
        directoryURL: URL,
        fileNameProvider: PFileNameProvider = DateFileNameProvider(
            timestampProvider: CurrentTimestampProvider()
        ),
        fileManager: PFileManager = FileManager.default,
        fileHandleFactory: PFileHandleFactory = FileHandleFactory()) {
        self.type = type
        self.directoryURL = directoryURL
        self.fileNameProvider = fileNameProvider
        self.fileManager = fileManager
        self.fileHandleFactory = fileHandleFactory
    }
    
    deinit {
        currentLogFile?.closeFile()
    }
    
    /// Writes data to an underlying log file and creates new one if needed
    public func write(_ data: Data) {
        defer {
            currentLogFile.write(data)
            logsRegistered += 1
        }
        switch type {
        case .monolith: break
        case .chunked(let maxLogsPerFile):
            if logsRegistered >= maxLogsPerFile {
                currentLogFile?.closeFile()
                currentLogFile = createNewLogFile()
                logsRegistered = 0
            }
        }
    }
    
    private func createNewLogFile() -> PFileHandle {
        createDirectoryIfNeeded()
        let fileURL = createFileIfNeeded()
        // swiftlint:disable force_try
        let logFile = try! fileHandleFactory.createFileHandle(fileURL: fileURL)
        logFile.seekToEndOfFile()
        return logFile
    }
    
    private func createDirectoryIfNeeded() {
        if !fileManager.fileExists(atPath: directoryURL.path) {
            // swiftlint:disable force_try
            try! fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    private func createFileIfNeeded() -> URL {
        let fileURL = directoryURL.appendingPathComponent(fileNameProvider.fileName()).appendingPathExtension(fileNameProvider.fileExtension())
        if !fileManager.fileExists(atPath: fileURL.path) {
            fileManager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
        }
        return fileURL
    }
}
