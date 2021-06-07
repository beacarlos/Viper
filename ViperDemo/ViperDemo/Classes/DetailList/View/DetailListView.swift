//
//  DetailListView.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 01/06/21.
//

import UIKit

class DetailListView: UIView {
    lazy var labelName: UILabel = Label(font: .systemFont(ofSize: 24, weight: .regular), text: "Name")
    lazy var labelEmail: UILabel = Label(font: .systemFont(ofSize: 24, weight: .regular), text: "Email")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .white
        self.addSubview(labelName)
        self.addSubview(labelEmail)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            labelName.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: self.labelName.bottomAnchor, constant: 20),
            labelEmail.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
}
