//
//  HomeInteractor.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? { get set }
}

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomePresenterProtocol?
}
