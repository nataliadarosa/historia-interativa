//
//  TelaFinalViewController.swift
//  HistoriaInterativa
//
//  Created by Natalia da Rosa on 25/07/21.
//

import UIKit

protocol AcoesFinais: AnyObject {
    func jogarNovamente()
}

class TelaFinalViewController: UIViewController {
    weak var delegate: AcoesFinais?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clicouJogarNovamente(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        self.delegate?.jogarNovamente()
    }
    
    @IBAction func clicouRetornarAoMenu(_ sender: Any) {
        dismiss(animated: false)
    }
}
