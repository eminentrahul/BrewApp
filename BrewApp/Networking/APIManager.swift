//
//  APIManager.swift
//  BrewApp
//
//  Created by Rahul Ravi Prakash on 19/12/21.
//

import Foundation
import SwiftUI

class APIManager: ObservableObject {
    
    @Published var result = [Result]()
    
    func getDataFromAPI() {
        if let url = URL(string: nowPlayingURLString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let data = data {
                        do {
                            let nowPlayingMovieData = try JSONDecoder().decode(NowPlayingMovieData.self, from: data)
                            DispatchQueue.main.async {
                                self.result = nowPlayingMovieData.results.sorted(by: {$0.vote_average > $1.vote_average})
                            }
                            
                        } catch {
                            fatalError("Failed to fetch data due to \(error).")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func removeItem(for id: Int) {
        result.removeAll(where: {$0.id == id})
    }
}

struct NowPlayingMovieData: Decodable {
    let results: [Result]
}

struct Result: Decodable, Hashable {
    let id: Int
    let title: String
    let poster_path: String
    let overview: String
    let vote_average: Double
    let backdrop_path: String
    let release_date: String
}
