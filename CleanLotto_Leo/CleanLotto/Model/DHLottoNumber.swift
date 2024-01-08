//
//  DHLottoNumber.swift
//  CleanLotto
//
//  Created by Leo on 12/10/23.
//

import Foundation

struct DHLottoNumber: Decodable {
    let drwNo: Int // Winning Round
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6: Int // Winning Numbers
    let bnusNo: Int // Bonus Number
    let firstWinamnt: Int
    let drwNoDate: String
    let returnValue: String
    let firstPrzwnerCo: Int
    let firstAccumamnt: Int
    let totSellamnt: Int // Total Amount
}
