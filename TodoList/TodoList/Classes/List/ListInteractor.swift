//
//  ListInteractor.swift
//  TodoListaViper
//
//  Created by Beatriz Carlos on 31/05/21.
//

import Foundation

protocol ListInteractorInput: AnyObject {
    func fetchTodoList()
}

protocol ListInteractorOutput: AnyObject {
    func getTodoList(todo: [TodoList])
}

class ListInteractor: ListInteractorInput {
    weak var output: ListInteractorOutput?
    
    func fetchTodoList() {
        let list = [TodoList(id: 1, title: "Teste 1"), TodoList(id: 1, title: "Teste 1"), TodoList(id: 1, title: "Teste 1")]
        print(list)
        output?.getTodoList(todo: list)
    }
}
