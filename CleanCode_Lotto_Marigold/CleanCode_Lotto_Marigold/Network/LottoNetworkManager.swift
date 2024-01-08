//
//  LottoNetworkManager.swift
//  CleanCode_Lotto_Marigold
//
//  Created by 황홍필 on 2023/12/11.
//

import Foundation
import RxSwift

enum LottoError: Error {
    case failToMakeURL
    case invalidJSON
    case networkError
    case wrongResponse
    case invalidData
}


final class LottoNetworkManager {
    private let session: URLSession
    private let api = LottoNetworkAPIs()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getLottoData(round: String) -> Observable<LottoModel> {
        
        guard let url = api.getLottoNumbers(round: round).url else {
            print("url을 만드는데에 실패했습니다", LottoError.failToMakeURL)
            return Observable.empty()
        }
        
        return Observable.create({ [weak self] observer -> Disposable in
            
            self?.session.dataTask(with: url) { data, response, error in
                
                // error가 nil이라는 것이 false라면, error가 있다는 의미이다.
                // 그러므로 에러가 발생할 경우 에러처리를 한다.
                guard error == nil else {
                    print("에러 뭐냐")
                    observer.onError(LottoError.networkError)
                    print("네트워크 에러")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                    observer.onError(LottoError.wrongResponse)
                    print("응답 에러")
                    return
                }
                
                // guard let data = data else
                // guard let data else 같은 뜻임 ⭐️⭐️
                guard let data else {
                    observer.onError(LottoError.invalidData)
                    print("데이터 에러")
                    return
                }
                
                do {
                    let json = try JSONDecoder().decode(LottoModel.self, from: data)
                    observer.onNext(json)
                } catch {
                    print("JSON 에러")
                    observer.onError(LottoError.invalidJSON)
                }
            }.resume()
            
            return Disposables.create()
        })
    }
}
