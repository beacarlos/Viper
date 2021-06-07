//
//  Interactor.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getUsers()
    func getTitle() -> String
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        Service.shared.request(router: "https://jsonplaceholder.typicode.com/users") { (result) in
            switch result {
            case .success(let data):
                guard let users = data else { return }
                
                do {
                    let entities = try JSONDecoder().decode([User].self, from: users)
                    self.presenter?.interactorDidFetchUsers(with: .success(entities))
                } catch {
                    self.presenter?.interactorDidFetchUsers(with: .failure(error))
                }
                
            case .failure(_):
                self.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
            }
        }
    }
    
    func getTitle() -> String{
        return "Lista de nomes"
    }
}
