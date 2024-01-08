//
//  LottoNetworkAPIs.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import Foundation

struct LottoNetworkAPIs {
    
    private let scheme = "https"
    private let host = "www.dhlottery.co.kr"
    private let path = "/common.do"
    
    // 주소 검색하기
    func getLottoNumbers(round: String) -> URLComponents {
        return buildURLComponents(query: round)
    }
    
    // 주소 만들기
    private func buildURLComponents(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [
            URLQueryItem(name: "method", value: "getLottoNumber"),
            URLQueryItem(name: "drwNo", value: query)
        ]
        return components
    }
}
