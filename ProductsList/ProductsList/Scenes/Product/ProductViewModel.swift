//
//  ProductViewModel.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import Foundation
import SwiftUI

struct ProductViewModel: Identifiable {
    private let item: ProductModel
    
    var id: String {
        return UUID().description
    }
    
    var name: String {
        return item.name
    }
    var price: String {
        return item.price
    }
    var images: [String] {
        return item.image_urls
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let splitted = item.created_at.split(separator: " ").first, let date = dateFormatter.date(from: String(splitted)) {
            dateFormatter.dateStyle = .long
            return dateFormatter.string(from: date)
        }
        
        return item.created_at
    }
  
  
    init(item: ProductModel) {
        self.item = item
    }
}
