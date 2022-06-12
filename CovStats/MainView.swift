//
//  MainView.swift
//  CovStats
//
//  Created by Deka Primatio on 11/06/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .top) {
                LinearGradient(colors: [
                    Color(red: 2.47, green: 1.86, blue: 0.51),
                    Color(red: 2.52, green: 0.74, blue: 0.26)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("World Total")
                        .font(.title2 .bold())
                        .padding(10)
                    
                    TotalDataView(totalData: viewModel.totalData)
                    
                    Text("All Countries")
                        .font(.title2 .bold())
                        .padding(10)
                    
                    List {
                        Section {
                            ForEach(viewModel.allCountries, id: \.iso) { country in
                                Text(country.name)
                                
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Statistics")
            .toolbar {
                Button {
                    print("Show Search")
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .tint(.black)
            }
            .accentColor(.white)
        }
        
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
        MainView()
    }
}
