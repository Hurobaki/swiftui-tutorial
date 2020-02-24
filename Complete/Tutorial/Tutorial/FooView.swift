//
//  FooView.swift
//  Tutorial
//
//  Created by THE3796 on 19/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct FooView: View {
    var body: some View {
        VStack {
            // 1.
            GeometryReader { geometry in
                VStack {
                    // 2.
                    Text("One")
                        .frame(width: geometry.size.width, height: geometry.size.height/2)
                        .background(Color.red)
                       
                    HStack {
                        // 3.
                        Text("Two")
                            .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                            .background(Color.blue)
                        Text("Three")
                            .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                            .background(Color.yellow)
                    }
                }
            }
        }
    }
}

struct FooView_Previews: PreviewProvider {
    static var previews: some View {
        FooView()
    }
}
