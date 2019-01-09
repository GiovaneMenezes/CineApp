//
//  MovieDetailViewController.swift
//  CineApp
//
//  Created by Giovane Silva de Menezes Cavalcante on 06/01/19.
//  Copyright © 2019 GSMenezes. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewText: UITextView!
    
    var model: MovieResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let model = model else { return }
        fill(model: model)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func fill(model: MovieResult) {
        let placeholderImage = UIImage(named: "backDropPlaceholder")
        let backdropPath = model.backdropPath ?? ""
        let backdropURL = URL(string: "\(AppUrl.image.rawValue)\(backdropPath)")
        backdropImageView.kf.setImage(with: backdropURL, placeholder: placeholderImage, options: [.transition(.fade(0.3))])
        genreLabel.text = GenreTranslateService.shared.formattedTranslate(to: model.genreIDS ?? [])
        let posterPath = model.posterPath ?? ""
        let posterURL = URL(string: "\(AppUrl.image.rawValue)\(posterPath)")
        posterImageView.kf.setImage(with: posterURL, placeholder: placeholderImage, options: [.transition(.fade(0.3))])
        titleLabel.text = model.title
        releaseDateLabel.text = model.releaseDate
        overviewText.text = model.overview
        overviewText.contentOffset = .zero
    }
    
}
