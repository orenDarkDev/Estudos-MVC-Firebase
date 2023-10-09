//
//  UserModel.swift
//  ArquiteturaFirebase-MVC
//  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
//  Created by Oren Pelosof on 07/09/23.
//

import Foundation

struct UserModel: Codable {
    let email: String
    let password: String
    
    init() {
        self.email = String()
        self.password = String()
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

