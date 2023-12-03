//
//  SignInButton.swift
//  RealStateApp
//
//  Created by Brandon Rojas on 2/12/23.
//

import SwiftUI

struct SignInButton: View {
    
    let text: String
    let marginBottom: Double
    let onPressed: () -> Void
    
    var body: some View {
        Button(action: onPressed) {
            HStack{
                Image(systemName: "person").foregroundColor(Color.black)
                Text("Sign in with \(text)").foregroundColor(Color.black)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .padding(.bottom, marginBottom)
        }
    }
}

#Preview {
    SignInButton(
        text: "Name",
        marginBottom: 12
    ) { }
}
