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
                imagesScrollView(data: viewModel.images,
                                 width: geometryProxy.size.width,
                                 height: 250)
                VStack(alignment: .leading, spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        Build(title: "Product", value: viewModel.name)
                    }
                    Divider()
                    BuildHStack(title: "Price", value: viewModel.price)
                    Divider()
                    BuildHStack(title: "Date", value: viewModel.date)
                }.padding()
            }
        }
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


extension ProductView{

    @ViewBuilder
    private func BuildHStack(title: String, value:String)->some View{
        HStack{
            Build(title: title, value: value)
        }
    }
    
    @ViewBuilder
    private func Build(title: String, value:String)->some View{
        Text(title + ":")
            .bold()
        Text(value)
            .fontWeight(.thin)
    }
    
    private func imagesScrollView(data:[String], width: CGFloat, height: CGFloat)->some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(0..<data.count){
                    AsyncImage(url: URL(string: data[$0])) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(
                        width: width,
                        height: height,
                        alignment: .center
                    )
                }
            }
        }
    }
    
}
