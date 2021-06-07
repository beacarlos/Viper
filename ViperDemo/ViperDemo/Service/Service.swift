//
//  Service.swift
//  ViperDemo
//
//  Created by Beatriz Carlos on 01/06/21.
//

import Foundation

class Service {
    static let shared = Service()
    
    func request(router: String, completion: @escaping (Result<Data?, ServiceError>) -> ()) {
        let session = URLSession.shared
        guard let url = URL(string: router) else { return }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(description: error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            switch response.statusCode {
            case 200, 201:
                completion(.success(data))
            case 400:
                completion(.failure(.badRequest))
            case 404:
                completion(.failure(.notFound))
            default:
                completion(.failure(.unknownError(statusCode: response.statusCode)))
            }
        }
        
        dataTask.resume()
    }
}
