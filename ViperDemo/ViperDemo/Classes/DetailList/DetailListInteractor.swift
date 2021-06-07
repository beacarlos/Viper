//
//  DetailListInteractor.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import Foundation

protocol DetailListInteractorProtocol {
    var presenter: DetailListPresenter? { get set }
}

class DetailListInteractor: DetailListInteractorProtocol {
    var presenter: DetailListPresenter?
}
