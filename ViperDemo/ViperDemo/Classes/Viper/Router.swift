//
//  Router.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    // iniciar o módulo e faz as ligações entre as classes do modulo
    var entry: EntryPoint? { get set }
    
    static func start() -> AnyRouter
    
    func goDetailList(user: User)
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // ligação de VIP
        let view: AnyView = ViewController()
        var interactor: AnyInteractor = UserInteractor()
        let presenter: AnyPresenter = UserPresenter()
        
        view.presenter = presenter
        presenter.view = view

        presenter.interactor = interactor
        interactor.presenter = presenter

        presenter.router = router
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    func goDetailList(user: User) {
        guard let destination = DetailListRouter.start(user: user).entry else { return  }
        entry?.navigationController?.present(destination as! UIViewController, animated: true, completion: nil)
    }
}
