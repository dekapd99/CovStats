//
//  MainViewModel.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation
import SwiftUI

// Fungsi Fetch Total Data dan Fetch All Countries
final class MainViewModel: ObservableObject {
    
    @Published var totalData = TotalData.dummyData  // Default Dummy Data dari Models TotalData
    @Published var allCountries: [Country] = []     // Default Country Empty Array
    @Published var searchText = ""                  // Default search text = Empty
    @Published var isSearchVisible = false          // Default Toggle Search Form
    @Published var alertItem: AlertItem?            // Default Alert
    
    init() {
        fetchTotalData()    // Fetch Total Data di Init
        fetchAllCountries() // Fetch All Countries di Init
    }
    
    // Fungsi Fetch Total Data
    func fetchTotalData() {
        // Melakukan Fetch API di Main Thread secara async
        CovStatsAPI.shared.fetchTotalData { result in
            DispatchQueue.main.async {
                switch result {
                // Tampilkan seluruh totalData dari API (termasuk yang terbaru)
                case .success(let totalData):
                    self.totalData = totalData
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchTotalStats
                }
            }
        }
    }
    
    // Fungsi Fetch Seluruh Data Negara
    func fetchAllCountries() {
        // Melakukan Fetch API di Main Thread secara async
        CovStatsAPI.shared.fetchAllRegions { result in
            DispatchQueue.main.async {
                switch result {
                // Tampilkan seluruh negara
                case .success(let allCountries):
                    // Logic sort (Bandingkan seluruh nama negara, apakah nama negara tersebut lebih dulu secara alfabet? Kemudian lakukan sort)
                    self.allCountries = allCountries.sorted(by: { $0.name < $1.name })
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchCountries
                }
            }
        }
    }
}
