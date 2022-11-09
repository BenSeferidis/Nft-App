//
//  NftListViewController.swift
//  Nft Assets
//
//  Created by Ben Seferidis on 12/10/22.
//

import UIKit

//PresentViewController
class PresentViewController: UIViewController  {

    // MARK: - IBProperties
        @IBOutlet weak var lbl_Id: UILabel!
        @IBOutlet weak var img_View: UIImageView!
        @IBOutlet weak var lbl_Name: UILabel!
        @IBOutlet var likeButton: UIButton!
        @IBOutlet var creatorName: UILabel!
    
    @IBOutlet var cnameLbl: UILabel!
    // MARK: - Properties

        var nft: Nft?
        var icon: Icon?
        var creator: Creator?
        var user: User?
        var numlikes: Int = 0
        var count:Int = 0
        var press = false
        var delegate : TestDelegate?
    
        static let identifier = "PresentViewController"
    // MARK: - Life Cyrcle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_Name.text = nft?.name
        lbl_Id.text = "\((nft?.id)!)"
        creatorName.text = creator?.user.username
       
        print(count)
        
        let imgUrl = (nft?.image_url)!
        print(imgUrl)
        img_View.downloaded(from: imgUrl)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        displayPopUp()
    }
     
    static let numberFormatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    
    // MARK: - Methods

    @IBAction func sendBackTheLikess(_ sender: UIButton) {
        count = count + 1
        print("the value of count is : \(count)")
        delegate?.sendBackTheLikess(int: count)
    }
    
    @IBAction func popupTapped(_ sender: UIButton) {
        displayPopUp()
    }
    
    func countLks() {
        count = count + 1
        print(count)
    }
    
    func displayPopUp () {
        let storyBoard = UIStoryboard(name: "PopUpViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        vc.nft = nft
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

    // MARK: - Extensions

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

    // MARK: - Protocols

protocol TestDelegate{
    func sendBackTheLikess(int:Int)
}






