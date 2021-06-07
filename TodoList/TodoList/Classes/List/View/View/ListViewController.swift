//
//  ListViewController.swift
//  TodoListaViper
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

protocol ListView: AnyObject {
    func showTodoList(todoList: [TodoList])
}

class ListViewController: UIViewController, ListView {
    let contentView = ListsView(frame: UIScreen.main.bounds)
    private var todoList = [TodoList]()
    var event: ListEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
//        showTodoList(todoList: todoList)
        event?.fetchTodoList()
    }
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationBar()
        self.event?.fetchTodoList()
    }
    
    func setupNavigationBar() {
        self.title = "Todo List Viper"
        let add = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill"), style: .plain, target: self, action: #selector(addTapped))
        add.tintColor = .purple
        self.navigationItem.rightBarButtonItem = add
    }
    
    private func setDelegates() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    @objc func addTapped(sender: UIButton) {
        print("Tap addTapped")
    }
    
    func showTodoList(todoList: [TodoList]) {
        self.todoList = todoList
        contentView.tableView.reloadData()
        
        print(self.todoList)
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Teste"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let todoListItem = todoList[indexPath.row]
        event?.itemListTapped(todoList: todoListItem, view: self)
    }
}
