//
//  Network.swift
//  Tutorial
//
//  Created by THE3796 on 21/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import Foundation

class Network {
    static let shared: Network = Network()
    
    init() { }
    
    func post(url: String, parameters: [String: Any]) {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {
                print("error", error ?? "Unknown error")
                return
            }
            
            guard (200...209) ~= response.statusCode else {
                print("Status code outside bounds \(response.statusCode)")
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
            
            print("Response String \(String(describing: responseString))")
            
        }
        task.resume()
    }
}
