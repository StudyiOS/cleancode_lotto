//
//  NetworkManager.swift
//  CleanLotto
//
//  Created by elly on 12/12/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let urlString = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="
    
    private init() { }
    
    func request(_ round: Int) async throws -> LottoInfo {
        guard let url: URL = URL(string: urlString + "\(round)") else { throw ErrorType.urlError }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session: URLSession = URLSession(configuration: .default)
        let (data, response) = try await session.data(for: request)
        
        let successRange = 200..<300
        guard let httpResponse = response as? HTTPURLResponse, successRange.contains(httpResponse.statusCode) else {
            throw ErrorType.noSuccessError
        }
        
        do {
            return try JSONDecoder().decode(LottoInfo.self, from: data)
        } catch {
            throw ErrorType.decoderError
        }
    }
}

enum ErrorType: Error {
    case urlError
    case emptyDataError
    case noSuccessError
    case decoderError
    case networkManagerError
    
    var description: String {
        switch self {
            case .urlError:
                return "url을 다시 확인해보세요."
            case .emptyDataError:
                return "response data가 값이 없습니다."
            case .noSuccessError:
                return "response error 입니다."
            case .decoderError:
                return "response decode 에러입니다."
            case .networkManagerError:
                return "networkManager 에러입니다."
        }
    }
}
