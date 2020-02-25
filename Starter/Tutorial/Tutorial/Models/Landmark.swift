//
//  Landmark.swift
//  Tutorial
//
//  Created by THE3796 on 14/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import Foundation


struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var imageName: String
    var title: String
    var isFavorite: Bool
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id, imageName, title, description
    }

    
    init(id: Int, imageName: String, title: String, isFavorite: Bool, description: String) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.isFavorite = isFavorite
        self.description = description
    }
    
    init(from decoder: Decoder) throws {
        do {
            let decoder = try decoder.container(keyedBy: CodingKeys.self)
            let id: Int = try decoder.decode(Int.self, forKey: .id)
            let imageName: String = try decoder.decode(String.self, forKey: .imageName)
            let title: String = try decoder.decode(String.self, forKey: .title)
            let description: String = try decoder.decode(String.self, forKey: .description)
            let isFavorite: Bool = false
            
            self.init(id: id, imageName: imageName, title: title, isFavorite: isFavorite, description: description)
        } catch {
            fatalError("Error during init from Decoder \(error)")
        }
        
    }
}
