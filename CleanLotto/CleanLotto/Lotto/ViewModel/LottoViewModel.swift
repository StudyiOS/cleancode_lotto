//
//  LottoViewModel.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import Foundation

class LottoViewModel {
    
    // MARK: - Properties
    
    private var lottoInfo: LottoInfo? {
        didSet {
            updateRoundInfo(lottoInfo)
        }
    }
    private(set) var currentRound: Int = 1097 {
        didSet {
            fetchLottoNumber()
        }
    }
    
    
    // MARK: - Input (VC -> VM)
    
    var textRoundEvent: Int = 0 {
        didSet {
            currentRound = textRoundEvent
        }
    }
    
    func changeRound(_ type: ChangeRoundType) {
        currentRound += type.value
    }
    
    
    // MARK: - Output (VM -> VC)
    
    var updateRoundInfo: (LottoInfo?) -> Void = { _ in }
    
    
    // MARK: - Method
    
    func fetchLottoNumber() {
        guard let url: URL = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(currentRound)") else {
            return
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session: URLSession = URLSession(configuration: .default)
        session.dataTask(with: request) { (data, response, error) in
            let successRange: Range = (200..<300)
            guard let data: Data = data, error == nil else { return }
            
            if let response: HTTPURLResponse = response as? HTTPURLResponse {
                if successRange.contains(response.statusCode) {
                    print(String(data: data, encoding: .utf8))
                    guard let lottoInfo: LottoInfo = try? JSONDecoder().decode(LottoInfo.self, from: data) else { return }
                    
                    self.lottoInfo = lottoInfo
                } else {
                    print("error")
                }
            }
        }.resume()
    }
}
