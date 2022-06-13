//
//  MainView.swift
//  CovStats
//
//  Created by Deka Primatio on 11/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .top) {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("Total Kasus di Dunia")
                        .font(.title2 .bold())
                        .padding(10)
                    
                    TotalDataView(totalData: viewModel.totalData)
                    
                    if viewModel.isSearchVisible {
                        SearchBarView(searchText: $viewModel.searchText)
                    }
                    
                    Text("Pilih Negara")
                        .font(.title2 .bold())
                        .padding(10)
                    
                    List {
                        Section {
                            ForEach(viewModel.allCountries.filter {
                                viewModel.searchText.isEmpty ? true : $0.name.lowercased().contains(viewModel.searchText.lowercased())
                            }, id: \.iso) { country in
                                
                                NavigationLink(destination: CountryDetailView(viewModel: CountryDetailViewModel(country: country))) {
                                    Text(country.name)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Data Covid-19")
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            })
            .toolbar {
                Button {
                    // Toggle Search Bar
                    viewModel.isSearchVisible.toggle()
                    // Cek apakah search bar sedang sembunyi atau tidak?
                    if !viewModel.isSearchVisible {
                        viewModel.searchText = ""
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .tint(.black)
            }
        }
        .accentColor(.primary)
        
//            // MARK: Test Console (uncomment Test -> JSON GET DATA DI APIService)
//            // Uncomment salah satu fungsi fetch di APIService
//            // dan Uncomment salah satu result onAppear
//            .onAppear{
//                APIService.shared.fetchTotalData{ result in }
//                APIService.shared.fetchAllRegions{ result in }
//                APIService.shared.fetchReport(for: "BGR") { result in
//                    switch result {
//                    case .success(let region):
//                        print(region.count)
//                        print(region.first!.formattedDate)
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//                }
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
