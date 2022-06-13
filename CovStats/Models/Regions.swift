//
//  Regions.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

// Data Declaration: Endpoints Data Regions
struct AllRegions: Codable {
    let data: [Country]
}

// 2 Object yang digunakan dari object data
struct Country: Codable {
    let iso: String
    let name: String
    
    // Default Dummy Data ketika rapidapi.com Error, sehingga show text N/A & Error di Aplikasi
    static let dummyData = Country(iso: "N/A", name: "Error")
}
