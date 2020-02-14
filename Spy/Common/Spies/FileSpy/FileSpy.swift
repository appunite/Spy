//
//  FileSpy.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 06/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/** Concrete implementation of a spy which logs to file.
 
Example usage:
FileSpy(logFile: LogFile(type: .monolith, directoryURL: URL(fileURLWithPath: "/users/foo/logs/")), spyFormatter: RawSpyFormatter(), timestampProvider: CurrentTimestampProvider())
 .log(level: .info, channel: .foo, message: "Hello spy")
*/
public final class FileSpy<Level, Channel, Formatter: PSpyFormatter>: PSpy where Formatter.Level == Level, Formatter.Channel == Channel {
    public private(set) var configuration: SpyConfiguration<Level, Channel>
    private let spyFormatter: Formatter
    private let timestampProvider: PTimestampProvider
    private let logFile: PLogFile

    /// Initializes FileSpy to create logs in given directory with given formatter, timestamp provider and configuration
    public init(logFile: PLogFile,
                spyFormatter: Formatter,
                timestampProvider: PTimestampProvider,
                configuration: SpyConfiguration<Level, Channel> = SpyConfiguration()) {
        self.logFile = logFile
        self.spyFormatter = spyFormatter
        self.timestampProvider = timestampProvider
        self.configuration = configuration
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
        logFile.write(data)
        return self
    }
    
    private func message(level: Level, channel: Channel, message: PSpyable) -> String {
        return spyFormatter.format(timestamp: timestampProvider.timestamp, level: level, channel: channel, message: message) + "\n"
    }    
}
