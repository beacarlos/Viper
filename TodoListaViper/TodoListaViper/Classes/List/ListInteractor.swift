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
    
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func fetchTodoList() {
        let list = coreDataManager.fetch(ofType: TodoList.self)
        output?.getTodoList(todo: list)
    }
}
