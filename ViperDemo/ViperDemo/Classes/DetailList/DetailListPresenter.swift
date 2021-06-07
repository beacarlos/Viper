//
//  DetailsListPresenter.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import Foundation

protocol DetailListPresenterProtocol: AnyObject {
    var router: DetailListRouter? { get set }
    var view: DetailListViewProtocol? { get set }
    var interactor: DetailListInteractor? { get set }
    
    func getData(user: User) -> Void
}

class DetailListPresenter: DetailListPresenterProtocol {
    var router: DetailListRouter?
    var view: DetailListViewProtocol?
    var interactor: DetailListInteractor?
    
    init(user: User) {
        getData(user: user)
    }
    
    func getData(user: User) {
        view?.getDetailUser(user: user)
    }
}
