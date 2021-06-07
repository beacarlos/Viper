//
//  Presenter.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyPresenter: AnyObject {
    var router: AnyRouter? { get set }
    var view: AnyView? { get set }
    var interactor: AnyInteractor? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func interactorGetTitle() -> Void
    func goTo(user: User) -> Void
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    var view: AnyView?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            let error = "Aconteceu erro inesperado ao requisitar informações."
            view?.update(with: error)
        }
    }
    
    func interactorGetTitle() {
        guard let title = interactor?.getTitle() else { return }
        view?.navigationBarTitle(title: title)
    }
    
    func goTo(user: User) {
        router?.goDetailList(user: user)
    }
}
