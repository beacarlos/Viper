//
//  MainRouter.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import UIKit

protocol MainRouterProtocol {
    var presenter: MainPresenterProtocol? { get set }
    func showHome()
}

class MainRouter: MainRouterProtocol {
    weak var presenter: MainPresenterProtocol?
    weak var viewController: UIViewController?
    
    // ir para o modulo home
    func showHome() {
        let viewController = HomeModule().buildDefault()
        viewController.modalPresentationStyle = .fullScreen
        self.viewController?.present(viewController, animated: true, completion: nil)
    }
}
