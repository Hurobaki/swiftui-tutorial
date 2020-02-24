//
//  ContentView.swift
//  Tutorial
//
//  Created by THE3796 on 21/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var firebase: Firebase
    
    var body: some View {
        VStack {
            ItemList()
        }.addFirebaseListener(show: $firebase.shouldRate) { self.firebase.shouldRate.toggle() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Firebase())
    }
}
