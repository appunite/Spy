//
//  DateFileNameProvider.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 07/02/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

public class DateFileNameProvider: PFileNameProvider {
    private let timestampProvider: PTimestampProvider
    private let dateFormatter: DateFormatter
    
    public init(timestampProvider: PTimestampProvider, dateFormatter: DateFormatter = SpyDateFormatter.default) {
        self.timestampProvider = timestampProvider
        self.dateFormatter = dateFormatter
    }
    
    public func fileName() -> String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: timestampProvider.timestamp))
    }
    
    public func fileExtension() -> String {
        return "log"
    }
}
