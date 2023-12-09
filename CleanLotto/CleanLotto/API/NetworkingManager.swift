//
//  NetworkingManager.swift
//  CleanLotto
//
//  Created by Sam Sung on 12/9/23.
//

import Combine
import Foundation

//https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1096

struct NetworkManager {
    
    private init() { }
    
    static let shared = NetworkManager()
    
    private var url: URL = URL(string: "https://www.dhlottery.co.kr/common.do")!

    
    private func queryItems(_ gameNumber: Int) -> [URLQueryItem] {
        [
            URLQueryItem(name: "method", value: "getLottoNumber"),
            URLQueryItem(name: "drwNo", value: "\(gameNumber)")
        ]
    }
    
    // MARK: - Request
    
    func searchLottoWith(gameNumber: Int) -> AnyPublisher<Lotto?, Never> {
        return URLSession.shared.dataTaskPublisher(for: request(gameNumber))
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: Lotto.self, decoder: JSONDecoder())
            .compactMap { $0 }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
    private func request(_ gameNumber: Int) -> URLRequest {
        let urlWithQuery = url.appending(queryItems: queryItems(gameNumber))
        return URLRequest(url: urlWithQuery)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
            (200..<300) ~= response.statusCode else {
            print("네트워트 에러 \(output.response)")
                throw URLError(.badServerResponse)
            }
        
        return output.data
    }
}

