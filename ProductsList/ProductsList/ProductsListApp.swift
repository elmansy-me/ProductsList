//
//  ProductsListApp.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import SwiftUI

@main
struct ProductsListApp: App {
    var body: some Scene {
        WindowGroup {
            let fetcher = ProductsFetcher()
            let viewModel = HomeViewModel(productsFetcher: fetcher)
            let homeView = HomeView(viewModel: viewModel)
            homeView
        }
    }
}
