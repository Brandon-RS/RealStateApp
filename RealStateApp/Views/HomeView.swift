//
//  HomeView.swift
//  RealStateApp
//
//  Created by Brandon Rojas on 30/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        var size = UIScreen.main.bounds.width
        
        VStack{
            VStack{
                RoundedRectangle(cornerRadius: 200)
                    .overlay(){
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 80, height: 80)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                
                Text("Sign in to you account")
                    .font(.system(size: 25))
                    .bold()
                    .padding(.bottom, 20)
                
                SignInButton(
                    text: "Google",
                    marginBottom: 8,
                    onPressed: {
                        print("Using google")
                    }
                )
                
                SignInButton(
                    text: "Apple",
                    marginBottom: 30,
                    onPressed: {
                        print("Using Apple")
                    }
                )
                
                HStack {
                    LineShape()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: size * 0.18, height: 1)
                    
                    Spacer().frame(width: 20)
                    
                    Text("Or continue with")
                        .foregroundColor(Color.gray)
                    
                    Spacer().frame(width: 20)
                    
                    LineShape()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: size * 0.18, height: 1)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(.horizontal, 25)
        }
        .frame(maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("cPink"), Color("cLightPink")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}

#Preview {
    HomeView()
}
