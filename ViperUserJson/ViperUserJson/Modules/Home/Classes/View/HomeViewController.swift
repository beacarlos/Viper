//
//  HomeViewController.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    let contentView = HomeView(frame: UIScreen.main.bounds)

    weak var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = contentView
    }
}
