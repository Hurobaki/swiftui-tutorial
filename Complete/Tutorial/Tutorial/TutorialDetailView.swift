//
//  TutorialDetailView.swift
//  Tutorial
//
//  Created by THE3796 on 14/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct TutorialDetailView: View {
    
    var landmark: Landmark
    @EnvironmentObject var userData: UserData
    
    var landmarkIndex: Int {
        userData.items.firstIndex(where: {
            $0.id == landmark.id
        })!
    }
    
    var body: some View {
        VStack {
            Image(landmark.imageName).resizable().frame(height: 300)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.title).font(.title)
                    Button(action: { self.userData.items[self.landmarkIndex].isFavorite.toggle() }) {
                        if (self.userData.items[self.landmarkIndex].isFavorite) {
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star").foregroundColor(.gray)
                        }
                    }
                }
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                
                Text(landmark.description).padding(.top).font(.body)
            }.padding()
            Spacer()
        }.navigationBarTitle(Text(landmark.title), displayMode: .inline)
    }
}

struct TutorialDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialDetailView(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
