//
//  HeroesViewModel.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import Foundation

class HeroesViewModel: HeroesViewControllerDelegate {
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
}
