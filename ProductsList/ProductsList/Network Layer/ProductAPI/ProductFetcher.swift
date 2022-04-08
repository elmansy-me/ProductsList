//
//  ProductFetcher.swift
//  ProductsList
//
//  Created by Ahmed Elmansy on 08/04/2022.
//

import Foundation
import Combine

protocol ProductsFetchable {
    func allProcucts() -> AnyPublisher<ProductsResponse, ProductsError>
}

class ProductsFetcher {
    private let session: URLSession
  
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - ProductsFetcher
extension ProductsFetcher: ProductsFetchable {
  
    func allProcucts() -> AnyPublisher<ProductsResponse, ProductsError> {
        return fetch(with: makeProductsComponents())
    }

    private func fetch<T>(with components: URLComponents) -> AnyPublisher<T, ProductsError> where T: Decodable {
        guard let url = components.url else {
            let error = ProductsError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(description: error.localizedDescription)
            }
      .flatMap(maxPublishers: .max(1)) { pair in
          decode(pair.data)
      }
      .eraseToAnyPublisher()
    }
}

// MARK: - ProductsFetcherAPI
private extension ProductsFetcher {
    struct ProductsAPI {
        static let scheme = "https"
        static let host = "ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
        static let path = "/default/dynamodb-writer"
    }

  
    func makeProductsComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = ProductsAPI.scheme
        components.host = ProductsAPI.host
        components.path = ProductsAPI.path
        return components
    }
}

