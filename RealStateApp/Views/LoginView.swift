//
//  LoginView.swift
//  RealStateApp
//
//  Created by Brandon Rojas on 2/12/23.
//

import SwiftUI


struct LoginView: View {
    
    @State private var email = ""
    @State private var isEmailValid = true
    
    @State private var password = ""
    @State private var isPasswordValid = true
    
    var body: some View {
        let size = UIScreen.main.bounds.width
        
        NavigationView {
            VStack{
                Spacer()
                
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
                    
                    // TextField("Email address", text: $email, onEditingChanged: { isEditing in
                    //     if !isEditing {
                    //         isEmailValid = Validator.isValidEmail(email)
                    //     }
                    // })
                    
                    TextField("Email address", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onChange(of: email, { old, new in
                            if (email.isEmpty) {
                                isEmailValid = true
                            } else {
                                isEmailValid = Validator.isValidEmail(email)
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(isEmailValid ? Color.gray : Color.red))
                    
                    TextField("Password", text: $password)
                        .padding()
                        .onChange(of: password, { old, new in
                            if (password.isEmpty) {
                                isPasswordValid = true
                            } else {
                                isPasswordValid = password.count >= 6
                            }
                        })
                        .background(RoundedRectangle(cornerRadius: 10).stroke(isPasswordValid ? Color.gray : Color.red))
                    
                    Button(action: {
                        print("Text Clicked!")
                    }) {
                        Text("Forgot password?")
                            .foregroundColor(Color.black)
                            .underline()
                    }
                    .padding()
                    
                    NavigationLink(destination: HomeView()) {
                        Text("Continue")
                            .padding()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(12)
                            .padding(.bottom, 20)
                    }
                    .isDetailLink(false)
                }
                .padding(.horizontal, 20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.horizontal, 25)
                
                Spacer()
                
                HStack {
                    Text("Not a member?")
                        .foregroundColor(Color.black)
                    
                    Button(action: {
                    }) {
                        Text("Create an account")
                            .foregroundColor(Color.black)
                            .bold()
                            .underline()
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("cPink"), Color("cLightPink")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        }.navigationTitle("Login View")
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    LoginView()
}
