//
//  WCHomeCollectionViewCell.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import UIKit
import CLDUtilities

class WCHomeCollectionViewCell: UICollectionViewCell {
    
    enum Constante {
        static let shadowOffset = CGSize(width: 0, height: 3)
        static let shadowOpacity: Float = 0.5
        static let cornerRadius: CGFloat = 9
    }

    @IBOutlet weak private var imgHome: UIImageView!
    @IBOutlet weak private var activityHome: UIActivityIndicatorView!
    @IBOutlet weak private var lblTitle: UILabel!

    var objHome: WCHome! {
        didSet {
            lblTitle.text = objHome.title
            activityHome.startAnimating()
            imgHome.downloadImageInUrl(objHome.image, withPlaceHolder: nil) { [weak self] urlFile, image in
                if self?.objHome.image == urlFile {
                    self?.imgHome.image = image
                    self?.activityHome.stopAnimating()
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds    = false
        self.layer.shadowOffset     = Constante.shadowOffset
        self.layer.shadowOpacity    = Constante.shadowOpacity
        self.layer.cornerRadius     = Constante.cornerRadius
        self.layer.shadowColor      = UIColor.black.cgColor
    }
}
