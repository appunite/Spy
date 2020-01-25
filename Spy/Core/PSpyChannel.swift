//
//  PSpyChannel.swift
//  Spy
//
//  Created by Tomasz Lewandowski on 22/01/2020.
//  Copyright © 2020 AppUnite Sp. z o.o. All rights reserved.
//

/** Protocol representing spy channel. It can be used for categorization of logs. You can define your own channels by creating an enum that conforms to that protocol
 
 #Example definition:
 enum SpuChannel: String, PSpyChannel {
     case foo
     case bar
     var channelName: String {
         return self.rawValue
     }
 }
*/
public protocol PSpyChannel: Hashable {
    /// Name of the channel that will be logged by Spy
    var channelName: String { get }
}
