//
//  PopUpViewController.swift
//  Nft App
//
//  Created by Ben Seferidis on 14/10/22.
//

import UIKit
import ViewAnimator

class PopUpViewController: UIViewController {
    
    // MARK: - IBProperties
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imagView: UIImageView!
    @IBOutlet var closeButton: UIButton!
    
    
    // MARK: - Properties
    var nft: Nft?
    var icon: Icon?
    var nameId = ""
    var imag = UIImage()
    
    // MARK: - Life Cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = nft?.name
        let animation = AnimationType.from(direction: .bottom, offset: 50)
        imagView.animate(animations: [animation] , delay: 0.2, duration: 2)
        let imgUrl = (nft?.image_url)!
        print(imgUrl)
        imagView.downloaded(from: imgUrl)
        imagView.layer.shadowColor = UIColor.black.cgColor
        imagView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imagView.layer.shadowOpacity = 0.8
        imagView.layer.shadowRadius = 10
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
    }
    
    
    // MARK: - Methods
    
    @IBAction func closeView(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapClose() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
