//
//  MetworkManager.swift
//  Maps
//
//  Created by Ronald Joubert on 5/30/21.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    
    func fetchLocations(completion: @escaping (Result<Location, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    public init () {
        
    }
    
    func fetchLocations(completion: @escaping (Result<Location, Error>) -> ()) {
        request(target: .baseLocation, completion: completion)
    }
    
    
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> provider.request(target) { result in
    switch result {
    case let .success(response):
    do {
    let results = try JSONDecoder().decode(T.self, from: response.data)
    completion(.success(results))
    } catch {
    completion(.failure(error))
    }
    case let .failure(error):
    completion(.failure(error))
    }
    }
}
