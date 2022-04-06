//
//  Data.swift
//  Hewaya
//
//  Created by HUDA ALSHAMMARI on 18/06/1443 AH.
//


import Foundation
struct Services: Identifiable {
var id = UUID().uuidString
var type: CategoriType
var name: String
var image: String
var tittel: String
var rate: Int

#if DEBUG
    static let example = Services (type: .Handmade, name: "Handmade Reem",image: "handmade1", tittel: "SomeHandmade",rate: 4)
#endif
}

// Categori Types...
enum CategoriType: String, CaseIterable{
case All = "All"
case Handmade = "Handmade"
case Painting = "Painting"
case Musical = "Musical"
case Design = "Design"
case Education = "Education"
}
