//
//  MoyaNetwork.swift
//  Maps
//
//  Created by Ronald Joubert on 5/30/21.
//

import Foundation
import Moya

public enum MoyaNetwork {
    
    case locations
    
}


extension MoyaNetwork: TargetType {
    public var method: Method {
        return .get
    }
    
    public var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/simonsickle/pfj-locations/master")!
    }
    
    public var path: String {
        switch self {
        case .locations: return "/locations.json"
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
