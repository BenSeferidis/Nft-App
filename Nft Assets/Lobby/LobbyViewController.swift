//  LobbyViewController.swift
//  Nft Assets
//  Created by Ben Seferidis on 12/10/22.


import UIKit


class LobbyViewController: UIViewController {
    
    // MARK: - IBProperties
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    
    var data: [DataEnum] = []
    
    var likes:[Int] = []
    var numlikes: Int = 0
    var nfts: [Nft] = []
    let creators : [Creator] = []
    var icons: [Icon] = []
    var loadData = APICaller()
    
    // MARK: - Life Cyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AssetTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AssetTableViewCell")
        
        let nib2 = UINib(nibName: "CreatorsTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "CreatorsTableViewCell")
 
        tableView.dataSource = self //method to generate cells,header and footer before they are displaying
        tableView.delegate = self //method to provide information about these cells, header and footer ....

        downloadJSON {
            self.tableView.reloadData()
            print("success")
        }
        loadData.downloadData { (result) in
            print(result)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PresentViewController {
            destination.nft = nfts[tableView.indexPathForSelectedRow!.row]
            destination.delegate = self
        }
    }
    
    // MARK: - Methods

    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://public.arx.net/~chris2/nfts.json")
        
        URLSession.shared.dataTask(with: url!) { [self] data, response, error in
            
            if error == nil {
                do {
                 
                    self.nfts = try JSONDecoder().decode([Nft].self, from: data!)
                
                    let creators = nfts.map { nft in
                        nft.creator
                    }
                    self.data.append(.type1(creators: creators))
                    
                    self.nfts.forEach { nft in
                        self.data.append(.type2(nft: nft))
                    }
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("error fetching data from api")
                }
            }
        }.resume()
    }
}

    // MARK: - Extensions

extension LobbyViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 100 : UITableView.automaticDimension
    }
    
    //gemizo ta rows tou table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch self.data[indexPath.item] {
        case .type1(let creators):
            print("--->", creators)
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreatorsTableViewCell",
                                                                           for: indexPath) as! CreatorsTableViewCell
            cell.layer.cornerRadius = cell.frame.height/2
            cell.updateCreators(creators)
            return cell
        case .type2(let nft):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssetTableViewCell",
                                                     for: indexPath) as! AssetTableViewCell
            
            
            cell.nameLabel?.text = nft.name
            cell.nameLabel.layer.cornerRadius = cell.nameLabel.frame.height/2
            cell.likesLabel?.text = "\((numlikes))"
            let imgUrl = (nft.image_url)
            print(imgUrl)
            cell.iconView.downloaded(from: imgUrl)
            cell.iconView.layer.cornerRadius = cell.iconView.frame.height/2
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
}

extension LobbyViewController : TestDelegate{
    
    func sendBackTheLikess(int: Int) {
        numlikes = int
        tableView.reloadData()
    }
}

    // MARK: - Enums

enum DataEnum {
    case type1(creators: [Creator])
    case type2(nft: Nft)
}

    // MARK: - Struct

struct Constants {
    static let url = "https://public.arx.net/~chris2/nfts.json"
}
