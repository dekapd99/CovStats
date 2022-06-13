//
//  AlertItem.swift
//  CovStats
//
//  Created by Deka Primatio on 13/06/22.
//

import SwiftUI

// Deklarasi Singleton Alert Item dan Macam-macam Alert Context
// 3 Object yang digunakan untuk mengidentifikasi Singleton
struct AlertItem: Identifiable {
    // Deklarasi ID Otomatis setiap Terjadi Error (Supaya setiap Alert punya Unique ID)
    let id = UUID()
    // Object
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

// Macam-macam Alert
struct AlertContext {
    
    static let unableToFetchTotalStats = AlertItem(title: Text("Error World Total !"), message: Text("Server Doesn't Respond. \n Please Try Again Later."), dismissButton: .default(Text("OK")))
    
    static let unableToFetchCountryStats = AlertItem(title: Text("Error Country Data !"), message: Text("Unable to Receive Data from The Server. \n Please Try Again Later."), dismissButton: .default(Text("OK")))
    
    static let unableToFetchCountries = AlertItem(title: Text("Server Error !"), message: Text("Unable to Fetch List of Countries. \n Please Try Again Later."), dismissButton: .default(Text("OK")))

}
