//
//  Label.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 01/06/21.
//

import UIKit

class Label: UILabel {
    init(font: UIFont, text: String = "Default text") {
        super.init(frame: .zero)
        self.setup(font: font, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(font: UIFont, text: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.text = text
    }
}
