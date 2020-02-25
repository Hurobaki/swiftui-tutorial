//
//  View.swift
//  Tutorial
//
//  Created by THE3796 on 22/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import Foundation
import SwiftUI
import ModalDisplayer


extension View {
    func addFirebaseListener(show: Binding<Bool>, completionHandler: @escaping () -> Void) -> some View {
        return self.sheet(isPresented: show) {
            ModalView(image: Image("fallout")) { stars in
                Network.shared.post(url: "https://us-central1-firelabs-dummy.cloudfunctions.net/app/rating", parameters: ["stars": stars])
                completionHandler()
            }
        }
    }
}
