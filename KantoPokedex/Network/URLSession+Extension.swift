//
//  URLSession+Extension.swift
//  KantoPokedex
//
//  Created by lucas.silva on 23/10/21.
//

import Foundation

extension URLSession {
    func request<T: Codable>(url: URL?,
                             expecting: T.Type,
                             completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(PokeError.badUrl))
            return
        }
        
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(PokeError.invalidData))
                }
                return
            }
            
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
