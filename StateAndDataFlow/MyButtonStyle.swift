//
//  MyButtonStyle.swift
//  StateAndDataFlow
//
//  Created by Andrew Tolstov on 7/28/20.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    
    var backColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            
           .frame(width: 200, height: 60)
            .background(backColor)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
            )
    }
}
