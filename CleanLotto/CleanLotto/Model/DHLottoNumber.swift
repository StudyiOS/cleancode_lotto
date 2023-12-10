//
//  DHLottoNumber.swift
//  CleanLotto
//
//  Created by Leo on 12/10/23.
//

import Foundation

/*
{
    "totSellamnt":260856392000,
    "returnValue":"success",
    "drwNoDate":"2003-02-08",
    "firstWinamnt":6430437900,
    "drwtNo6":44,
    "drwtNo4":33,
    "firstPrzwnerCo":13,
    "drwtNo5":41,
    "bnusNo":6,
    "firstAccumamnt":0,
    "drwNo":10,
    "drwtNo2":25,
    "drwtNo3":30,
    "drwtNo1":9
}
*/

struct DHLottoNumber: Decodable {
    let drwNo: Int // round
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6: Int // numbers
    let bnusNo: Int // bonusNumber
    let firstWinamnt: Int
    let drwNoDate: String // date
    let returnValue: String
    let firstPrzwnerCo: Int
    let firstAccumamnt: Int
    let totSellamnt: Int // Total Amount
}
