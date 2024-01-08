//
//  LottoAPIService.swift
//  CleanLotto
//
//  Created by 정준영 on 12/10/23.
//

import Foundation
import Moya
import RxSwift
import RxMoya


final class NetworkManager<Provider: TargetType>: MoyaProvider<Provider> {
    
    func request<Model: Decodable>(_ target: Provider, instance: Model.Type, completion: @escaping (Result<Model, MoyaError>) -> Void) {
        MoyaProvider<Provider>().request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let model = try JSONDecoder().decode(Model.self, from: response.data)
                    completion(.success(model))
                } catch {
                    completion(.failure(.jsonMapping(response)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
            

}
