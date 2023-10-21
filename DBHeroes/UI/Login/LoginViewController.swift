//
//  LoginViewController.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import UIKit

protocol LoginViewControllerDelegate {
    
}

class LoginViewController: UIViewController {
    
    // Instanciar ViewModel del Protocolo
    var viewModel: LoginViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
