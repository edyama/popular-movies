//
//  ViewController.swift
//  PopularMoviesApp
//
//  Created by Eduardo Yamagata on 06/04/22.
//

import UIKit

class PopularMoviesViewController: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    
    // MARK: - Properties
    
    var popularMovies = [Movie]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PopularMovieTableViewCell.nib(), forCellReuseIdentifier: PopularMovieTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    
    // MARK: - Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies() {
        textField.resignFirstResponder()
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        let query = text.replacingOccurrences(of: " ", with: "%20")
        
        popularMovies.removeAll()
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=533b1b601b375c106c77d8a57dff14dd&language=en-US&page=1")!), completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            var result: PopularMoviesData?
            do {
                result = try JSONDecoder().decode(PopularMoviesData.self, from: data)
            } catch {
                print("error")
            }
            
            guard let finalResult = result else { return }
            
            print("\(finalResult.results.first?.title)")
            
            let newMovies = finalResult.results
            self.popularMovies.append(contentsOf: newMovies)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).resume()
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension PopularMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieTableViewCell.identifier, for: indexPath) as! PopularMovieTableViewCell
        cell.configure(with: popularMovies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension PopularMoviesViewController: UITextFieldDelegate {
    
}
