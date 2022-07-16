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
    
    public var icons: [Icon] = []
    private var whenReadyBlock: ((Result<[Crypto], Error>) -> Void)?
    
    private struct Constant {
        static let apiKey = "EE5F52E1-8BFA-41D8-91A8-7D6F41044D58"
        static let assetsURL = "https://rest.coinapi.io/v1/assets"
        static let iconURL = "https://rest.coinapi.io/v1/assets/icons/55"
    }
    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        AF.request(Constant.assetsURL + "?apiKey=" + Constant.apiKey).responseDecodable(of: [Crypto].self) { response  in
            
            guard !self.icons.isEmpty else {
                self.whenReadyBlock = completion
                return
            }
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                print("Failed to decode, Handle Error here: \(error)")
            }

        }
        
    }
    
    public func getAllIcons() {
        AF.request(Constant.iconURL + "?apiKey=" + Constant.apiKey).responseDecodable(of: [Icon].self) { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.icons = result
                if let completion = self?.whenReadyBlock {
                    APICaller.shared.getAllCryptoData(completion: completion)
                }

            case .failure(let error):
                print("Failed to decode, Handle Error here: \(error)")
            }

        }
    }
}


