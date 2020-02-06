//
//  FileSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/** Concrete implementation of a spy which logs to file.
 
Example usage:
FileSpy(directoryURL: URL(fileURLWithPath: "/users/foo/logs/"), spyFormatter: RawSpyFormatter(), timestampProvider: CurrentTimestampProvider())
 .log(level: .info, channel: .foo, message: "Hello spy")
*/
public final class FileSpy<Level, Channel, Formatter: PSpyFormatter>: PSpy where Formatter.Level == Level, Formatter.Channel == Channel {
    public private(set) var configuration: SpyConfiguration<Level, Channel>
    private let spyFormatter: Formatter
    private let timestampProvider: PTimestampProvider
    private let directoryURL: URL
    private let fileManager: PFileManager
    private let fileHandleFactory: PFileHandleFactory
    private var currentLogFile: PFileHandle!

    /// Initializes FileSpy to create logs in given directory with given formatter, timestamp provider and configuration
    public init(directoryURL: URL,
                spyFormatter: Formatter,
                timestampProvider: PTimestampProvider,
                configuration: SpyConfiguration<Level, Channel> = SpyConfiguration(),
                fileManager: PFileManager = FileManager.default,
                fileHandleFactory: PFileHandleFactory = FileHandleFactory()) {
        self.spyFormatter = spyFormatter
        self.timestampProvider = timestampProvider
        self.configuration = configuration
        self.directoryURL = directoryURL
        self.fileManager = fileManager
        self.fileHandleFactory = fileHandleFactory
        createNewLogFile()
    }
    
    deinit {
        currentLogFile?.closeFile()
    }
        
    @discardableResult public func apply(configuration: SpyConfiguration<Level, Channel>) -> Self {
        self.configuration = configuration
        return self
    }
    
    @discardableResult public func forceLog(level: Level, channel: Channel, message: PSpyable) -> Self {
        guard let data = self.message(level: level, channel: channel, message: message)
            .data(using: .utf8) else {
            return self
        }
        currentLogFile.write(data)
        return self
    }
    
    private func message(level: Level, channel: Channel, message: PSpyable) -> String {
        return spyFormatter.format(timestamp: timestampProvider.timestamp, level: level, channel: channel, message: message) + "\n"
    }
    
    private func createNewLogFile() {
        if !fileManager.fileExists(atPath: directoryURL.path) {
            // swiftlint:disable force_try
            try! fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        }
        let fileURL = directoryURL.appendingPathComponent("\(Date(timeIntervalSince1970: timestampProvider.timestamp))").appendingPathExtension("log")
        if !fileManager.fileExists(atPath: fileURL.path) {
            fileManager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
        }
        // swiftlint:disable force_try
        self.currentLogFile = try! fileHandleFactory.createFileHandle(fileURL: fileURL)
        self.currentLogFile.seekToEndOfFile()
    }
}
