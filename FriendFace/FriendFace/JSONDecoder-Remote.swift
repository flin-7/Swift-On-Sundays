//
//  JSONDecoder-Remote.swift
//  Friendface
//
//  Created by Felix Lin on 1/18/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    func decode<T: Decodable>(_ type: T.Type, fromURL url: String, completion: @escaping (T) -> Void) {
        guard let url = URL(string: url) else {
            fatalError("Invalid URL passed.")
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let downloadedData = try self.decode(type, from: data)
                
                DispatchQueue.main.async {
                    completion(downloadedData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
