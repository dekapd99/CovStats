//
//  MainView.swift
//  CovStats
//
//  Created by Deka Primatio on 11/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        
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
