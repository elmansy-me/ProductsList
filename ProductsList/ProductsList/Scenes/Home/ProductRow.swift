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
            BuildImage(withURL: viewModel.imageURL, width: 60, height: 60)
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

extension ProductRow{

    @ViewBuilder
    private func BuildImage(withURL url: String, width:CGFloat, height:CGFloat)->some View{
        
        CachedAsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }.frame(
            width: width,
            height: height,
            alignment: .center
          )
        .cornerRadius(8, antialiased: true)
    }
    
}
