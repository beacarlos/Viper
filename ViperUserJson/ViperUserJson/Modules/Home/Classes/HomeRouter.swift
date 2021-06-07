//
//  HomeRouter.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import UIKit

protocol HomeRouterProtocol {
    var view: HomeViewControllerProtocol? { get set }
}

class HomeRouter: HomeRouterProtocol {
    weak var view: HomeViewControllerProtocol?
    weak var viewController: UIViewController?
}
