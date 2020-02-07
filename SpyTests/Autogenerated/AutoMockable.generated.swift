// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














final class PFileHandleMock: PFileHandle {

    //MARK: - write

    var writeCallsCount = 0
    var writeCalled: Bool {
        return writeCallsCount > 0
    }
    var writeReceivedData: Data?
    var writeReceivedInvocations: [Data] = []
    var writeClosure: ((Data) -> Void)?

    func write(_ data: Data) {
        writeCallsCount += 1
        writeReceivedData = data
        writeReceivedInvocations.append(data)
        writeClosure?(data)
    }

    //MARK: - seekToEndOfFile

    var seekToEndOfFileCallsCount = 0
    var seekToEndOfFileCalled: Bool {
        return seekToEndOfFileCallsCount > 0
    }
    var seekToEndOfFileReturnValue: UInt64!
    var seekToEndOfFileClosure: (() -> UInt64)?

    func seekToEndOfFile() -> UInt64 {
        seekToEndOfFileCallsCount += 1
        return seekToEndOfFileClosure.map({ $0() }) ?? seekToEndOfFileReturnValue
    }

    //MARK: - closeFile

    var closeFileCallsCount = 0
    var closeFileCalled: Bool {
        return closeFileCallsCount > 0
    }
    var closeFileClosure: (() -> Void)?

    func closeFile() {
        closeFileCallsCount += 1
        closeFileClosure?()
    }

}
final class PFileHandleFactoryMock: PFileHandleFactory {

    //MARK: - createFileHandle

    var createFileHandleFileURLThrowableError: Error?
    var createFileHandleFileURLCallsCount = 0
    var createFileHandleFileURLCalled: Bool {
        return createFileHandleFileURLCallsCount > 0
    }
    var createFileHandleFileURLReceivedFileURL: URL?
    var createFileHandleFileURLReceivedInvocations: [URL] = []
    var createFileHandleFileURLReturnValue: PFileHandle!
    var createFileHandleFileURLClosure: ((URL) throws -> PFileHandle)?

    func createFileHandle(fileURL: URL) throws -> PFileHandle {
        if let error = createFileHandleFileURLThrowableError {
            throw error
        }
        createFileHandleFileURLCallsCount += 1
        createFileHandleFileURLReceivedFileURL = fileURL
        createFileHandleFileURLReceivedInvocations.append(fileURL)
        return try createFileHandleFileURLClosure.map({ try $0(fileURL) }) ?? createFileHandleFileURLReturnValue
    }

}
final class PFileManagerMock: PFileManager {

    //MARK: - fileExists

    var fileExistsAtPathCallsCount = 0
    var fileExistsAtPathCalled: Bool {
        return fileExistsAtPathCallsCount > 0
    }
    var fileExistsAtPathReceivedAtPath: String?
    var fileExistsAtPathReceivedInvocations: [String] = []
    var fileExistsAtPathReturnValue: Bool!
    var fileExistsAtPathClosure: ((String) -> Bool)?

    func fileExists(atPath: String) -> Bool {
        fileExistsAtPathCallsCount += 1
        fileExistsAtPathReceivedAtPath = atPath
        fileExistsAtPathReceivedInvocations.append(atPath)
        return fileExistsAtPathClosure.map({ $0(atPath) }) ?? fileExistsAtPathReturnValue
    }

    //MARK: - createDirectory

    var createDirectoryAtWithIntermediateDirectoriesAttributesThrowableError: Error?
    var createDirectoryAtWithIntermediateDirectoriesAttributesCallsCount = 0
    var createDirectoryAtWithIntermediateDirectoriesAttributesCalled: Bool {
        return createDirectoryAtWithIntermediateDirectoriesAttributesCallsCount > 0
    }
    var createDirectoryAtWithIntermediateDirectoriesAttributesReceivedArguments: (at: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey: Any]?)?
    var createDirectoryAtWithIntermediateDirectoriesAttributesReceivedInvocations: [(at: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey: Any]?)] = []
    var createDirectoryAtWithIntermediateDirectoriesAttributesClosure: ((URL, Bool, [FileAttributeKey: Any]?) throws -> Void)?

    func createDirectory(at: URL, withIntermediateDirectories: Bool, attributes: [FileAttributeKey: Any]?) throws {
        if let error = createDirectoryAtWithIntermediateDirectoriesAttributesThrowableError {
            throw error
        }
        createDirectoryAtWithIntermediateDirectoriesAttributesCallsCount += 1
        createDirectoryAtWithIntermediateDirectoriesAttributesReceivedArguments = (at: at, withIntermediateDirectories: withIntermediateDirectories, attributes: attributes)
        createDirectoryAtWithIntermediateDirectoriesAttributesReceivedInvocations.append((at: at, withIntermediateDirectories: withIntermediateDirectories, attributes: attributes))
        try createDirectoryAtWithIntermediateDirectoriesAttributesClosure?(at, withIntermediateDirectories, attributes)
    }

    //MARK: - createFile

    var createFileAtPathContentsAttributesCallsCount = 0
    var createFileAtPathContentsAttributesCalled: Bool {
        return createFileAtPathContentsAttributesCallsCount > 0
    }
    var createFileAtPathContentsAttributesReceivedArguments: (atPath: String, contents: Data?, attributes: [FileAttributeKey: Any]?)?
    var createFileAtPathContentsAttributesReceivedInvocations: [(atPath: String, contents: Data?, attributes: [FileAttributeKey: Any]?)] = []
    var createFileAtPathContentsAttributesReturnValue: Bool!
    var createFileAtPathContentsAttributesClosure: ((String, Data?, [FileAttributeKey: Any]?) -> Bool)?

    func createFile(atPath: String, contents: Data?, attributes: [FileAttributeKey: Any]?) -> Bool {
        createFileAtPathContentsAttributesCallsCount += 1
        createFileAtPathContentsAttributesReceivedArguments = (atPath: atPath, contents: contents, attributes: attributes)
        createFileAtPathContentsAttributesReceivedInvocations.append((atPath: atPath, contents: contents, attributes: attributes))
        return createFileAtPathContentsAttributesClosure.map({ $0(atPath, contents, attributes) }) ?? createFileAtPathContentsAttributesReturnValue
    }

}
final class PFileNameProviderMock: PFileNameProvider {

    //MARK: - fileName

    var fileNameCallsCount = 0
    var fileNameCalled: Bool {
        return fileNameCallsCount > 0
    }
    var fileNameReturnValue: String!
    var fileNameClosure: (() -> String)?

    func fileName() -> String {
        fileNameCallsCount += 1
        return fileNameClosure.map({ $0() }) ?? fileNameReturnValue
    }

    //MARK: - fileExtension

    var fileExtensionCallsCount = 0
    var fileExtensionCalled: Bool {
        return fileExtensionCallsCount > 0
    }
    var fileExtensionReturnValue: String!
    var fileExtensionClosure: (() -> String)?

    func fileExtension() -> String {
        fileExtensionCallsCount += 1
        return fileExtensionClosure.map({ $0() }) ?? fileExtensionReturnValue
    }

}
final class PLogFileMock: PLogFile {

    //MARK: - write

    var writeCallsCount = 0
    var writeCalled: Bool {
        return writeCallsCount > 0
    }
    var writeReceivedData: Data?
    var writeReceivedInvocations: [Data] = []
    var writeClosure: ((Data) -> Void)?

    func write(_ data: Data) {
        writeCallsCount += 1
        writeReceivedData = data
        writeReceivedInvocations.append(data)
        writeClosure?(data)
    }

}
final class PSpyMock<Level: PSpyLevel, Channel: PSpyChannel>: PSpy {
    var configuration: SpyConfiguration<Level, Channel> {
        get { return underlyingConfiguration }
        set(value) { underlyingConfiguration = value }
    }
    var underlyingConfiguration: SpyConfiguration<Level, Channel>!

    //MARK: - apply

    var applyConfigurationCallsCount = 0
    var applyConfigurationCalled: Bool {
        return applyConfigurationCallsCount > 0
    }
    var applyConfigurationReceivedConfiguration: SpyConfiguration<Level, Channel>?
    var applyConfigurationReceivedInvocations: [SpyConfiguration<Level, Channel>] = []
    var applyConfigurationReturnValue: PSpyMock<Level, Channel>!
    var applyConfigurationClosure: ((SpyConfiguration<Level, Channel>) -> PSpyMock<Level, Channel>)?

    func apply(configuration: SpyConfiguration<Level, Channel>) -> PSpyMock<Level, Channel> {
        applyConfigurationCallsCount += 1
        applyConfigurationReceivedConfiguration = configuration
        applyConfigurationReceivedInvocations.append(configuration)
        return applyConfigurationClosure.map({ $0(configuration) }) ?? applyConfigurationReturnValue
    }

    //MARK: - log

    var logLevelChannelMessageCallsCount = 0
    var logLevelChannelMessageCalled: Bool {
        return logLevelChannelMessageCallsCount > 0
    }
    var logLevelChannelMessageReceivedArguments: (level: Level, channel: Channel, message: PSpyable)?
    var logLevelChannelMessageReceivedInvocations: [(level: Level, channel: Channel, message: PSpyable)] = []
    var logLevelChannelMessageReturnValue: PSpyMock<Level, Channel>!
    var logLevelChannelMessageClosure: ((Level, Channel, PSpyable) -> PSpyMock<Level, Channel>)?

    func log(level: Level, channel: Channel, message: PSpyable) -> PSpyMock<Level, Channel> {
        logLevelChannelMessageCallsCount += 1
        logLevelChannelMessageReceivedArguments = (level: level, channel: channel, message: message)
        logLevelChannelMessageReceivedInvocations.append((level: level, channel: channel, message: message))
        return logLevelChannelMessageClosure.map({ $0(level, channel, message) }) ?? logLevelChannelMessageReturnValue
    }

    //MARK: - forceLog

    var forceLogLevelChannelMessageCallsCount = 0
    var forceLogLevelChannelMessageCalled: Bool {
        return forceLogLevelChannelMessageCallsCount > 0
    }
    var forceLogLevelChannelMessageReceivedArguments: (level: Level, channel: Channel, message: PSpyable)?
    var forceLogLevelChannelMessageReceivedInvocations: [(level: Level, channel: Channel, message: PSpyable)] = []
    var forceLogLevelChannelMessageReturnValue: PSpyMock<Level, Channel>!
    var forceLogLevelChannelMessageClosure: ((Level, Channel, PSpyable) -> PSpyMock<Level, Channel>)?

    func forceLog(level: Level, channel: Channel, message: PSpyable) -> PSpyMock<Level, Channel> {
        forceLogLevelChannelMessageCallsCount += 1
        forceLogLevelChannelMessageReceivedArguments = (level: level, channel: channel, message: message)
        forceLogLevelChannelMessageReceivedInvocations.append((level: level, channel: channel, message: message))
        return forceLogLevelChannelMessageClosure.map({ $0(level, channel, message) }) ?? forceLogLevelChannelMessageReturnValue
    }

}
final class PSpyFormatterMock<Level: PSpyLevel, Channel: PSpyChannel>: PSpyFormatter {

    //MARK: - format

    var formatTimestampLevelChannelMessageCallsCount = 0
    var formatTimestampLevelChannelMessageCalled: Bool {
        return formatTimestampLevelChannelMessageCallsCount > 0
    }
    var formatTimestampLevelChannelMessageReceivedArguments: (timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable)?
    var formatTimestampLevelChannelMessageReceivedInvocations: [(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable)] = []
    var formatTimestampLevelChannelMessageReturnValue: String!
    var formatTimestampLevelChannelMessageClosure: ((TimeInterval, Level, Channel, PSpyable) -> String)?

    func format(timestamp: TimeInterval, level: Level, channel: Channel, message: PSpyable) -> String {
        formatTimestampLevelChannelMessageCallsCount += 1
        formatTimestampLevelChannelMessageReceivedArguments = (timestamp: timestamp, level: level, channel: channel, message: message)
        formatTimestampLevelChannelMessageReceivedInvocations.append((timestamp: timestamp, level: level, channel: channel, message: message))
        return formatTimestampLevelChannelMessageClosure.map({ $0(timestamp, level, channel, message) }) ?? formatTimestampLevelChannelMessageReturnValue
    }

}
final class PSpyableMock: PSpyable {
    var spyMessage: String {
        get { return underlyingSpyMessage }
        set(value) { underlyingSpyMessage = value }
    }
    var underlyingSpyMessage: String!

}
final class PTimestampProviderMock: PTimestampProvider {
    var timestamp: TimeInterval {
        get { return underlyingTimestamp }
        set(value) { underlyingTimestamp = value }
    }
    var underlyingTimestamp: TimeInterval!

}

//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.

import Foundation
@testable import Spy
