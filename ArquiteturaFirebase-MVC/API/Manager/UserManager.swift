//
//  UserManager.swift
//  ArquiteturaFirebase-MVC
//
//  Created by Oren Pelosof on 07/09/23.
//

import Foundation

protocol UserManagerProtocol {
    func register(email: String, password: String,
                  sucessHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error) -> Void)
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void)
}

class UserManager: UserManagerProtocol {
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func register(email: String, password: String,
                  sucessHandler: @escaping (UserModel) -> Void,
                  failureHandler: @escaping (Error) -> Void) {
        
        self.business.register(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                sucessHandler(userModel)
            case .failure(let error):
                failureHandler(error)
            }
        }
    }
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        self.business.login(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
     }
    
}
