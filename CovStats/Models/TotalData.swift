//
//  TotalData.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

// Data Declaration: Endpoints Data TotalData
struct TotalDataObject: Codable {
    let data: TotalData
}

// 4 Object yang digunakan dari object data
struct TotalData: Codable {
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
    
    // Default Dummy Data ketika rapidapi.com Error, sehingga show data 0, 0, 0, 0.0 di Aplikasi
    static let dummyData = TotalData(confirmed: 0, deaths: 0, active: 0, fatality_rate: 0.0)
}
