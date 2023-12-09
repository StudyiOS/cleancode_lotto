//
//  LottoInfo.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import Foundation

struct LottoInfo: Decodable {
    let returnValue: String     // 요청결과
    let drwNoDate: String       // 날짜
    let totSellamnt: Int        // 총상금액
    let firstWinamnt: Int       // 1등 상금액
    let firstPrzwnerCo: Int     // 1등 당첨인원
    let firstAccumamnt: Int     // 1등 누적
    let drwtNo1: Int            // 로또번호 1
    let drwtNo2: Int            // 로또번호 2
    let drwtNo3: Int            // 로또번호 3
    let drwtNo4: Int            // 로또번호 4
    let drwtNo5: Int            // 로또번호 5
    let drwtNo6: Int            // 로또번호 6
    let bnusNo: Int             // 로또 보너스 번호
    let drwNo: Int              // 로또회차
}
