//
//  View.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

class View: UIView {
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    lazy var labelError: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        
        self.addSubview(tableView)
        self.addSubview(labelError)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            labelError.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelError.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
