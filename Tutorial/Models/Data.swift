//
//  Data.swift
//  Tutorial
//
//  Created by THE3796 on 14/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import Foundation


let landmarkData: [Landmark] = load("data.json")

func load<T: Decodable> (_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Cannot load given file name")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Cannot read data")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Cannot decode json object \(error)")
    }
}
