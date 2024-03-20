//
//  RegisterHeader.swift
//  PomoNotes
//
//  Created by Jakob on 18.03.24.
//

import SwiftUI

struct RegisterHeader: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.orange)
                .rotationEffect(Angle(degrees: 15))
                
            VStack {
                Text("Register")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text("Create your own Account!")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
            }
            .padding(.top, 40)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -100)
    }
}

#Preview {
    RegisterHeader()
}
