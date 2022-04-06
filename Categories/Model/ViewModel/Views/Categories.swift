//
//  Categories.swift
//  Hewaya
//
//  Created by HUDA ALSHAMMARI on 18/06/1443 AH.
//

import SwiftUI

struct Categories: View {
    
    @Namespace var animation
    @State var search = ""
    @State var currentItem = ""
    @StateObject var homeData: HomeViewModel = HomeViewModel()
//    @EnvironmentObject var allViewModel:HomeViewModel

    let columns = [GridItem(.fixed (200)), GridItem(.flexible()),]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 8){
                
                //Show Categories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(CategoriType.allCases, id: \.self) { type in
                            // Product Type View.
                            CategoriTapeView(type: type)
                     
                        }
                    }
                    .padding( .top, 10)
                    .padding(.leading)
                }
                // Show Services
                ScrollView {
                    SearchAndFilterView(search:$search)
                        .padding()
                    
                   
                    LazyVGrid(columns: columns, spacing: 6) {
                        ForEach(homeData.filteredServices.filter({"\($0)"
                            .contains(search) || search.isEmpty})) { item in
                                
                                
                                ServicesCardview(service: item , Type: homeData.catigoriType.rawValue )
                                
                            }
                    }
                    
                    .padding(.horizontal,-22)

                }
            }
        }
        // Updating data whenever tab changes..
        .onChange (of: homeData.catigoriType) { newValue in
            homeData.filterServicesByType()
        }
    }
    // To show categories
    @ViewBuilder
    func CategoriTapeView(type: CategoriType) -> some View {
        Button {
            withAnimation {
                
                homeData.catigoriType = type
            }
        } label: {
            Text(type.rawValue)
                .font(.body)
                .fontWeight(.semibold)
            // Changing Color based on Current product Type...
                .foregroundColor(homeData.catigoriType == type ? Color.teal : Color.black)
                .padding(.bottom, 10)
            // Adding Indicator at bottom.
                .overlay(
                    // Adding Matched Geometry Effect..
                    ZStack {
                       
                         if homeData.catigoriType == type {
                            Capsule()
                                .fill (Color.teal)
                                .matchedGeometryEffect(id: "PRODUCTTAB", in:
                                                        animation)
                                .frame (height: 2)
                        }
                        
                        else {
                            Capsule()
                                .fill (Color.clear)
                                .frame (height: 2)
                        }
                    }
                        .padding(.horizontal,-5) ,alignment: .bottom
                )
        }
       
    }
    
    // To show services
    @ViewBuilder
    func ServicesCardview(service: Services , Type : String) -> some View {
        
        VStack {
        
            Image(service.image)
            VStack {
                Text(service.tittel)
                    .font( .body)
                Text(service.name)
                    .font (.footnote)
                    .foregroundColor(. secondary)
                HStack(spacing: 4) {
                    ForEach (1...5,id: \.self) {index in
                        Image(systemName: "star.fill")
                            .font(.system(size: 9.5))
                            .foregroundColor(service.rate >= index ? .yellow : Color.gray.opacity(0.6))
                    }
                }
            }
        }
        
        .padding(.horizontal)
        .padding(.bottom,22)
        .background(
            
            Color.white
                .cornerRadius(25)
            
        )
    }
    
    func AllCards (services : [Services])
    {
        for item in services
        {
            
            VStack {
                Image(item.image)
                VStack {
                    Text(item.tittel)
                        .font( .body)
                    Text(item.name)
                        .font (.footnote)
                        .foregroundColor(. secondary)
                    HStack(spacing: 4) {
                        ForEach (1...5,id: \.self) {index in
                            Image(systemName: "star.fill")
                                .font(.system(size: 9.5))
                                .foregroundColor(item.rate >= index ? .yellow : Color.gray.opacity(0.6))
                        }
                    }
                }
            }
            
            .padding(.horizontal)
            .padding(.bottom,22)
            .background(
                
                Color.white
                    .cornerRadius(25)
                
            )
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}


