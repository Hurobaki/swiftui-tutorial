//
//  BackButtonView.swift
//  Tutorial
//
//  Created by THE3796 on 15/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct BackButtonView: View {
    let label: String
    let closure: () -> ()
    
    var body: some View {
        Button(action: { self.closure() }) {
            HStack {
                Image(systemName: "chevron.left")
                Text(label)
            }
        }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(label: "Back") {
            
        }
    }
}
