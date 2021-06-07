//
//  MainInteractor.swift
//  ViperUserJson
//
//  Created by Beatriz Carlos on 04/06/21.
//

import Foundation

protocol MainInteractorProtocol {
    var presenter: MainPresenterProtocol? { get set }
}

class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol?
}
