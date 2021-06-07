//
//  Router.swift
//  TodoListaViper
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

protocol Router {
    var viewController: UIViewController { get }
}

class ListRouter: Router {
    var viewController: UIViewController {
        let controller = ListViewController()
        let interactor = ListInteractor()
        let presenter = ListPresenter(view: controller, interactor: interactor, router: self)
        
        let navigationController = UINavigationController(rootViewController: controller)
        
        controller.event = presenter
        interactor.output = presenter
        presenter.view = controller
        
        return navigationController
    }
    
    func pushToAddListRouter(viewController: UIViewController?) {
//        let addListRouter = AddListRouter()
//        viewController?.navigationController?.pushViewController(addListRouter.viewController,
//                                                                 animated: true)
    }
    
    func presentToDetailRouter(todoList: TodoList, viewController: UIViewController?) {
//        let detailListRouter = DetailListRouter()
//        viewController?.present(detailListRouter.viewController, animated: true, completion: nil)
    }
}
