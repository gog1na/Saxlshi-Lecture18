//
//  TopRatedCollectionViewCell.swift
//  Saxlshi Lecture18
//
//  Created by Giorgi Goginashvili on 1/16/23.
//

import UIKit
import Kingfisher

class TopRatedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         
    }
    
    func configure(with movie: Movie) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterImage ?? "")") else {return}
        coverImageView.kf.indicatorType = .activity
        coverImageView.kf.setImage(with: url)
    }

}
