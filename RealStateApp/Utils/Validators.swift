//
//  Validators.swift
//  RealStateApp
//
//  Created by Brandon Rojas on 2/12/23.
//

import SwiftUI

struct Validator {
    static func isValidEmail(_ email: String) -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
}
