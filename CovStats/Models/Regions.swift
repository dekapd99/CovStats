//
//  Regions.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

// Data Declaration
// Berisikan Data Object yang digunakan dari Endpoints Regions
struct AllRegions: Codable {
    let data: [Country]
}

// 2 Object yang digunakan dari object data
struct Country: Codable {
    let iso: String
    let name: String
}
