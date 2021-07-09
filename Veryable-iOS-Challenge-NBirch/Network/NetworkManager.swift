//
//  AccountRepo.swift
//  Veryable-iOS-Challenge-NBirch
//
//  Created by Birch, Nathan J on 7/7/21.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json"
    
    private init() {}
    

    func getAccounts(completed: @escaping (Result<[Account], Error>) -> Void ) {
        guard let url = URL(string: baseURL) else {
            //completed(.failure(.invalidURL))
            print("invalid url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                //completed(.failure(.unableToComplete))
                print("unable to complete")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                //completed(.failure(.invalidResponse))
                print("invalid response")
                return
            }
            
            guard let data = data else {
                //completed(.failure(.invalidData))
                print("invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let accounts = try decoder.decode([Account].self, from: data)
                completed(.success(accounts))
            } catch {
                //completed(.failure(.invalidData))
                print("invalid data")
            }
        }
        
        task.resume()
    }
}

