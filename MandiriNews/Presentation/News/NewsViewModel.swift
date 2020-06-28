//
//  NewsViewModel.swift
//  MandiriNews
//
//  Created by Indra Cahyadi on 24/06/20.
//  Copyright © 2020 Indra Cahyadi. All rights reserved.
//

import Foundation

final class NewsViewModel {
    
    func fetchNews(completion: @escaping (Result<News, Error>) -> ()) {
        
        guard var urlComponents = URLComponents(string: Constants.BaseUrl) else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: Constants.Query, value: Constants.Berita.lowercased()),
            URLQueryItem(name: Constants.From, value: showsCurrentDate()),
            URLQueryItem(name: Constants.ApiKey, value: Constants.PrivateKey)
        ]
        
        guard let url = urlComponents.url else { return }
        print(url)
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if let err = error {
                print(err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let json:News =  try JSONDecoder().decode(News.self, from: data)
                completion(.success(json))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }).resume()
    }
    
    func showsCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let current_date = dateFormatter.string(from: date)
        return current_date
    }
    
}
