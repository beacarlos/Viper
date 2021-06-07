//
//  Entity.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 31/05/21.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let company: Company
}

struct Company: Codable {
    let name: String
}
