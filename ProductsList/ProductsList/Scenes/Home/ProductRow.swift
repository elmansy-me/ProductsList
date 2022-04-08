//
//  ProductRow.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import SwiftUI
import CachedAsyncImage

struct ProductRow: View {
    
    private let viewModel: ProductRowViewModel
    
    init(viewModel: ProductRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            CachedAsyncImage(url: URL(string: viewModel.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .transition(.scale(scale: 0.1, anchor: .center))
            } placeholder: {
                ProgressView()
            }.frame(
                width: 60,
                height: 60,
                alignment: .center
              )
            .cornerRadius(8, antialiased: true)
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Text(viewModel.price)
                    .font(.caption)
            }
        }
    }
}
