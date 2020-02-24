//
//  SettingsView.swift
//  Tutorial
//
//  Created by THE3796 on 14/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Form {
            Section(header: Text("General")) {
                Toggle(isOn: $userData.showProfile) {
                    Text("Show profile")
                }
                Toggle(isOn: $userData.showFavoriteOnly) {
                    Text("Show favorites only")
                }
            }
            
            Section(header: Text("UI")) {
                Toggle(isOn: $userData.isDark) {
                    Text("Dark mode")
                }
                
                NavigationLink(destination: Text("third")) {
                    Text("Third navigation")
                }
            }
            
        }.navigationBarTitle(Text("Settings"), displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            SettingsView().environmentObject(UserData())
        }
    }
}
