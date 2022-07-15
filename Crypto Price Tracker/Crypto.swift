//
//  Crypto.swift
//  Crypto Price Tracker
//
//  Created by TheGIZzz on 13/7/2565 BE.
//

import Foundation

struct Crypto: Codable {
    let asset_id: String?
    let name: String?
    let price_usd: Float?
    let id_icon: String?
}

struct Icon: Codable {
    let asset_id: String?
    let url: String?
}
