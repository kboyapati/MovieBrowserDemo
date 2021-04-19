//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    var movieViewModel: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
    }
    
    func configureUI() {
        if let url = self.movieViewModel?.imageUrl {
            self.imageView.load(url: url, placeholder: #imageLiteral(resourceName: "placeholder")) { [weak self] image in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.updateImageView(size: image?.size ?? .zero)
                }
            }
        }
        self.textView.text = self.movieViewModel?.overview
        self.lblTitle.text = self.movieViewModel?.title
        self.lblReleaseDate.text = self.movieViewModel?.releaseData
        self.updateImageView(size: CGSize(width: 185, height: 185))
    }
    
    func updateImageView(size: CGSize = .zero) {
        if size != .zero {
            self.imageViewWidth.constant = size.width
            self.imageViewHeight.constant = size.height
            self.imageView.superview?.layoutIfNeeded()
        }
        self.textView.textContainer.exclusionPaths = [UIBezierPath(rect: self.imageView.frame)]
    }
}
