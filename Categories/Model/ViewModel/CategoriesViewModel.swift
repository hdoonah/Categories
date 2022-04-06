//
//  CategoriesViewModel.swift
//  Hewaya
//
//  Created by HUDA ALSHAMMARI on 18/06/1443 AH.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var catigoriType: CategoriType = .All
    
    
    // Sample Products...
    @Published var services: [Services] = [
        Services(type: .Handmade, name: "Macramé Art", image: "handmade1", tittel: "Yara Barros",rate: 4),
        Services(type: .Handmade, name: "Handmade Candle", image: "handmade2", tittel: "Sara Saad",rate: 3),
        Services(type: .Handmade, name: "Pottery Bowl", image: "handmade3", tittel: "Jaen Yousuf",rate: 3),
        Services(type: .Handmade, name: "Necklaces", image: "handmade4", tittel: "Jude Ahmed",rate: 4),
        Services(type: .Handmade, name: "Leather Craft", image: "handmade5", tittel: "Rana Salem",rate: 4),
        Services(type: .Handmade, name: "Fleece Blanket", image: "handmade6", tittel: "Talal Fahad",rate: 3),
        Services(type: .Handmade, name: "Fleece Blanket", image: "handmade7", tittel: "Lana Fahad",rate: 2),
        Services(type: .Handmade, name: "Fleece Blanket", image: "handmade8", tittel: "Noura Fahad",rate: 1),
        Services(type: .Design , name: "Design", image: "design1", tittel: "Farah Ahmed",rate: 5),
        Services(type: .Design, name: "Design", image: "design2", tittel: "Ali Khaled",rate: 4),
        Services(type: .Design, name: "Design", image: "design3", tittel: "Mona Nasser",rate: 3),
        Services(type: .Design, name: "Design", image: "design4", tittel: "Saad Fahad",rate: 3),
        Services(type: .Painting , name: "Painting", image: "painting1", tittel: "Mohammad Ali",rate: 5),
        Services(type: .Painting, name: "Painting", image: "painting2", tittel: "Omar Fayez",rate: 4),
        Services(type: .Painting, name: "Painting", image: "painting3", tittel: "Noura Ahmed",rate: 3),
        Services(type: .Painting , name: "Painting", image: "painting4", tittel: "Faisal Saad",rate: 5),
        Services(type: .Musical , name: "musical1", image: "painting1", tittel: "Saleh Mohammad",rate: 5),
        Services(type: .Musical, name: "musical2", image: "painting2", tittel: "Dina Ahmad",rate: 4),
        Services(type: .Education, name: "Painting", image: "education1", tittel: "Farah Ahmed",rate: 3),
        Services(type: .Education, name: "Painting", image: "education2", tittel: "Noura Fahad",rate: 3)
    ]
    
    
    
    
    
    // Filtered Products.
    @Published var filteredServices: [Services] = []
    
    init() {
        filterServicesByType()
    }
    func filterServicesByType() {
        // Filtering Product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.services
            
                .lazy
                .filter { service in
                    return service.type == self.catigoriType
                }
            //             Limiting result.
                .prefix(50)
            
            DispatchQueue.main.async {
                let results = self.services
                    .filter { service in
                        if self.catigoriType == .All {
                            return true
                        }else{
                            return service.type == self.catigoriType
                        }
                    }
                self.filteredServices = results.compactMap({ service in
                    return service
                })
                
            }
            
        }
        
    }
    
}

