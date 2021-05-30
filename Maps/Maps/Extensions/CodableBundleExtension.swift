//
//  CodableBundleExtension.swift
//  Maps
//
//  Created by Ronald Joubert on 5/29/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ url: String, completion: @escaping ([T]) -> ()) {
        guard let url = URL(string: url) else {
            print("Failed to parse URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let data = try JSONDecoder().decode([T].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(data)
                }
            } catch {
                return
            }
        }.resume()
    }
}
