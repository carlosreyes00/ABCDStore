//
//  Store.swift
//  ABCDStore
//
//  Created by Carlos Rafael Reyes Magadán on 12/29/22.
//

import Foundation
import SwiftUI

enum Size: String, CaseIterable {
    case XS, S, M, L, XL, XXL
}

enum Gender: String, CaseIterable {    
    case Men, Women, Unisex
}

enum Category: String, CaseIterable {
    case shoes, bottom, top
}

struct Article: Identifiable {
    let id = UUID()
    let name: String
    let image: Image?
    let price: Double
    let size: Size
    let gender: Gender
    let category: Category
    var new = Int.random(in: 1...3) == 2
    
    init(name: String, image: Image?, price: Double, size: Size, gender: Gender, category: Category) {
        self.name = name
        self.image = image
        self.price = price
        self.size = size
        self.gender = gender
        self.category = category
    }
}

class Store: ObservableObject {
    @Published var inventory: [Article] = [
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt",image: nil, price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Women, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Men, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Women, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Women, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Men, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Women, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Women, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Men, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Women, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Women, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Men, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Women, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Women, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Men, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Women, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Women, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Men, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Women, category: .top),
        .init(name: "Blue navy jean new of pack, 0 kilometers, es elastizado, está tiza", image: Image("photo01"), price: 150.00, size: .XXL, gender: .Men, category: .bottom),
        .init(name: "Stripped T-Shirt", image: Image("photo02"), price: 249.45, size: .XL, gender: .Men, category: .top),
        .init(name: "Hoodie Gap USA Logo", image: Image("photo03"), price: 29.95, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Tommy Hilfiger light blue T-Shirt", image: Image("photo04"), price: 99.99, size: .XL, gender: .Unisex, category: .top),
        .init(name: "Tommy Hilfiger Enguatada blue navy", image: Image("photo05"), price: 39.99, size: .XL, gender: .Unisex, category: .top)
    ]
}
