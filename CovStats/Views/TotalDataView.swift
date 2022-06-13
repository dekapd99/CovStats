//
//  TotalDataView.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import SwiftUI

// Layout 4 DataCardView untuk Tampilan Masing-masing Data Kasus Covid-19
struct TotalDataView: View {
    
    var totalData: TotalData // Get total data
    
    var body: some View {
        VStack {
            HStack {
                DataCardView(number: totalData.confirmed.formatNumber, name: "Total Kasus")
                DataCardView(number: totalData.active.formatNumber, name: "Kasus Aktif", color: .green)
            }
            HStack {
                DataCardView(number: totalData.deaths.formatNumber, name: "Kematian", color: .red)
                DataCardView(number: String(format: "%.2f", totalData.fatality_rate), name: "Tingkat Kematian %", color: .red)
            }
        }
        .frame(height: 170)
        .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: TotalData.dummyData)
    }
}
