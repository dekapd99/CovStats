//
//  SearchBarView.swift
//  CovStats
//
//  Created by Deka Primatio on 13/06/22.
//

import SwiftUI

// Bar Form untuk Kolom Search
struct SearchBarView: View {
    
    @Binding var searchText: String // Binding dengan searchText
    
    var body: some View {
        HStack {
            TextField("Cari Negara...", text: $searchText)
                .foregroundColor(.white)
                .padding()
        }
        .frame(height: 50)
        .background(.regularMaterial)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant("")) // Kosongkan isi searchText
    }
}
