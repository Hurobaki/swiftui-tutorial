//
//  SliderView.swift
//  Tutorial
//
//  Created by THE3796 on 18/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    var range: ClosedRange<Double>
    var color: Color
    var step: Double = 1
    
    var body: some View {
        HStack {
            Text(String(format: "%d", Int(range.lowerBound))).foregroundColor(color)
            Slider(value: $value, in: range, step: step).accentColor(color)
            Text(String(format: "%d", Int(range.upperBound))).foregroundColor(color)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(3), range: 0...255, color: .purple)
    }
}
