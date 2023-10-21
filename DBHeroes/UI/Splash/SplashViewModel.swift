//
//  SplashViewModel.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import Foundation

class SplashViewModel: SplashViewControllerDelegate {
    // Instanciamos la clase de la API y conexión con el KeyChain
    private let apiDball: ApiDballProtocol
    private let keyChain: KeyChainProtocol
    
    var viewState: ((SplashViewState) -> Void)?
    
    // Verificamos si tenemos Token. Si tenemos Token, el usuario ya fue validado
    private var isToken: Bool {
        keyChain.getToken()?.isEmpty == false
    }
    
    init(apiDball: ApiDballProtocol, keyChain: KeyChainProtocol) {
        self.apiDball = apiDball
        self.keyChain = keyChain
    }
    
    func onViewAppear() {
        // LLamamos al clousure declarado en el Protocolo, para la carga inicial
        viewState?(.loading(true))
        
        // Demoramos la validación, para que aparezca el SplashView 
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
            if self.isToken {
                self.viewState?(.navigationToMain)
            } else {
                self.viewState?(.navigationToLogin)
            }
        }
    }
}
