//
//  PopularMovieTableViewCell.swift
//  PopularMoviesApp
//
//  Created by Ted Motta on 06/04/22.
//

import UIKit

class PopularMovieTableViewCell: UITableViewCell {
    // MARK: - Outlets
    
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    @IBOutlet var movieOverviewLabel: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "PopularMovieTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PopularMovieTableViewCell", bundle: nil)
    }
    
    func configure(with model: Movie) {
        self.movieTitleLabel.text = model.title
        self.movieYearLabel.text = model.release_date
        self.movieOverviewLabel.text = model.overview
        let url = model.poster_path
        if let data = try? Data(contentsOf: URL(string: url)!) {
            self.moviePosterImageView.image = UIImage(data: data)
        }
    }
}
