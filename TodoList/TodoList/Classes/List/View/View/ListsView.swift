//
//  ListsView.swift
//  TodoListaViper
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

class ListsView: UIView {
    lazy var tableView: UITableView = {
        let table =  UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .white
        self.addSubview(tableView)
        setContraints()
    }
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor)
        ])
    }
}
