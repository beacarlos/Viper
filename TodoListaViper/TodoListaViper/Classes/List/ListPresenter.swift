//
//  ListPresenter.swift
//  TodoListaViper
//
//  Created by Beatriz Carlos on 31/05/21.
//

import Foundation

protocol ListEvent: AnyObject {
  func fetchTodoList()

  func addButtonTapped(view: ListViewController)

  func itemListTapped(todoList: TodoList, view: ListViewController)
}

class ListPresenter: ListEvent, ListInteractorOutput {
  weak var view: ListView?
  let interactor: ListInteractorInput
  let router: ListRouter

  init(view: ListView, interactor: ListInteractorInput, router: ListRouter) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }

  // MARK: - Event
  func fetchTodoList() {
    interactor.fetchTodoList()
  }

  func addButtonTapped(view: ListViewController) {
    router.pushToAddListRouter(viewController: view)
  }

  func itemListTapped(todoList: TodoList, view: ListViewController) {
    router.presentToDetailRouter(todoList: todoList, viewController: view)
  }

  // MARK: - Output
  func getTodoList(todo: [TodoList]) {
    view?.showTodoList(todoList: todo)
  }
}
