//
//  UserBusiness.swift
//  ArquiteturaFirebase-MVC
//
//  Created by Oren Pelosof on 07/09/23.
//

import Foundation

protocol UserBusinessProtocol {
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void)
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void)
    
}
class UserBusiness: UserBusinessProtocol {
    let provider = UserProvider()
    
    func login(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        self.provider.login(parameters: getParams(email, password)) { result in
            switch result {
            case .success(let userModel):
                completionHandler(.success(userModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
    
    func register(email: String, password: String, completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        
        self.provider.register(parameters: getParams(email, password)) {result in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let userModel):
                completionHandler(.success(userModel))
            }
        }
    }
    
    // MARK: - Private methods
    
    private func getParams(_ email: String,_ password: String) -> [AnyHashable: Any] {
        let userModel = UserModel(email: email, password: password)
        let params: [AnyHashable: Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel: userModel]]
        
        return params
        
        
    }
}
