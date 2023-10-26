//
//  LoginViewController.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import UIKit

protocol LoginViewControllerDelegate {
    var viewState:((nowState)->Void)?{get set}
    func onLoginPressed (user: String?, password: String?)
}

enum nowState {
    case navigateToNext
}

class LoginViewController: UIViewController {
    // MARK: - IBOutlet -
    @IBOutlet weak var lblUser: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblWarning: UILabel!
    // MARK: - IBAction -
    @IBAction func onButtonPressed(_ sender: Any) {
    }
    
    // Instanciar ViewModel del Protocolo
    var viewModel: LoginViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onLoginPressed(user: lblUser.text, password: lblPassword.text)
    }
    
    // MARK: - Funciones Privadas -
    private func initViews(){
        
    }
    
    private func setObserver(){
        viewModel?.viewState = {[weak self] state in
            switch state {
            case .navigateToNext:
                self?.performSegue(withIdentifier: "LOGIN_TO_MAIN", sender: nil)
            }
        }
    }
}
