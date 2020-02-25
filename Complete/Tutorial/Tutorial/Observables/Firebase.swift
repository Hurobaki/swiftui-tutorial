//
//  Firebase.swift
//  Tutorial
//
//  Created by THE3796 on 21/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import Foundation
import Combine
import Firebase

class Firebase: ObservableObject {
    private let ref: DatabaseReference = Database.database().reference()
    
    @Published var shouldRate: Bool = false
    
    init() {
        initListener()
        UserDefaults.standard.removeObject(forKey: "rate")
    }
    
    func initListener() {
        ref.observe(.value, with: { (snapshot) in
            let values = snapshot.value as! NSDictionary
            let shouldRate = values["shouldRate"] as! Bool
            let force = values["force"] as! Bool
            
            if (shouldRate && !UserDefaults.standard.bool(forKey: "rate")) || force {
                self.shouldRate = true
                UserDefaults.standard.set(true, forKey: "rate")
            }
            
        }) { error in
            print(error.localizedDescription)
        }
    }
}
