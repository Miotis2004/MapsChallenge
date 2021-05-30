//
//  API.swift
//  Maps
//
//  Created by Ronald Joubert on 5/30/21.
//

import Foundation
import Moya

enum API {
    case baseLocation
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://raw.githubusercontent.com/simonsickle/pfj-locations/master") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .baseLocation:
            return "/locations.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .baseLocation:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
