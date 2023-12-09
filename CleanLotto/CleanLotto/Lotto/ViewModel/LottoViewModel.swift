//
//  LottoViewModel.swift
//  CleanLotto
//
//  Created by elly on 12/9/23.
//

import Foundation

class LottoViewModel {
    private var lottoInfo: LottoInfo?
    private(set) var currentRound: Int = 1096
    
    // Input (VC -> VM)
    var prevRoundTapEvent: Bool = false {
        didSet {
            currentRound -= 1
            fetchLottoNumber()
        }
    }
    var nextRoundTapEvent: Bool = false {
        didSet {
            currentRound += 1
            fetchLottoNumber()
        }
    }
    var textRoundEvent: Int = 0 {
        didSet {
            currentRound = textRoundEvent
            fetchLottoNumber()
        }
    }
    
    // Output (VM -> VC)
    var updateRoundInfo: (LottoInfo) -> Void = { _ in }
    
    
    // method
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
                    guard let lottoInfo: LottoInfo = try? JSONDecoder().decode(LottoInfo.self, from: data) else { return }
                    self.lottoInfo = lottoInfo
                    self.updateRoundInfo(lottoInfo)
                } else {
                    print("error")
                }
            }
        }.resume()
    }
}
