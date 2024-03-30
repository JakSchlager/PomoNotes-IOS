//
//  TLButton.swift
//  PomoNotes
//
//  Created by Jakob on 18.03.24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(backgroundColor)
                        .frame(width: 100)
                    
                    
                    Text(title)
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .frame(alignment: .center)
            .padding(.all, 10)
        }
        .frame(width: 500,alignment: .center)
    }
}

#Preview {
    TLButton(title: "Value", backgroundColor: .blue){
        // Action
    }
}
