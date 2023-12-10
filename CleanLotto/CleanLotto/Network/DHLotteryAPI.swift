//
//  DHLotteryAPI.swift
//  CleanLotto
//
//  Created by Leo on 12/9/23.
//

import Foundation
import Combine

// BASE = "http://www.dhlottery.co.kr/common.do?
// METHOD = getLottoNumber
// PARAM = &drwNo=\(num)"

enum DHLotteryAPI {
    static let BASE = "http://www.dhlottery.co.kr/common.do?"
    static let METHOD_GET_LOTTO_NUMBER = "method=getLottoNumber"
    static let GET_LOTTO_PARAM = "drwNo="
    
    static let FETCH_LOTTO_ADDR = BASE + METHOD_GET_LOTTO_NUMBER + "&" + GET_LOTTO_PARAM

    static func fetchLotto(with round: Int) -> AnyPublisher<WinningLotto?, Never> {
        guard let url = URL(string: FETCH_LOTTO_ADDR + "\(round)") else {
            return Just(nil).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: DHLottoNumber.self, decoder: JSONDecoder())
            .map { WinningLotto(from: $0) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }

//
//    static func fetchLotto(with round: Int) -> AnyPublisher<WinningLotto?, DHLotteryError> {
//        guard let url = URL(string: FETCH_LOTTO_ADDR + "\(round)") else {
//            return Fail(outputType: WinningLotto?.self,
//                        failure: DHLotteryError.invalidUrl)
//            .eraseToAnyPublisher()
//        }
//
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map(\.data)
//            .decode(type: DHLottoNumber.self, decoder: JSONDecoder())
//            .map { WinningLotto(from: $0) }
//            .mapError{ error -> DHLotteryError in
//                switch error {
//                case is URLError:
//                    return .networkError
//                case is DecodingError:
//                    return .decodingError
//                default:
//                    return .unknownError(error)
//                }
//            }
//            .eraseToAnyPublisher()
//
//    }
}


extension DHLotteryAPI {
    enum DHLotteryError: Error {
        case networkError
        case invalidUrl
        case decodingError
        case unknownError(Error)
    }
}
