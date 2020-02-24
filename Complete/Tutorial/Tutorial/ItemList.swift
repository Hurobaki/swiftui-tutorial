//
//  ItemList.swift
//  Tutorial
//
//  Created by THE3796 on 14/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct TrailingItemsImage {
    static let width: CGFloat = 24
    static let height: CGFloat = 24
}

struct ItemList: View {
    @EnvironmentObject var userData: UserData
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    CircleBadgeView(text: String(getAvailableItems()), thickness: 2)
                    Text("Tutorials available")
                }.frame(minWidth:0, maxWidth: .infinity)
                
                ForEach(userData.items) { landmark in
                    if !self.userData.showFavoriteOnly || landmark.isFavorite {
                        ZStack {
                            Image(landmark.imageName)
                                .resizable()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                                .overlay(ImageOverlay(text: landmark.title), alignment: .bottomTrailing)
                            
                            NavigationLink(destination: TutorialDetailView(landmark: landmark)) {
                                EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }.navigationBarTitle("Tutorials")
                .navigationBarItems(trailing: trailingItems())
        }
    }
    
    func getAvailableItems () -> Int {
        !userData.showFavoriteOnly ? userData.items.count : userData.items.reduce(0) {
            $0 + ( $1.isFavorite ? 1 : 0)
        }
    }
    
    func trailingItems () -> some View {
        return HStack {
            
            if userData.showProfile {
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.circle").resizable().frame(width: TrailingItemsImage.width, height: TrailingItemsImage.height).accessibility(label: Text("Profile"))
                }
            }
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear").resizable().frame(width: TrailingItemsImage.width, height: TrailingItemsImage.height).accessibility(label: Text("Profile"))
            }
        }
    }
}

struct ImageOverlay : View {
    var text: String
    var color: Color? = .white
    
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(color)
            .background(Color.black)
            .opacity(0.6)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 5))
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList().environmentObject(UserData())
    }
}


