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
    @State var red: Double = 242
    @State var green: Double = 242
    @State var blue: Double = 242
    @State var opacity: Double = 1
    
    
    let circleHeight: CGFloat = 144
    
    var body: some View {
        VStack {
            VStack {
                Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: opacity)
            }.fillParent().frame(height: 200)
            
            Image("swiftUI").resizable().clipShape(Circle()).overlay(Circle().stroke(Color.orange, lineWidth: 2)).shadow(radius: 10).frame(width: 144, height: circleHeight).offset(y: -(circleHeight / 2)).padding(.bottom, -circleHeight / 2)
            
            Text("Swift UI").font(.title)
            Text("Super cool framework").font(.caption).foregroundColor(.gray)
            
            SliderView(value: $red, range: 0...255 ,color: .red).padding()
            SliderView(value: $green, range: 0...255 ,color: .green).padding()
            SliderView(value: $blue, range: 0...255 ,color: .blue).padding()
            SliderView(value: $opacity, range: 0...1, color: .gray, step: 0.1).padding()
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView().environmentObject(UserData())
        }
    }
}

extension View {
    func fillParent() -> some View {
        return GeometryReader { geometry in
            self.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
