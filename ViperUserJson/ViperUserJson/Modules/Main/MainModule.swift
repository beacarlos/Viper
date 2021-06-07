//
//  MainModule.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import UIKit

class MainModule {
    func buildDefault() -> UIViewController {
        let view = MainViewController()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        
        presenter.view = view // fraca
        view.presenter = presenter // forte

        presenter.router = router // forte
        router.presenter = presenter // fraca

        presenter.interactor = interactor // forte
        interactor.presenter = presenter  // fraco
        
        return view
    }
}
