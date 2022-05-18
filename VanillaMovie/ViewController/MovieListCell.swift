//
//  MovieListCell.swift
//  VanillaMovie
//
//  Created by pineone on 2022/05/17.
//

import UIKit

class MovieListCell: UITableViewCell {
    static let identifier = String(describing: MovieListCell.self)

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    lazy var image = UIImageView().then {
        $0.image = UIImage(named: "")
    }
    
    lazy var title = UILabel().then {
        $0.text = "asdsd"
        $0.font = .systemFont(ofSize: 17, weight: .bold)
    }
    
    lazy var rating = UILabel().then {
        $0.text = "9.9"
        $0.font = .systemFont(ofSize: 11)
    }
    
    func setupLayout() {
        addSubviews([image])
    }

}
