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
    }
    
    func getDatabaseValue() {
        self.ref.child("shouldRate").observeSingleEvent(of: .value, with: { (snapshot) in
            let shouldRate = snapshot.value as! Bool
            if shouldRate {
                self.shouldRate = true
            }
        }) { error in
            print(error.localizedDescription)
        }
    }
    
    func initListener() {
        ref.child("shouldRate").observe(.value, with: { (snapshot) in
            let shouldRate = snapshot.value as! Bool
            if shouldRate {
                self.shouldRate = true
            }
        }) { error in
            print(error.localizedDescription)
        }
    }
}
