//
//  ViewController.swift
//  PopularMoviesApp
//
//  Created by Eduardo Yamagata on 06/04/22.
//

import UIKit

class PopularMoviesViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    
    var popularMovies = [Movie]()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies() {
        textField.resignFirstResponder()
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension PopularMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension PopularMoviesViewController: UITextFieldDelegate {
    
}
