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
