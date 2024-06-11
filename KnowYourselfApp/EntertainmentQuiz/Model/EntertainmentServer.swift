//
//  EntertainmentServer.swift
//  KnowYourselfApp
//
//  Created by SeongKook on 6/11/24.
//

import Foundation
import Combine

class EntertainmentServer {
    func fetchActorData() -> AnyPublisher<[EntertainmentModel], Error> {
        guard let url = URL(string: "https://socrates-api.vercel.app/socrates") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [EntertainmentModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
