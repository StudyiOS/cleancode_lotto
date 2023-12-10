//
//  Int+.swift
//  CleanLotto
//
//  Created by Leo on 12/10/23.
//

import Foundation

extension Int {
    func cutOffHundreadMillion() -> Int {
        let hundreadMillion = 100_000_000
        return self / hundreadMillion
    }
}
