//
//  HeroesViewController.swift
//  DBHeroes
//
//  Created by Miguel Nantón Díaz on 21/10/23.
//

import UIKit

protocol HeroesViewControllerDelegate {
    var viewState:((nowState)->Void)?{get set}
}

class HeroesViewController: UITableViewController {
    // Instanciar ViewModel del Protocolo
    var viewModel: HeroesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyChain = KeyChainConnection()
        print("El valor del token es \(keyChain.getToken())")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
