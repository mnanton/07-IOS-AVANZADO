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
    var heroesViewModel: HeroesViewControllerDelegate{
       HeroesViewModel(
            apiDball: ApiDball(keyChain: KeyChainConnection()),
            keyChain: KeyChainConnection()
            )
    }
    
    //MARK: - Initializer -
    
    init(apiDball: ApiDballProtocol, keyChain: KeyChainProtocol) {
        self.apiDball = apiDball
        self.keyChain = keyChain
    }
    
    //MARK: - Public Functions -
    func onLoginPressed (user: String?, password: String?){
        DispatchQueue.global().async {
            self.verifyLogin(user: user ?? "", password: password ?? "")
        }
    }
    
    //MARK: - Private Functions -
    
    private func verifyLogin(user: String, password: String)->Void{
        var result = true
        
        if user.isEmpty {
            self.viewState?(.errorUser("DEBE INTRODUCIR UN USUARIO"))
            result = false
        }
        
        if !user.contains("@"){
            self.viewState?(.errorUser("USUARIO NO VALIDO"))
            result = false
        }
        
        if password.isEmpty{
            self.viewState?(.errorPassword("CONTRASEÑA VACIA"))
            result = false
        }
        
        if result {
            validateLogin(user: user, password: password)
        }
    }
    
    private func validateLogin(user: String, password: String) {
        apiDball.login(for: user, with: password)
    }
}
