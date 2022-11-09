//
//  AssetTableViewCell.swift
//  Nft Assets
//
//  Created by Ben Seferidis on 14/10/22.
//

import UIKit

class AssetTableViewCell: UITableViewCell {
     
    //MARK: - IBProperties
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var iconView : UIImageView!
    @IBOutlet var likesLabel: UILabel!
    
    //MARK: - Properties
    var nft:Nft?
    
    //MARK: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.layer.cornerRadius = nameLabel.frame.height/2
        likesLabel.layer.cornerRadius = likesLabel.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
       
}
