//
//  Report.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

struct AllReports: Codable {
    let data: [RegionReport]
}

// 6 Object yang digunakan dari object data + Deklarasi Unique ID untuk setiap negara
struct RegionReport: Codable, Identifiable {
    // Deklarasi ID Otomatis setiap Pemanggilan Region Report (Supaya setiap Negara punya Unique ID)
    let id = UUID()
    
    let date: Date
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
    let region: RegionDetail
    
    // Computed Property: Date Formatter dari API (y-MM-dd) menjadi Swift Native Date Object
    var formattedDate: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
}

// 2 Object yang digunakan dari object region
struct RegionDetail: Codable {
    let name: String
    let province: String
}
