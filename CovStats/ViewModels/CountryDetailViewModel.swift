//
//  CountryDetailViewModel.swift
//  CovStats
//
//  Created by Deka Primatio on 13/06/22.
//

import Foundation

// Fungsi Fetch Report berdasarkan Country (Kode iso)
final class CountryDetailViewModel: ObservableObject {
    
    @Published var reports: [RegionReport] = [] // Default Hasil Report Setiap Negara (masing-masing daerah)
    @Published var alertItem: AlertItem?        // Default Alert
    
    private var iso: String
    
    init(country: Country) {
        iso = country.iso // Load kode iso di Init
    }
    
    // Fungsi Fetch Report berdasarkan Negara (Kode iso)
    func fetchReport() {
        // Melakukan Fetch API di Main Thread secara async
        CovStatsAPI.shared.fetchReport(for: iso) { result in
            DispatchQueue.main.async {
                switch result {
                // Tampilkan Report berdasarkan Negara (Kode iso)
                case .success(let reports):
                    self.reports = reports
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchCountryStats
                }
            }
            
        }
    }
}
