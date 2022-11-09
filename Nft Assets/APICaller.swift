//  APICaller.swift
//  Nft App
//
//  Created by Ben Seferidis on 11/10/22.

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    public struct Constants {
        static let url = "https://public.arx.net/~chris2/nfts.json"
    }
    
    public func downloadData(completion:@escaping (Result<[Nft], Error>) -> Void )
    {
        guard let url = URL(string:Constants.url)else{
            return
        }
        let task =  URLSession.shared.dataTask(with: url) { data, response, error in
            
            //print(response)
            guard let data = data , error == nil else{
                print("something went wrong with data")
                return
            }
            //mexri edo exoume parei ta data kai tora me to do-catch tha ta kanoume convert se object
            do{
                //Decode the response
                let nfts = try JSONDecoder().decode([Nft].self, from: data)
                completion(.success(nfts))
                //                print(nfts)
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
