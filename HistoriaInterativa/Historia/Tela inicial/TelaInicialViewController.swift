//
//  TelaInicialViewController.swift
//  HistoriaInterativa
//
//  Created by Natalia da Rosa on 20/07/21.
//

import UIKit

class TelaInicialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func clicouEmJogar(_ sender: Any) {
        let jogoController = HistoriaViewController()
        let navigationController = UINavigationController(rootViewController: jogoController)
        navigationController.navigationBar.isHidden = true
        jogoController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
}
