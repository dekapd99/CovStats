//
//  ReportView.swift
//  CovStats
//
//  Created by Deka Primatio on 13/06/22.
//

import SwiftUI

// Tampilan Halaman Report untuk Negara atau untuk Negara per-bagian Provinsi
struct ReportView: View {
    
    var report: RegionReport // Get report from RegionReport
    
    var body: some View {
        ZStack(alignment: .top) { // Z-Stack Wrapper
            // Gradient Color
            LinearGradient(colors: [
                Color(red: 2.47, green: 1.86, blue: 0.51),
                Color(red: 2.52, green: 0.74, blue: 0.26)
            ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(report.region.name)
                    .font(.largeTitle)
                Text(report.region.province)
                    .font(.title2)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Tanggal: \(report.formattedDate)")
                    Text("Total Kasus: \(report.confirmed.roundedWithAbbreviations)")
                    Text("Kasus Aktif: \(report.active.roundedWithAbbreviations)")
                    Text("Kematian: \(report.deaths.roundedWithAbbreviations)")
                    Text("Tingkat Kematian: \(report.fatality_rate.formatted())%")
                }
                .font(.title2)
                .frame(maxWidth: .infinity)
                .padding(50)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
                Spacer()
                Spacer()
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(report: RegionReport.dummyData)
    }
}
