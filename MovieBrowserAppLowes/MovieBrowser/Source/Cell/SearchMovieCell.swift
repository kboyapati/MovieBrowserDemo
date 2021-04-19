//
//  SearchMovieCell.swift
//  MovieBrowser
//
//  Created by Naga Kokila Boyapati on 04/18/2021.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchMovieCell: UITableViewCell {
    
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    
    var movie: MovieViewModel? {
        didSet {
            self.configureCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func configureCell() {
        self.lblMovieName.text = self.movie?.title
        self.lblReleaseDate.text = self.movie?.releaseData
        self.lblRating.text = self.movie?.ratting
    }
}
