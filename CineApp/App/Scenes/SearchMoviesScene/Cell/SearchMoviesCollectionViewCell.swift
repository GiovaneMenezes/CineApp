//
//  SearchMoviesCollectionViewCell.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 08/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import UIKit
import Kingfisher

class SearchMoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    func fill(model: SearchMoviesScene.SearchMovies.ViewModel.CellModel) {
        DispatchQueue.main.async {
            self.movieTitleLabel.text = model.title
            let urlString = "\(AppUrl.image.rawValue)\(model.posterPath)"
            self.posterImageView.kf.setImage(with: URL(string: urlString), placeholder: UIImage(named: "backDropPlaceholder"), options: [.transition(.fade(0.3))])
        }
    }
}
