//
//  HomeView.swift
//  RealStateApp
//
//  Created by Brandon Rojas on 30/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var email = ""
    @State private var isEmailValid: Bool = true

    @State private var password = ""
    
    var body: some View {
        let size = UIScreen.main.bounds.width
        
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
                    marginBottom: 12,
                    onPressed: {
                        print("Using Apple")
                    }
                )
                
                HStack {
                    LineShape()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: size * 0.18, height: 1)
                    
                    Spacer()
                    
                    Text("Or continue with")
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    LineShape()
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: size * 0.18, height: 1)
                }
                
//                TextField("Email address", text: $email, onEditingChanged: { isEditing in
//                    if !isEditing {
//                        isEmailValid = Validator.isValidEmail(email)
//                    }
//                })
                TextField("Email address", text: $email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: email, { new, old in
                        isEmailValid = Validator.isValidEmail(email)
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(isEmailValid ? Color.gray : Color.red))
                
                TextField("Password", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                
                Button(action: {
                    print("Text Clicked!")
                }) {
                    Text("Forgot password?")
                        .foregroundColor(Color.black)
                        .underline()
                }
                .padding()
                
                Button(action: {}) {
                    Text("Continue").foregroundColor(Color.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(12)
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
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

struct Validator {
    static func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
}
