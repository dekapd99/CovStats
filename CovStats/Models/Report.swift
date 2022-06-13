//
//  Report.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

// Data Declaration: Endpoints Data Report
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
    
    // Default Dummy Data ketika rapidapi.com Error, sehingga show data Terbaru, 0, 0, 0, 0.0, dan text N/A & Error di Aplikasi
    static let dummyData = RegionReport(date: Date.now, confirmed: 0, deaths: 0, active: 0, fatality_rate: 0.0, region: RegionDetail(name: "N/A", province: "Province"))
}

// 2 Object yang digunakan dari object region
struct RegionDetail: Codable {
    let name: String
    let province: String
}
