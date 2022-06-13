//
//  CustomError.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import Foundation

// Error Provider (Customized): 2 Error Case untuk Incorrect URL dan No Data Received
enum CovidError: Error {
    case incorrectURL, noDataReceived
}
