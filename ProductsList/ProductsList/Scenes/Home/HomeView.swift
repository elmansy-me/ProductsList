//
//  HomeView.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
  
    var body: some View {
        
        NavigationView{
            
            if $viewModel.isLoading.wrappedValue{
                loadingSection
            }else if viewModel.dataSource.isEmpty{
                emptySection
            }else{
                productsView
                    .navigationTitle("Products")
            }
        }
        
    }
}

private extension HomeView {
    
  var productsView: some View {
      List{
          ForEach(viewModel.dataSource) { product in
              NavigationLink(destination: ProductView(viewModel: ProductViewModel(item: product.item))) {
                    ProductRow(viewModel: product)
                }
            }
      }
  }

  var emptySection: some View {
      VStack(alignment: .center, spacing: 12) {
          Text("Oops ...")
              .foregroundColor(.black)
              .fontWeight(.bold)
          Text("No products available right now. Please check again later.")
              .foregroundColor(.gray)
              .fontWeight(.regular)
          Button("Refresh") {
              self.viewModel.refresh()
          }.cornerRadius(8)
    }
      .padding()
      .background(.gray.opacity(0.3))
      .cornerRadius(8)
  }
    
    var loadingSection: some View {
        ProgressView("Loading ...")
            .foregroundColor(.black)
            .padding()
            .background(.gray.opacity(0.3))
            .cornerRadius(8)
    }
}
