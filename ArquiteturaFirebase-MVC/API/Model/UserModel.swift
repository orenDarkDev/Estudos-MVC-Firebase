//
//  UserModel.swift
//  ArquiteturaFirebase-MVC
//
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

