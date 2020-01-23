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
