//
//  PopUpViewController.swift
//  Nft Assets
//
//  Created by Ben Seferidis on 14/10/22.
//

import UIKit

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
        
        let imgUrl = (nft?.image_url)!
        print(imgUrl)
        imagView.downloaded(from: imgUrl)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))

    }
    
    // MARK: - Methods
    
    @IBAction func closeView(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    @objc private func didTapClose() {
        self.navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
    }
    
}
