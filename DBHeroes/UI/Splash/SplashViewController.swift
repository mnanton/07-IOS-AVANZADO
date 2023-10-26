//
//  SplashViewController.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import UIKit

// Crear Opciones para pasar en el clousure del Protocolo
enum SplashViewState {
    case loading(_ isLoading: Bool)
    case navigationToLogin
    case navigationToMain
}

// MARK: - PROTOCOLO -
protocol SplashViewControllerDelegate {
    // Clousure para pasar al ViewModel
    var viewState: ((SplashViewState) -> Void)? {get set}
    
    // Variables para inyectar el ViewModel segun el SEGUE escogido
    var loginViewModel: LoginViewControllerDelegate { get }
    var mainTableViewModel: MainTableViewControllerDelegate { get }
    
    func onViewAppear()
}

// MARK: - CLASE -
class SplashViewController: UIViewController {
       
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    // Instanciar ViewModel del Protocolo
    var viewModel: SplashViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        viewModel?.onViewAppear()
    }
}

// MARK: - EXTENSION -
extension SplashViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "SPLASH_TO_LOGIN":
                guard let loginViewController = segue.destination as? LoginViewController else {return}
                loginViewController.viewModel = viewModel?.loginViewModel

            case "SPLASH_TO_MAIN":
                guard let mainTableViewController = segue.destination as? MainTableViewController else {return}
                mainTableViewController.viewModel = viewModel?.mainTableViewModel

            default:
                break
        }
    }

    private func setObservers(){
        // LLamamos al clousure del Protocolo
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                    self?.activityIndicator.isHidden = !isLoading
                    case .navigationToLogin:
                        self?.performSegue(withIdentifier: "SPLASH_TO_LOGIN", sender: nil)
                    case .navigationToMain:
                        self?.performSegue(withIdentifier: "SPLASH_TO_MAIN", sender: nil)
                }
            }
        }
    }
}
