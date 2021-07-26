//
//  HistoriaViewController.swift
//  HistoriaInterativa
//
//  Created by Natalia da Rosa on 21/07/21.
//

import UIKit

class HistoriaViewController: UIViewController {

    @IBOutlet weak var imagemFundo: UIImageView!
    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var primeiroBotao: BotaoPadrao!
    @IBOutlet weak var segundoBotao: BotaoPadrao!
    @IBOutlet weak var terceiroBotao: BotaoPadrao!
    
    var reconhecerToque: UITapGestureRecognizer!
    var cenarioAtivo: Cenario!
    var cenariosPossiveis: [Cenario]!
    var pontuacao = 0
    lazy var conjuntoBotoes = [primeiroBotao, segundoBotao, terceiroBotao]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reconhecerToque = UITapGestureRecognizer(target: self, action: #selector(tocouNaTela(_:)))
        view.addGestureRecognizer(reconhecerToque)
        iniciar()
    }
    
    func iniciar() {
        esconderOpcoes()
        cenariosPossiveis = criarCenariosPossiveis()
        cenarioAtivo = cenariosPossiveis.first!
        
        primeiroBotao.tag = 1
        segundoBotao.tag = 2
        terceiroBotao.tag = 3
        
        atualizarInterface()
    }
    
    func atualizarInterface() {
        texto.text = cenarioAtivo.texto
        imagemFundo.image = cenarioAtivo.imagemFundo
        
        if let opcoes = cenarioAtivo.opcoes {
            reconhecerToque.isEnabled = false
            
            for (indice, opcao) in opcoes.enumerated() {
                let botao = conjuntoBotoes[indice]!
                botao.isHidden = false
                botao.setTitle(opcao, for: .normal)
            }
        } else {
            reconhecerToque.isEnabled = true
            esconderOpcoes()
        }
    }
    
    func criarCenariosPossiveis() -> [Cenario] {
        [
            Cenario(texto: "Você está em casa, sozinho, depois de assistir Fear Street part 2.", opcoes: nil, imagemFundo: UIImage(named: "background-1")!, posicao: 0),
            Cenario(texto: "Já são 00:00, e pensa nos compromissos que tem no dia seguinte na faculdade. Então você:", opcoes: ["Vai escovar os dentes", "Vai pegar um copo d'água na cozinha"], imagemFundo: UIImage(named: "background-1")!, posicao: 1),
            Cenario(texto: "Você ouve um barulho na sala, e então vai conferir.", opcoes: nil, imagemFundo: UIImage(named: "background-4")!, posicao: 2),
            Cenario(texto: "Você ignora pensando que pode ser o gato e vai se deitar.", opcoes: ["Colocar despertador para 6:00 da manhã, para não se atrasar", "Colocar despertador para 7:00 da manhã, dormir mais e pegar o ônibus correndo"], imagemFundo: UIImage(named: "background-4")!, posicao: 3),
            Cenario(texto: "Durante a noite sonha que está atrasado e acorda as 3:00. Primeira coisa que voce pensa:", opcoes: ["Lembra do filme de terror que estava assistindo", "Pensa que precisa voltar a dormir", "Confere as notificações do celular"], imagemFundo: UIImage(named: "background-5")!, posicao: 4),
            Cenario(texto: "Você ouve um barulho na direção da janela e percebe que há um vulto próximo a parede que se curva até o teto, então você:", opcoes: ["Fecha olhos com força", "Grita", "Decide não acreditar"], imagemFundo: UIImage(named: "background-7")!, posicao: 5),
            Cenario(texto: "texto dinamico", opcoes: nil, imagemFundo: UIImage(), posicao: 6),
            Cenario(texto: "A sombra vem na sua direção e você pensa em sair correndo do quarto. Ao tentar, algo te segura e você cai no chão.", opcoes: nil, imagemFundo: UIImage(named: "background-7")!, posicao: 7),
            Cenario(texto: "Você acorda novamente pensando estar atrasado, olha para seu celular e percebe que são 3:00. Você:", opcoes: ["Se questiona sobre o que aconteceu", "Começa a mexer no celular", "Tenta voltar a dormir, pois precisa acordar cedo"], imagemFundo: UIImage(named: "background-5")!, posicao: 8),
            Cenario(texto: "Você se lembra do sonho que teve. Você olha em direção da janela, mas dessa vez o vulto está no meio do quarto, mais perto da sua cama. Então você:", opcoes: ["Pensa ser uma paralisia do sono e tenta recobrar os movimentos", "Grita", "Pensa se tratar de um sonho bobo e decide ignorar"], imagemFundo: UIImage(named: "background-9")!, posicao: 9),
            Cenario(texto: "texto dinamico", opcoes: nil, imagemFundo: UIImage(), posicao: 10),
            Cenario(texto: "A sombra vem na sua direção e você pensa em sair correndo do quarto. Ao tentar, algo te segura e você cai no chão. Então você acorda...", opcoes: nil, imagemFundo: UIImage(named: "background-7")!, posicao: 11),
            Cenario(texto: "Você acorda suado, tudo foi um sonho e seu quarto está vazio. Você confere o celular e são 3:00. Depois do susto, voce vai:", opcoes: ["Ao banheiro lavar o rosto", "Pegar o celular e mandar mensagem para seu amigo contando o que aconteceu", "Tomar um copo d'água na cozinha"], imagemFundo: UIImage(named: "background-5")!, posicao: 12),
            Cenario(texto: "Ao tentar, você não consegue se mexer e seu corpo começa a tremer como se estivesse tendo uma convulsão.", opcoes: nil, imagemFundo: UIImage(named: "background-10")!, posicao: 13),
            Cenario(texto: "Você tenta chamar por ajuda e não consegue, e também lembra que não tem ninguém em casa.", opcoes: nil, imagemFundo: UIImage(named: "background-11")!, posicao: 14),
            Cenario(texto: "Se debatendo, você cai no chão e percebe que tem alguém no canto do quarto, que começa a andar na sua direção. ", opcoes: nil, imagemFundo: UIImage(named: "background-12")!, posicao: 15),
            Cenario(texto: "Você se desespera, tentando controlar seu corpo, sem sucesso. A pessoa chega mais perto a passos lentos, ela se abaixa para que possa ver seu rosto. Você percebe que o rosto da pessoa é idêntico ao seu! O desconhecido sussura em seu ouvido o que você mais temia ouvir em toda a sua vida. Você desmaia e só acorda novamente pela manhã, com seu despertador tocando.", opcoes: nil, imagemFundo: UIImage(named: "background-13")!, posicao: 16),
            Cenario(texto: "texto dinamico", opcoes: nil, imagemFundo: UIImage(named: "background-5")!, posicao: 17)
        ]
    }
    
    func esconderOpcoes() {
        conjuntoBotoes.forEach { $0?.isHidden = true }
    }
    
    func avancarJogo(comOpcao opcao: Int?) {
        let posicao = cenarioAtivo.posicao
        
        cenarioAtivo = cenariosPossiveis[posicao + 1]
        
        switch posicao {
        case 1:
            cenarioAtivo.imagemFundo = criarImagemDinamica(para: posicao, comOpcao: opcao ?? 0)
        case 5, 9, 16:
            cenarioAtivo.texto = criarTextoDinamico(para: posicao, comOpcao: opcao ?? 0)
            cenarioAtivo.imagemFundo = criarImagemDinamica(para: posicao, comOpcao: opcao ?? 0)
        default: break
        }
    }
    
    func criarImagemDinamica(para posicao: Int, comOpcao opcao: Int) -> UIImage {
        switch posicao {
        case 1:
            switch opcao {
            case 1:
                return UIImage(named: "background-2")!
            case 2:
                return UIImage(named: "background-3")!
            default: return UIImage()
            }
        case 5:
            switch opcao {
            case 1:
                return UIImage(named: "background-7")!
            case 2:
                return UIImage(named: "background-7")!
            case 3:
                return UIImage(named: "background-6")!
            default: return UIImage()
            }
        case 9:
            switch opcao {
            case 1:
                return UIImage(named: "background-9")!
            case 2:
                return UIImage(named: "background-9")!
            case 3:
                return UIImage(named: "background-8")!
            default: return UIImage()
            }
        case 16:
            return UIImage(named: "background-5")!
        default: return UIImage()
        }
    }
    
    func criarTextoDinamico(para posicao: Int, comOpcao opcao: Int) -> String {
        switch posicao {
        case 5:
            switch opcao {
            case 1:
                pontuacao += 1
                return "Infelizmente ao abrir os olhos, nada mudou. E então..."
            case 2:
                return "Você não consegue gritar e algo horrível começa a acontecer."
            case 3:
                pontuacao -= 1
                return "Você vê com o canto do olho algo se levantando do seu lado, e então..."
            default: return "texto dinamico"
            }
        case 9:
            switch opcao {
            case 1:
                pontuacao += 1
                return "Sua tentativa falha e você agora está desesperado encarando aquela sombra maligna que parece olhar para o fundo da sua alma."
            case 2:
                return "Você não consegue gritar e começa a entrar em desespero."
            case 3:
                pontuacao -= 1
                return "Algo se move ao seus pés debaixo da coberta e começa a escalar seu corpo."
            default: return "texto dinamico"
            }
        case 16:
            switch pontuacao {
            case -2:
                return "Você nunca mais foi o mesmo depois desse dia, quase não dorme mais e quando consegue, os mesmos sonhos horríveis se repetem sempre."
            case -1, 0, 1:
                return "Você acorda no chão. Depois desse dia os sonhos nunca mais se repetiram, mas você não sabe dizer se foram somente sonhos. As vezes você tem a impressão de que alguem te observa das sombras."
            case 2:
                return "Você passa a dormir bem depois de toda essa bagunça. Os sonhos nunca mais se repetiram e agora você tem uma ótima história de terror para contar para os seus amigos!"
            default: return "texto dinamico"
            }
        default: return "texto dinamico"
        }
    }
    
    @objc func tocouNaTela(_ sender: Any?) {
        let opcao = (sender as? BotaoPadrao)?.tag
        if cenarioAtivo.posicao != 17 {
            avancarJogo(comOpcao: opcao)
            atualizarInterface()
        } else {
            let telaFinal = TelaFinalViewController()
            telaFinal.delegate = self
            navigationController?.pushViewController(telaFinal, animated: true)
        }
    }
    
    @IBAction func toquePrimeiroBotao(_ sender: Any?) {
        tocouNaTela(primeiroBotao)
    }
    
    @IBAction func toqueSegundoBotao(_ sender: Any?) {
        tocouNaTela(segundoBotao)
    }
    
    @IBAction func toqueTerceiroBotao(_ sender: Any?) {
        tocouNaTela(terceiroBotao)
    }
}

extension HistoriaViewController: AcoesFinais {
    func jogarNovamente() {
        iniciar()
    }
}
