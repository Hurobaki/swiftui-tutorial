//
//  CircleBadgeView.swift
//  Tutorial
//
//  Created by THE3796 on 14/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct CircleBadgeView: View {
    
    var text: String = ""
    var thickness: CGFloat = 5
    
    var body: some View {
        ZStack {
            Circle().stroke(style: StrokeStyle(lineWidth: thickness)).frame(width: 40, height: 40)
            Text(text)
        }
    }
}

struct CircleBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        CircleBadgeView(text: "1")
    }
}
