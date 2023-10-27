//
//  LoginViewController.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import UIKit

protocol LoginViewControllerDelegate {
    var viewState:((nowState)->Void)?{get set}
    var heroesViewModel: HeroesViewControllerDelegate {get}
    func onLoginPressed (user: String?, password: String?)
}

enum nowState {
    case errorUser(_ error: String?)
    case errorPassword(_ error: String?)
    case navigateToNext
}

class LoginViewController: UIViewController {
    // MARK: - IBOutlet -
    @IBOutlet weak var lblUser: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblWarning: UILabel!
    
    // MARK: - IBAction -
    @IBAction func onButtonPressed(_ sender: Any) {
        viewModel?.onLoginPressed(user: lblUser.text, password: lblPassword.text)
    }
    
    // Instanciar ViewModel del Protocolo
    var viewModel: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setObserver()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "LOGIN_TO_MAIN",
              let heroesViewController = segue.destination as? HeroesViewController else {
            return
        }
        heroesViewController.viewModel = viewModel?.heroesViewModel
    }
    
    // MARK: - Funciones Privadas -

    
    private func setObserver(){
        viewModel?.viewState = {[weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .errorUser(let error):
                    self?.lblWarning.text = error
                    self?.lblWarning.isHidden = false
                case .errorPassword(let error):
                    self?.lblWarning.text = error
                    self?.lblWarning.isHidden = false
                case .navigateToNext:
                    self?.performSegue(withIdentifier: "LOGIN_TO_MAIN", sender: nil)
                }
            }
        }
    }
}
