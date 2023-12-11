//
//  ChangeRoundType.swift
//  CleanLotto
//
//  Created by elly on 12/12/23.
//

import Foundation

enum ChangeRoundType: Int {
    case next = 1
    case previous = -1
    
    var value: Int {
        return self.rawValue
    }
}
