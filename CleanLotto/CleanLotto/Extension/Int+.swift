//
//  Int+.swift
//  CleanLotto
//
//  Created by elly on 12/11/23.
//

import Foundation

extension Int {
    func hundredMillion() -> String {
        let result = Int(round(NSDecimalNumber(decimal: (Decimal(self) / pow(10, 8))).doubleValue))
        return result.unit(.hundredMillion)
    }
    
    func unit(_ type: UnitType) -> String {
        var key = ""
        switch type {
            case .hundredMillion:
                key = "Lotto.hundred_million"
            case .numberOfPeople:
                key = "Lotto.number_of_people"
        }
        return "\(self)" + NSLocalizedString(key, comment: "")
    }
}

enum UnitType {
    case hundredMillion
    case numberOfPeople
}
