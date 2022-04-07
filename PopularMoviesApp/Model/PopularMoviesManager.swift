//
//  PopularMoviesManager.swift
//  PopularMoviesApp
//
//  Created by Eduardo Yamagata on 06/04/22.
//

import Foundation

struct PopularMoviesManager {
    
//    // MARK: - Properties
//    
//    let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=533b1b601b375c106c77d8a57dff14dd&language=pt-BR&page=1"
//    
//    var delegate: PopularMoviesManagerDelegate?
//    
//    func requestURL(at row: Int) {
//        guard let url = URL(string: popularMoviesURL) else { return }
//        
//        let session = URLSession(configuration: .default)
//        
//        let task = session.dataTask(with: url) { data, response, error in
//            if error != nil {
//                self.delegate?.didFailWithError(error: error!)
//                return
//            }
//            
//            if let safeData = data {
//                if let manancial = parseJSON(with: safeData, at: row) {
//                    delegate?.didUpdateVolume(self, popularMovies: manancial)
//                }
//            }
//        }
//        
//        task.resume()
//    }
//    
//    func parseJSON(with data: Data, at row: Int) -> PopularMoviesModel? {
//        let decoder = JSONDecoder()
//        
//        do {
//            let decodedData = try decoder.decode([Movie].self, from: data)
//            let overview = decodedData[row].overview
//            let release_date = decodedData[row].release_date
//            let title = decodedData[row].title
//            
//            let popularMovies = PopularMoviesModel(
//                overview: overview,
//                release_date: release_date,
//                title: title
//            )
//            return popularMovies
//        } catch {
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
}
