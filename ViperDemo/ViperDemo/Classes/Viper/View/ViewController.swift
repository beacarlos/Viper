//
//  ViewController.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

protocol AnyView: AnyObject {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [User])
    func update(with error: String)
    func navigationBarTitle(title: String) -> Void
}

class ViewController: UIViewController, AnyView {
    let contentView = View(frame: UIScreen.main.bounds)
    weak var presenter: AnyPresenter?
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        presenter?.interactorGetTitle()
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    func setDelegates() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.contentView.tableView.reloadData()
            self.contentView.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.users = []
            self.contentView.tableView.isHidden = true
            self.contentView.labelError.text = error
            self.contentView.labelError.isHidden = false
        }
    }
    
    func navigationBarTitle(title: String) {
        self.title = title
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goTo(user: users[indexPath.row])
    }
}
