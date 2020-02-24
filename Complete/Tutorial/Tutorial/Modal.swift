//
//  Modal.swift
//  Tutorial
//
//  Created by THE3796 on 20/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct Modal: View {
    @State var rating: Int = 0
    
    var body: some View {
        VStack {
            VStack {
                Color.red
            }.fillParent().frame(maxHeight: 300)
            
            VStack {
                Text("Avez-vous apprécié cet atelier ?").font(.title).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center).padding()
                
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Button(action: { self.rating = index }) {
                            if index > self.rating {
                                Image(systemName: "star").foregroundColor(.gray)
                            } else {
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                            }
                            
                        }
                    }
                }.padding()
                
                Button(action: { }) {
                    Text("Send answer 😀")
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                    )
                }.padding()
                
            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 1))
            )
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        
    }
    
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal()
    }
}
