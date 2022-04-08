//
//  ProductsError.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import Foundation

enum ProductsError: Error {
    case parsing(description: String)
    case network(description: String)
}
