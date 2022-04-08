//
//  Product.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import Foundation

class ProductModel: ObservableObject,Codable, Identifiable {
    @Published var id = UUID()
    @Published var name: String = ""
    @Published var price: String = ""
    @Published var image_urls:[String] = []
    @Published var image_urls_thumbnails:[String] = []
    @Published var created_at:String = ""

    enum CodingKeys: CodingKey {
        case name, price, image_urls, image_urls_thumbnails, created_at
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(price, forKey: .price)
        try container.encode(image_urls, forKey: .image_urls)
        try container.encode(image_urls_thumbnails, forKey: .image_urls_thumbnails)
        try container.encode(created_at, forKey: .created_at)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(String.self, forKey: .price)
        image_urls = try container.decode([String].self, forKey: .image_urls)
        image_urls_thumbnails = try container.decode([String].self, forKey: .image_urls_thumbnails)
        created_at = try container.decode(String.self, forKey: .created_at)
    }

}
