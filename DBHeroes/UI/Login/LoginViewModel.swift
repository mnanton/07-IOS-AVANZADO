//
//  LoginViewModel.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import Foundation

class LoginViewModel: LoginViewControllerDelegate {
    // MARK: - Dependencias -
    private let apiDball: ApiDballProtocol
    private let keyChain: KeyChainProtocol
    
    //MARK: - Properties -
    var viewState:((nowState)->Void)?
    
    //MARK: - Initializer -
    
    init(apiDball: ApiDballProtocol, keyChain: KeyChainProtocol) {
        self.apiDball = apiDball
        self.keyChain = keyChain
    }
    
    func onLoginPressed (user: String?, password: String?){
        
    }
}
