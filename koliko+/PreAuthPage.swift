//
//  PreAuthPage.swift
//  koliko+
//
//  Created by Joseph Acquah on 31/05/2026.
//

import SwiftUI

struct PreAuthPage: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                Image("koliko-waves")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 320)
            }.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing:0) {
                HStack {
                    Text("Koliko")
                        .font(.poppins(.bold, size: 25))
                    
                    Text("+")
                        .font(.poppins(.bold, size: 25))
                        .foregroundColor(.blue)
                        .padding(.leading, -9)
                }
                .padding(.leading, 30)
                
                
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxHeight:.infinity)
    }
}


#Preview {
    PreAuthPage()
}
