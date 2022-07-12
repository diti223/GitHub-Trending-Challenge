//
//  ActionButton.swift
//  Trend
//
//  Created by Adrian Bilescu on 30.06.2022.
//

import SwiftUI

struct ActionButton: View {
    let text: String
    let action: (() -> Void)
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(text)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal)
                .frame(minWidth: 240)
                .frame(maxHeight: 40)
                .background(background)
                .contentShape(Rectangle())
            
        })
        .buttonStyle(.plain)
    }
    
    private var background: some View {
        Capsule()
            .foregroundColor(.button)
    }
}

private extension Color {
    static let button = Color(red: 252/255.0, green: 100/255.0, blue: 75/255.0)
}
