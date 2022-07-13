//
//  CoinData.swift
//  Crypto Price Tracker
//
//  Created by TheGIZzz on 12/7/2565 BE.
//

import UIKit
import Alamofire

final class  APICaller {
    static let shared = APICaller()
    
    private struct Constant {
        static let apiKey = "EE5F52E1-8BFA-41D8-91A8-7D6F41044D58"
        static let assetsURL = "https://rest.coinapi.io/v1/assets"
    }
    private init() { // init can only be called once (only one instance)
        
    }
    
    public func getAllCryptoData() {
        AF.request(Constant.assetsURL + "?apiKey=" + Constant.apiKey).response { response in
            switch response.result {
                case .success(let reponse):
                    do {
                        if let data = reponse {
                            let json = try JSONSerialization.jsonObject(with: data)
//                            print(json)
                        }
                    } catch {

                        print("Error while decoding response: \(error)")
                    }
                case .failure(let error):
                    print(error)
                }
        }
        
    }
}


