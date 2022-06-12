//
//  MainViewModel.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation
import SwiftUI

// Fetch Total Data, Regions, Report
final class MainViewModel: ObservableObject {
    
    @Published var totalData = TotalData.dummyData  // Default Dummy Data dari Models TotalData
    @Published var allCountries: [Country] = []     // Default Country Empty Array
    @Published var searchText = ""                  // Default search text = Empty
    @Published var isSearchVisible = false          // Default Toggle Search Form
//    @Published var alertItem: AlertItem?            // Default Alert
    
    init() {
        fetchTotalData()
        fetchAllCountries()
    }
    
    // Fungsi Fetch Total Data
    func fetchTotalData() {
        APIService.shared.fetchTotalData { result in
            
            DispatchQueue.main.sync {
                switch result {
                // Tampilkan seluruh totalData dari API (termasuk yang terbaru)
                case .success(let totalData):
                    self.totalData = totalData
                case .failure(_):
                    print("error total data")
                    //TODO: BUAT ALERT ITEM
                }
            }
        }
    }
    
    // Fungsi Fetch Seluruh Negara
    func fetchAllCountries() {
        APIService.shared.fetchAllRegions { result in
            
            DispatchQueue.main.sync {
                switch result {
                // Tampilkan seluruh negara
                case .success(let allCountries):
                    // Logic sort (Bandingkan seluruh nama negara, apakah nama negara tersebut lebih dulu secara alfabet? Kemudian lakukan sort)
                    self.allCountries = allCountries.sorted(by: { $0.name < $1.name })
                case .failure(_):
                    print("error total data")
                    //TODO: BUAT ALERT ITEM
                }
            }
        }
    }
}
