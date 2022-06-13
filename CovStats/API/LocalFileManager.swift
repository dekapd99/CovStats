//
//  LocalFileManager.swift
//  CovStats
//
//  Created by Deka Primatio on 13/06/22.
//

import Foundation

// Class LocalFileManager (Store & Save, Fetch from Saved, dan Helper) Data Countries
// Cara Kerja: kalo udah pernah save data secara lokal fungsi ini tinggal minta datanya lagi, kalo belom pernah fetch dari Network API dan simpan secara lokal
final class LocalFileManager {
    
    static let shared = LocalFileManager()
    
    private init() {}
    
    // Fungsi Store & Save Data secara Lokal
    func saveCountriesLocally(countryData: Data?) {
        // Passing data yang didapatkan dari API
        if let countryData = countryData {
            // Convert data menjadi JSON dengan String(Any Key Value)
            if let json = try? JSONSerialization.jsonObject(with: countryData, options: []) as? [String: Any]{
                // Get Dokumen Directory dan simpan ke dalam file country.json
                do {
                    let fileURL = getDocumentDirectory().appendingPathComponent("country.json")
                    // Try saving ke Directory tersebut
                    try JSONSerialization.data(withJSONObject: json).write(to: fileURL)
                } catch {
                    print(error.localizedDescription) // Tampilkan Error jika gagal menyimpan
                }
            }
        }
    }
    
    // Fungsi Fetch Data kembali dari Lokal
    func fetchLocalCountries() -> Data? {
        // Get Dokumen Directory dari json yang telah tersimpan di dalam file country.json
        do {
            let fileURL = getDocumentDirectory().appendingPathComponent("country.json")
            let data = try Data(contentsOf: fileURL) // ambil konten yang tersimpan dari fileURL
            return data
        } catch {
            print(error.localizedDescription)
            return nil // Jangan fetch apapun jika belum ada data / konten yang tersimpan
        }
    }
    
    // Fungsi Helper -> Menyimpan ke Storage iOS (Automatically Provided by our iOS Application)
    private func getDocumentDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
