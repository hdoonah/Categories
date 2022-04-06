//
//  ContentView.swift
//  Hewaya
//
//  Created by HUDA ALSHAMMARI on 18/06/1443 AH.
//

import SwiftUI

struct SearchBar: View {
    @State private var search: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text ("what you looking for ?")
                .font(.title)
                .fontWeight(.bold)
                .padding(.leading)
            
//            SearchAndFilterView(search: $search)
            
            Categories()
            
            Spacer()
        }
        .padding()
    }
}

//Search Bar
struct SearchAndFilterView: View {
    @Binding var search: String
    
    var body: some View {
        HStack (spacing: 16){
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $search)
            }
            .padding()
            .background (.regularMaterial)
            .cornerRadius(8.0)
            
            Image(systemName: "slider.horizontal.3")
                .padding()
                .background (.regularMaterial)
                .cornerRadius(8.0)
        }
        .padding(.horizontal,-12)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}

