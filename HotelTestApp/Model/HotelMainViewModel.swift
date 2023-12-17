//
//  HotelMainViewModel.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import Foundation

struct Room: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}
