//
//  DetailListViewController.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import UIKit

protocol DetailListViewProtocol: AnyObject {
    var presenter: DetailListPresenter? { get set }
    
    func getDetailUser(user: User) -> Void
}

class DetailListViewController: UIViewController, DetailListViewProtocol {
    weak var presenter: DetailListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = DetailListView(frame: UIScreen.main.bounds)
    }
    
    func getDetailUser(user: User) {
        print(user)
    }
}
