//
//  ProductView.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import SwiftUI

struct ProductView: View {
    
    private let viewModel: ProductViewModel

    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geometryProxy in
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(0..<viewModel.images.count){
                            AsyncImage(url: URL(string: viewModel.images[$0])) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(
                                width: geometryProxy.size.width,
                                height: 200,
                                alignment: .center
                            )
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Product:")
                            .bold()
                        Text(viewModel.name)
                            .fontWeight(.thin)
                    }
                    HStack{
                        Text("Price:")
                            .bold()
                        Text(viewModel.price)
                            .fontWeight(.thin)
                    }
                    HStack{
                        Text("Date:")
                            .bold()
                        Text(viewModel.date)
//                        Text(Date(), style: .date)
                            .fontWeight(.thin)
                    }
                }.padding()
            }
        }
        
        
        
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
