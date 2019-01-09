//
//  UpcomingMovieCollectionViewCell.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 05/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import Kingfisher
import UIKit

class UpcomingMovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    func fill(model: UpcomingMoviesScene.FetchMovies.ViewModel.CellModel) {
        DispatchQueue.main.async {
            self.titleLabel.text = model.title
            self.genreLabel.text = model.genre
            self.releaseDateLabel.text = "Release on " + model.releaseDate
            let urlString = "\(AppUrl.image.rawValue)\(model.backdropPath)"
            self.backdropImage.kf.setImage(with: URL(string: urlString), placeholder: UIImage(named: "backDropPlaceholder"), options: [.transition(.fade(0.3))])
        }
    }
}
