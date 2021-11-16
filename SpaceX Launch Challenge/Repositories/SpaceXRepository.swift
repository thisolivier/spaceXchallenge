//
//  SpaceXRepository.swift
//  SpaceX Launch Challenge
//
//  Created by Olivier Butler on 14/11/2021.
//

import Foundation
import Combine

protocol SpaceXRepositable {
    var allLaunches: AnyPublisher<LaunchResponse, SpaceXError> { get }
    var allRockets: AnyPublisher<RocketResponse, SpaceXError> { get }
    var companyInfo: AnyPublisher<CompanyResponse, SpaceXError> { get }
}

enum SpaceXError: Error {
    case badURL
    case network(String)
    case decoding(String)
}

class SpaceXRespository {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension SpaceXRespository: SpaceXRepositable {
    var allLaunches: AnyPublisher<LaunchResponse, SpaceXError> {
        makeRequest(with: launchesComponents)
    }

    var allRockets: AnyPublisher<RocketResponse, SpaceXError> {
        makeRequest(with: rocketsComponents)
    }

    var companyInfo: AnyPublisher<CompanyResponse, SpaceXError> {
        makeRequest(with: companyComponents)
    }

    private func makeRequest<T: Decodable>(with components: URLComponents) -> AnyPublisher<T, SpaceXError> {
        guard let url = components.url else {
            return Fail(error: SpaceXError.badURL).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: url)
            .mapError {
                return SpaceXError.network($0.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { response in
                self.decode(response.data)
            }
            .eraseToAnyPublisher()
    }
}

private extension SpaceXRespository {
    struct SpaceXAPI {
        static let scheme = "https"
        static let host = "api.spacexdata.com"
        static let pathLaunches = "/v5/launches"
        static let pathRockets = "/v4/rockets"
        static let pathCompany = "/v4/company"
    }

    var commonComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = SpaceXAPI.scheme
        urlComponents.host = SpaceXAPI.host
        return urlComponents
    }

    var launchesComponents: URLComponents {
        var components = commonComponents
        components.path = SpaceXAPI.pathLaunches
        return components
    }

    var rocketsComponents: URLComponents {
        var components = commonComponents
        components.path = SpaceXAPI.pathRockets
        return components
    }

    var companyComponents: URLComponents {
        var components = commonComponents
        components.path = SpaceXAPI.pathCompany
        return components
    }
}

private extension SpaceXRespository {

    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, SpaceXError> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError {
                SpaceXError.decoding($0.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
