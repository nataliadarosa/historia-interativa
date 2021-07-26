//
//  BoxPadrao.swift
//  HistoriaInterativa
//
//  Created by Natalia da Rosa on 25/07/21.
//

import UIKit

@IBDesignable class BoxPadrao: UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}
