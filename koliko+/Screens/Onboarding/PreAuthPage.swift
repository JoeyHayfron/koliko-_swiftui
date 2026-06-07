//
//  PreAuthPage.swift
//  koliko+
//
//  Created by Joseph Acquah on 31/05/2026.
//

import SwiftUI

struct PreAuthPage: View {
    var onBrowse: () -> Void
    var onSignIn: () -> Void
    
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
                
                
                VStack {
                    Image("youre-in-check")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("You're in.")
                        .font(.poppins(.bold, size: 30))
                    Text("Browse the library as a guest, or sign in to save and download.")
                        .font(.poppins(.regular, size: 16))
                        .multilineTextAlignment(.center)
                    
                    
                    Button(action: onBrowse){
                        HStack {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                            Text("Start browsing")
                                .foregroundColor(.white)
                                .font(.poppins(.bold, size: 16))
                                .padding(.horizontal, 8)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                            
                        }.padding()
                    }.background(Color(red: 30/255, green: 154/255, blue: 255/255))
                        .cornerRadius(10)
                    
                    Button(action: onSignIn) {
                        Text("Sign in")
                            .font(.poppins(.regular))
                            .padding(.top)
                    }
                    
                }.padding(.top, 180)
                
                Spacer()
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
        }
        .frame(maxHeight:.infinity)
    }
}


#Preview {
    PreAuthPage(onBrowse: {}, onSignIn: {})
}
