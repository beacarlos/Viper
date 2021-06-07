//
//  DetailListRouter.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

protocol DetailListRouterProtocol {
    // iniciar o módulo e faz as ligações entre as classes do modulo
    var entry: DetailListViewProtocol? { get set }
    
    static func start(user: User) -> DetailListRouterProtocol
}

class DetailListRouter: DetailListRouterProtocol {
    var entry: DetailListViewProtocol?
    
    static func start(user: User) -> DetailListRouterProtocol {
        let router = DetailListRouter()
        let view = DetailListViewController()
        let intetactor = DetailListInteractor()
        let presenter = DetailListPresenter(user: user)
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = intetactor
        presenter.router = router
        
        router.entry = view
        return router
    }
}
