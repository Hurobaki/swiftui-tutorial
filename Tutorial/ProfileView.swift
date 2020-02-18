//
//  ProfileView.swift
//  Tutorial
//
//  Created by THE3796 on 17/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(UserData())
    }
}
