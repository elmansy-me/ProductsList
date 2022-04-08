//
//  HomeViewModel.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var dataSource: [ProductRowViewModel] = []
    private var isLoaded: Bool = false
    
    private let productsFetcher: ProductsFetcher
    private var disposables = Set<AnyCancellable>()

  
    init(productsFetcher: ProductsFetcher,
         scheduler: DispatchQueue = DispatchQueue(label: "HomeViewModel")){
        self.productsFetcher = productsFetcher
        fetchProducts()
    }
    
    func refresh(){
        guard !isLoading, isLoaded else{return}
        isLoaded = false
        fetchProducts()
    }

    private func fetchProducts() {
        guard !isLoading, !isLoaded else{return}
        
        self.isLoading = true
        
        productsFetcher.allProcucts()
            .map { response in
                response.results.map(ProductRowViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    self.isLoading = false
                    self.isLoaded = true
                    switch value {
                    case .failure:
                        self.dataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] receivedValue in
                    guard let self = self else { return }
                    self.dataSource = receivedValue
                })
            .store(in: &disposables)
    }

}
