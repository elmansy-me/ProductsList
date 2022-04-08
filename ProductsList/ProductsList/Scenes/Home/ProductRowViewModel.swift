//
//  ProductRowViewModel.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import Foundation
import SwiftUI

struct ProductRowViewModel: Identifiable {
    let item: ProductModel
    
    var id: String {
        return UUID().description
    }
    
    var name: String {
        return item.name
    }
    var price: String {
        return item.price
    }
    var imageURL: String {
        return item.image_urls_thumbnails.first ?? ""
    }
  
  init(item: ProductModel) {
    self.item = item
  }
}
