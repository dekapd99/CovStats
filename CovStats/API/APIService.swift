//
//  APIService.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

// API Communication: Fetch Data dari Endpoints (total, regions, provinces, dan Total Report), Decode JSON
// https://rapidapi.com/axisbits-axisbits-default/api/covid-19-statistics/

class APIService {
    
    static let shared = APIService() // instance -> agar APIService bisa digunakan di dalam project ini
    
    private init() {} // Initialized -> agar tidak bisa initialize diluar API Class kecuali menggunakan shared diatas
    
    // Code Snippets dari rapidapi.com -> Pisahkan Headers agar nantinya bisa dipake berulang
    private let headers = [
        "X-RapidAPI-Key": "ca7bdbae87msh34b22a93b02f86cp1284cbjsn687c7adb1b1f", // Replace API Key dengan punyamu
        "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com"
    ]
    
    // base URL untuk Endpoint (biar nanti tinggal ammend aja)
    private let baseURLString = "https://covid-19-statistics.p.rapidapi.com"
    
    // MARK: Fungsi Fetch Total Data
    // Fetch Data dari Endpoint Total Reports
    // Modifikasi Code Snippets dari rapidapi.com -> Kosongkan kolom Date pada Optional Parameter
    func fetchTotalData(completion: @escaping (Result<TotalData, Error>) -> Void) {
        
        let totalURLString = baseURLString + "/reports/total" // base URL untuk Total Report
        
        let url = URL(string: totalURLString) // convert totalURLString menjadi string ke dalam bentuk URL
        
        // Cek apakah sukses convert totalURLString menjadi string ke dalam bentuk URL ?
        // Kalo gagal tampilkan Custom Error: CovidError.incorrectURL dan Stop Programnya
        guard let url = url else {
            completion(.failure(CovidError.incorrectURL))
            return
        }
        
        // Swift Mutable Object
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET" // http method
        request.allHTTPHeaderFields = headers // passing header dari atas
        
        let session = URLSession.shared // URL Session

        // Data Task -> ketika kita request URL Session, ini akan mendapatkan 3 parameter yaitu data, response, dan error
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            // kalo error, callback Custom Error: CovidError.noDataReceived
            if error != nil {
                completion(.failure(CovidError.noDataReceived))
            } else {
                // JSONDecoder ->
                let decoder = JSONDecoder()
                
                // Do & Catch -> Convert JSON data yang didapat dari API menjadi total data object
                do {
                    let totalDataObject = try decoder.decode(TotalDataObject.self, from: data!)
                    completion(.success(totalDataObject.data)) // return total data
                } catch let error {
                    completion(.failure(error))
                }
                
//                // MARK: Test -> JSON GET DATA TOTAL REPORT
//                // Test Hasil Get Data di Console ketika aplikasi di Build & Run
//                // kalo gak error, Received Data via JSONSerialization sebagai String
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                    print(json)
//                }
            }
        })

        dataTask.resume()
    }
    
    // MARK: Fungsi Fetch Regions
    // Fetch Data dari Endpoint Regions
    // Modifikasi Code Snippets dari rapidapi.com
    func fetchAllRegions(completion: @escaping (Result<[Country], Error>) -> Void) {
        
        let countriesURLString = baseURLString + "/regions" // base URL untuk Regions
        
        let url = URL(string: countriesURLString) // convert countriesURLString menjadi string ke dalam bentuk URL
        
        // Cek apakah sukses convert totalURLString menjadi string ke dalam bentuk URL ?
        // Kalo gagal tampilkan Custom Error: CovidError.incorrectURL dan Stop Programnya
        guard let url = url else {
            completion(.failure(CovidError.incorrectURL))
            return
        }
        
        // Swift Mutable Object
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET" // http method
        request.allHTTPHeaderFields = headers // passing header dari atas
        
        let session = URLSession.shared // URL Session

        // Data Task -> ketika kita request URL Session, ini akan mendapatkan 3 parameter yaitu data, response, dan error
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            // kalo error, callback Custom Error: CovidError.noDataReceived
            if error != nil {
                completion(.failure(CovidError.noDataReceived))
            } else {
                // JSONDecoder ->
                let decoder = JSONDecoder()

                // Do & Catch -> Convert JSON data yang didapat dari API menjadi total data object
                do {
                    let allCountries = try decoder.decode(AllRegions.self, from: data!)
                    completion(.success(allCountries.data)) // return total data
                } catch let error {
                    completion(.failure(error))
                }
                
//                // MARK: Test -> JSON GET DATA REGIONS
//                // Test Hasil Get Data di Console ketika aplikasi di Build & Run
//                // kalo gak error, Received Data via JSONSerialization sebagai String
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                    print(json)
//                }
            }
        })

        dataTask.resume()
    }
    
    // MARK: Fungsi Fetch Report
    // Fetch Data dari Endpoint Reports dengan data kode negara (iso)
    // Modifikasi Code Snippets dari rapidapi.com
    func fetchReport(for iso: String, completion: @escaping (Result<[RegionReport], Error>) -> Void) {
        
        let reportsURLString = baseURLString + "/reports?iso=\(iso)" // base URL untuk Reports dengan interpolation iso -> '\(iso)' yang berarti apapun kode negara (iso) report yang nanti dipanggil user
        
        let url = URL(string: reportsURLString) // convert countriesURLString menjadi string ke dalam bentuk URL
        
        // Cek apakah sukses convert totalURLString menjadi string ke dalam bentuk URL ?
        // Kalo gagal tampilkan Custom Error: CovidError.incorrectURL dan Stop Programnya
        guard let url = url else {
            completion(.failure(CovidError.incorrectURL))
            return
        }
        
        // Swift Mutable Object
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET" // http method
        request.allHTTPHeaderFields = headers // passing header dari atas
        
        let session = URLSession.shared // URL Session

        // Data Task -> ketika kita request URL Session, ini akan mendapatkan 3 parameter yaitu data, response, dan error
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            // kalo error, callback Custom Error: CovidError.noDataReceived
            if error != nil {
                completion(.failure(CovidError.noDataReceived))
            } else {
                // JSONDecoder ->
                let decoder = JSONDecoder()

                // Convert Date Format dari API (y-MM-dd) dengan Date Decoder menjadi Swift Native Date Object
                let formatter = DateFormatter()
                formatter.dateFormat = "y-MM-dd"
                decoder.dateDecodingStrategy = .formatted(formatter)
                
                // Do & Catch -> Convert JSON data yang didapat dari API menjadi total data object
                do {
                    let allReports = try decoder.decode(AllReports.self, from: data!)
                    completion(.success(allReports.data)) // return total data
                } catch let error {
                    completion(.failure(error))
                }
                
//                // MARK: Test -> JSON GET DATA REPORTS
//                // Test Hasil Get Data di Console ketika aplikasi di Build & Run
//                // kalo gak error, Received Data via JSONSerialization sebagai String
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                    print(json)
//                }
            }
        })

        dataTask.resume()
    }
}
