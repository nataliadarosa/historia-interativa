//
//  Cenario.swift
//  HistoriaInterativa
//
//  Created by Natalia da Rosa on 25/07/21.
//

import UIKit

struct Cenario {
    var texto: String
    let opcoes: [String]?
    var imagemFundo: UIImage
    let posicao: Int
    
    static func comecar() -> Cenario {
        Cenario(texto: "Você está em casa, sozinho, depois de assistir Fear Street part 2, já são 00:00, e pensa nos compromissos que tem no dia seguinte na faculdade. Então você:", opcoes: ["Vai escovar os dentes", "Vai pegar um copo d'água na cozinha"], imagemFundo: UIImage(systemName: "multiply")!, posicao: 0)
    }
}
