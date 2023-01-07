//
//  ApplicationStatus.swift
//  Kaalayz
//
//  Created by Shrish Deshpande on 1/7/23.
//

import Foundation

// c-style enum
// sue me
struct ApplicationStatus {
    static let rejected: Int16 = 0
    static let ongoing : Int16 = 1
    static let applied : Int16 = 2
    static let waitlist: Int16 = 3
    static let deferred: Int16 = 4
    static let accepted: Int16 = 5
}
