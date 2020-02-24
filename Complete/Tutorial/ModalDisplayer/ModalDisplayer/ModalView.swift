//
//  ModalFoo.swift
//  Tutorial
//
//  Created by THE3796 on 20/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

public struct ModalView: View {
    @State var rating: Int = 0
    @State var clicked: Bool = false
    var image: Image
    var closure: (Int) -> Void
    
    public init(image: Image, closure: @escaping (Int) -> Void) {
        self.image = image
        self.closure = closure
    }
    
    public var body: some View {
        VStack {
            image.resizable().frame(maxHeight: 300)
            
            VStack {
                Text("Did you enjoy the workshop ?")
                    .font(.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                
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
                
                Button(action: {
                    withAnimation {
                        self.clicked.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.closure(self.rating)
                        }
                    }
                }) {
                    Text(clicked ? "Thank you 👍" : "Send answer 😀")
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(clicked ? Color.gray : Color.blue, style: StrokeStyle(lineWidth: 2))
                    )
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(clicked ? Color.gray : Color.white).opacity(0.5))
                .rotation3DEffect(Angle(degrees: clicked ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                .disabled(clicked)
                .padding()
                
            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width - 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 1))
            )
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        
    }
}
