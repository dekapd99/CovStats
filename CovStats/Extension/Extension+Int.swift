//
//  Extension+Int.swift
//  CovStats
//
//  Created by Deka Primatio on 13/06/22.
//

import Foundation

// Custom Extension untuk Format Penulisan Angka (Data Kasus)

extension Int {
    // Format Pemisah Angka dengan "." -> "1.000.000"
    var formatNumber: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
    // Format Penyingkatan Angka Khusus Digit Jutaan -> 1.1 Juta, 5.2 juta, dst
    var roundedWithAbbreviations: String {
        let number = Double(self)
        // di Swift penulisan boleh 1.000.000 / 1_000_000 / 1,000,000 artinya sama saja dengan 1000000 ini hanya untuk mempermudah pembacaan code saja
        let million = number / 1_000_000
        if million >= 1.0 {
            return "\(round(million * 10) / 10) Juta"
        } else {
            return "\(self.formatNumber)"
        }
    }
}
