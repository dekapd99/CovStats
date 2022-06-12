//
//  TotalData.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

// Data Declaration
// Berisikan Data Object yang digunakan dari Endpoints Total Report
struct TotalDataObject: Codable {
    let data: TotalData
}

// 4 Object yang digunakan dari object data
struct TotalData: Codable {
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
}
