//
//  CreatorCollectionViewCell.swift
//  Nft Assets
//
//  Created by Ben Seferidis on 8/11/22.
//

import UIKit

class CreatorCollectionViewCell: UICollectionViewCell {
    //MARK: - IBProperties
    @IBOutlet var creatorImg: UIImageView!
    @IBOutlet var creatorName: UILabel!
   
    //MARK: - Properties
    var nft : Nft?
    var creators : [Creator] = []

    //MARK: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCollectionViewCell(_ creators : Creator) {
        creatorName.text = creators.user.username
        creatorName.layer.cornerRadius = creatorName.frame.height/4
        let imgUrl = (creators.profileImgURL)
        creatorImg.downloaded(from: imgUrl)
        creatorImg.layer.cornerRadius = creatorImg.frame.height/2.8
     
    }
    
    func renewCreators( _ creators: [Creator]) {
        self.creators = creators
    }
}

//MARK: - Protocols

protocol CreatorCollectionViewCellDelegate: AnyObject {
    func didSelectPhoto(index: Int)
}
