//
//  Int+.swift
//  CleanLotto
//
//  Created by elly on 12/11/23.
//

import Foundation

extension Int {
    func hundredMillion() -> String {
        let 반올림 = NSDecimalNumber(decimal: (Decimal(self) / pow(10, 8))).doubleValue
        let result = Int(round(반올림))
        return "\(result)억"
    }
}
