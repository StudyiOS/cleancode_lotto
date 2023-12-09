//
//  LottoAPIService.swift
//  CleanLotto
//
//  Created by 정준영 on 12/10/23.
//

import Foundation
import Moya
import RxSwift


final class NetworkManager<Provider: TargetType>: MoyaProvider<Provider> {
    
    func request<Model: Decodable>(_ target: Provider, instance: Model.Type) -> Single<Model> {
        return Single.create { [weak self] single in
            let cancellableToken = self?.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let model = try JSONDecoder().decode(Model.self, from: response.data)
                        single(.success(model))
                    } catch {
                        single(.failure(error))
                    }
                case .failure(let error):
                    single(.failure(error))
                }
            }
            return Disposables.create {
                cancellableToken?.cancel()
            }
        }
    }

}
