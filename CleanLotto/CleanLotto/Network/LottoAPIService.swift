//
//  LottoAPIService.swift
//  CleanLotto
//
//  Created by 정준영 on 12/10/23.
//

import Foundation
import Moya

enum LottoAPIService {
    case getLottoWinInfo(round: Int)
}

extension LottoAPIService: TargetType {
    var baseURL: URL {
        return URL(string: "http://www.dhlottery.co.kr")!
    }
    
    var path: String {
        switch self {
        case .getLottoWinInfo:
            return "/common.do"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLottoWinInfo:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getLottoWinInfo:
            return """
            {
                "totSellamnt": 71627567000,
                "returnValue": "success",
                "drwNoDate": "2016-09-24",
                "firstWinamnt": 2273767360,
                "drwtNo6": 44,
                "drwtNo4": 41,
                "firstPrzwnerCo": 8,
                "drwtNo5": 43,
                "bnusNo": 31,
                "firstAccumamnt": 18190138880,
                "drwNo": 721,
                "drwtNo2": 28,
                "drwtNo3": 35,
                "drwtNo1": 1
            }
            """.data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getLottoWinInfo:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var parameters: [String: Any] {
        switch self {
        case .getLottoWinInfo(let round):
            return ["method": "getLottoNumber", "drwNo": "\(round)"]
        }
    }
}
