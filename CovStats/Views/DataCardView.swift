//
//  DataCardView.swift
//  CovStats
//
//  Created by Deka Primatio on 12/06/22.
//

import SwiftUI

// Default Card Wrapper untuk Masing-masing Data (TotalDataView)
struct DataCardView: View {
    
    // Default value ketika tidak fetch apapun
    var number: String = "---"
    var name: String = "Error"
    var color: Color = .primary
    
    // Responsive Display / Layar dengan GeometryReader
    var body: some View {
        GeometryReader { geomerty in
            VStack(spacing: 10) {
                Text(self.number)
                    .font(.subheadline)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .font(.subheadline)
                    .foregroundColor(self.color)
            }
            // Frame menyesuaikan dengan ukuran layar
            .frame(width: geomerty.size.width, height: 80, alignment: .center)
            .background(Color("cardBackground"))
            .cornerRadius(10.0)
        }
    }
}

struct DataCardView_Previews: PreviewProvider {
    static var previews: some View {
        DataCardView()
    }
}
