//
//  CurrentMoviesViewController.swift
//  Movies
//
//  Created by Consultant on 6/16/22.
//

import UIKit

class CurrentMoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]()
    private let pageLimit = 20
    private var page = 1
    private var inLastPage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getCurrentMovies()

    }
    
    func setUpView(){
        title = "Now playing movies"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getCurrentMovies(completed: ((Bool) -> Void)? = nil){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDateString = dateFormatter.string(from:  Date())
        let startDate = Calendar(identifier: .iso8601).date(byAdding: .weekOfYear, value: -3, to: Date())!
        let startDateString =  dateFormatter.string(from: startDate)
        
        var components = URLComponents(string: APIEndpoints.baseUrl)!
        components.queryItems = [
            URLQueryItem(name: "primary_release_date.gte", value: startDateString),
            URLQueryItem(name: "primary_release_date.lte", value: currentDateString)
            
        ]
        
        URLSession.shared.getRequest(page: page, components: components, decoding: MovieRequest.self){ result in
            switch result{
            case .success(let moviesRequest):
                DispatchQueue.main.async {
                    self.movies.append(contentsOf: moviesRequest.results)
                    self.page = moviesRequest.page + 1
                    self.inLastPage = moviesRequest.totalPages == moviesRequest.page
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
    }
    

}

extension CurrentMoviesViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listSection = TableSection(rawValue: section) else { return 0 }
        switch listSection {
        case .moviesList:
            return movies.count
        case .loader:
            return movies.count >= pageLimit ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = TableSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch section {
            case .moviesList:
                let selectedMovie = movies[indexPath.row]
                cell.textLabel?.text = selectedMovie.title
                cell.detailTextLabel?.text = "Release date: \(selectedMovie.releaseDate ?? "No data")"
            case .loader:
                cell.textLabel?.text = "Loading..."
                cell.textLabel?.textColor = .systemBlue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let section = TableSection(rawValue: indexPath.section) else { return }
        guard !movies.isEmpty else { return }
        
        if section == .loader {
            print("load new data...")
            getCurrentMovies() { [weak self] success in
                if !success {
                    self?.hideBottomLoader()
                }
            }
        }
    }
    
    private func hideBottomLoader(){
        DispatchQueue.main.async {
            let lastListIndexPath = IndexPath(row: self.movies.count - 1, section: TableSection.moviesList.rawValue)
            self.tableView.scrollToRow(at: lastListIndexPath, at: .bottom, animated: true)
        }
    }
    
    
}
