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
    
    private let decoder = JSONDecoder()
    
    private struct Constant {
        static let apiKey = "EE5F52E1-8BFA-41D8-91A8-7D6F41044D58"
        static let assetsURL = "https://rest.coinapi.io/v1/assets"
    }

    private init() { // init can only be called once (only one instance)
        
    }
    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        AF.request(Constant.assetsURL + "?apiKey=" + Constant.apiKey).response { response in
            
            if let error = response.error {
                print("Handle Error Please: \(error)")
            }
            
            guard let data = response.data else {
                print("no data")
                return
            }
            
            do {
                let result = try self.decoder.decode([Crypto].self, from: data)
                completion(.success(result))
            }
            catch let decodeError {
                print("Failed to decode, Handle Error here: \(decodeError)")
            }
        }
        
    }
}


