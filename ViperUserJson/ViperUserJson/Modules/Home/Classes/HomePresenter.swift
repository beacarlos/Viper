//
//  HomePresenter.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewControllerProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
}

class HomePresenter: HomePresenterProtocol {
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    weak var view: HomeViewControllerProtocol?
}
