//
//  SearchResultViewController.swift
//  SimpleMovie
//
//  Created by pineone on 2022/05/12.
//

import UIKit

class SearchResultViewController: UITableViewController{
    
    static let dummy: [Movie] = [
        Movie(url: "", title: "테스트", rating: 3.2),
        Movie(url: "", title: "ㅇㅇ", rating: 3.5),
        Movie(url: "", title: "ㅋㅋ", rating: 4.2),
        Movie(url: "", title: "ㄴㄴ", rating: 1.2)
    ]
    
    var showSuggestedSearches: Bool = false {
        didSet {
            if oldValue != showSuggestedSearches {
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchResultViewController.dummy.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: MovieListCell.identifier)
        
        return cell
    }
}


