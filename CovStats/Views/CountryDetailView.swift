//
//  CountryDetailView.swift
//  CovStats
//
//  Created by Deka Primatio on 13/06/22.
//

import SwiftUI

// Tampilan Halaman Provinsi ketika Salah Satu Negara dipilih (jika ada maka ditampilkan)
struct CountryDetailView: View {
    
    // Country Detail diambil dari hasil Country yang dipilih terhadap VM
    @ObservedObject var viewModel: CountryDetailViewModel
    
    var body: some View {
        VStack {
            // Tampilkan Provinsi ketika Salah Satu Negara dipilih (jika ada maka ditampilkan)
            if viewModel.reports.count > 1 {
                List {
                    ForEach(viewModel.reports) { report in
                        NavigationLink(destination: ReportView(report: report)) {
                            Text(report.region.province)
                        }
                    }
                }
                .listStyle(.plain)
                // Default title error unknown country
                .navigationTitle(viewModel.reports.first?.region.name ?? "Unknown Country")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                // Default dummyData RegionReport
                ReportView(report: viewModel.reports.first ?? RegionReport.dummyData)
                    .ignoresSafeArea()
            }
        }
        // Dismiss button untuk AlertItem
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear{
            // Jika Reports belum Fetch data apapun maka lakukan Fetching sekali saja
            if viewModel.reports.count == 0 {
                viewModel.fetchReport()
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(viewModel: CountryDetailViewModel(country: Country.dummyData))
    }
}
