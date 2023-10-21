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
    func onViewAppear()
}

// MARK: - CLASE -
class SplashViewController: UIViewController {
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
    private func setObservers(){
        // LLamamos al clousure del Protocolo
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(_):
                        break
                    case .navigationToLogin:
                        break
                    case .navigationToMain:
                        break
                }
            }
        }
    }
}
