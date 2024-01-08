//
//  LottoManager.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/10/23.
//

import Foundation

struct LottoManager {
    
    private init() { }
    
    static let shared = LottoManager()
    
    public var drawNumberList: [Int] {
        return Array(1...lastDrawNumber).reversed()
    }
    
    public var lastDrawNumber: Int {
        calculateLottoDraws()
    }
    
    private func calculateLottoDraws() -> Int {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        guard let startDate = dateFormatter.date(from: "2002/12/7") else {
            return 0
        }
        
        // 시작 날짜와 오늘 날짜 사이의 전체 일수를 계산하고 이를 7로 나눠줍니다.
        let numberOfDays = calendar.dateComponents([.day], from: startDate, to: Date()).day ?? 0
        let weekOfYear = numberOfDays / 7

        // 현재 날짜와 시간을 한국 시간으로 가져옵니다.
        let koreaTimeZone = TimeZone(identifier: "Asia/Seoul")!
        let currentDate = Date()
        let koreaDateComponents = calendar.dateComponents(in: koreaTimeZone, from: currentDate)
        let weekday = koreaDateComponents.weekday!
        let hour = koreaDateComponents.hour!
        let saturday = 1 // 1: Saturday, 2: Sunday, ..., 7: Monday
        let monday = 7

        // 현재 날짜가 토요일이고, 시간이 오후 10시 이후이거나, 현재 날짜가 토요일 이후인 경우 +1
        if (weekday == saturday && hour >= 22) || weekday > saturday {
            return weekOfYear + 1
        } else {
            return weekOfYear
        }
    }
}
