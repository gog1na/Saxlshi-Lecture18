//
//  UpcomingCollectionViewCell.swift
//  Saxlshi Lecture18
//
//  Created by Giorgi Goginashvili on 1/13/23.
//

import UIKit
import Kingfisher

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var votesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.backgroundColor = UIColor.black.cgColor
    }
    
    func configure(with movie: Movie) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterImage ?? "")") else {return}
        votesLabel.text = "\(movie.votes ?? 0)⭐️"
        coverImageView.kf.indicatorType = .activity
        coverImageView.kf.setImage(with: url)
    }

}
