//
//  Network.swift
//  Maps
//
//  Created by Ronald Joubert on 5/29/21.
//

import SwiftUI

struct Network {
    @Binding var text: String
    
    func getLocations(completion: @escaping ([Location]) -> ()) {
        guard let url = URL(string: text) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let locations = try JSONDecoder().decode([Location].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(locations)
                }
            } catch {
                print("ErrorDecoding: \(error.localizedDescription)")
            }
        }.resume()
    }
}

