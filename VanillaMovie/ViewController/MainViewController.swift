//
//  ViewController.swift
//  SimpleMovie
//
//  Created by pineone on 2022/05/12.
//

import UIKit

/*
 uisearchtextfield
 uisearchbar
 
 https://www.boostcourse.org/mo326/project/24/content/22
 
 기본적으로 VC에 UINavigationItem(navigationItem)이 있다.
 https://developer.apple.com/documentation/uikit/uisearchtextfield
 https://developer.apple.com/documentation/uikit/uisearchtoken
 https://developer.apple.com/documentation/uikit/uisearchtextfielddelegate
 https://developer.apple.com/design/human-interface-guidelines/ios/bars/search-bars/
 */

class MainViewController: UIViewController {
    
    lazy var resultsTableController = SearchResultViewController()
    
    // MARK: - View
    private lazy var naviBarAppear = UINavigationBarAppearance().then {
        $0.backgroundColor = .clear // .gray
    }
    
    lazy var searchController = UISearchController(searchResultsController: resultsTableController).then {
        $0.searchBar.autocapitalizationType = .none
        $0.searchBar.searchTextField.placeholder = "최소 평점을 입력하세요 (0~9)"
        $0.searchBar.returnKeyType = .done
    }
    
    private lazy var tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
    }
    
    private lazy var button = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLayout()
    }
    
    
    // MARK: - Method
    private func setupNavigationBar() {
        navigationItem.title = "Movie"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        definesPresentationContext = true
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubviews([tableView, button])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func setupResultController() {
        if searchController.searchBar.searchTextField.tokens.isEmpty {
            resultsTableController.tableView.delegate = resultsTableController
        }
    }
    
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.isEmpty ?? false {
            
        } else {
            
        }
        
        //resultsTableController.showSuggestedSearches = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.dismiss(animated: true, completion: nil)
        searchBar.text = ""
    }
}


extension MainViewController: UISearchControllerDelegate {
    
    func presentSearchController(_ searchController: UISearchController) {
        searchController.showsSearchResultsController = true
        
    }
}
