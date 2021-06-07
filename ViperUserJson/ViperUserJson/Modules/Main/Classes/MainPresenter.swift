//
//  MainPresenter.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import UIKit

protocol MainPresenterProtocol: AnyObject {
    var router: MainRouterProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    var view: MainViewControllerProtocol? { get set }
    
    func viewDidAppear()
}

class MainPresenter: MainPresenterProtocol {
    var interactor: MainInteractorProtocol?
    var router: MainRouterProtocol?
    weak var view: MainViewControllerProtocol?
    
    // Método que chama o modulo home
    func viewDidAppear() {
         self.router?.showHome()
    }
}
