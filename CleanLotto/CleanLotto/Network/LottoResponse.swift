//
//  LottoResponse.swift
//  CleanLotto
//
//  Created by 정준영 on 12/10/23.
//

import Foundation

struct LottoResponse: Decodable {
    
    let drwNo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    let drwNoDate: String
    let firstAccumamnt: Int
    let firstPrzwnerCo: Int
    let firstWinamnt: Int
    let returnValue: String
    let totSellamnt: Int
}

extension LottoResponse {
    var drwtNumbers: [Int] {
        return [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo]
    }
}
