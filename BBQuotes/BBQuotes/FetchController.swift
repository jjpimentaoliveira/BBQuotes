//
//  FetchController.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import Foundation

struct FetchController {
    enum NetworkError: Error {
        case badURL
        case badResponse
    }

    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")

    func fetchQuote(from show: String) async throws -> Quote {
        let quoteURL = baseURL?.appending(path: "quotes/random")
        guard let quoteURL else {
            throw NetworkError.badURL
        }
        var quoteComponents = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)
        let queryItem = URLQueryItem(name: "production", value: show.replacingOccurrences(of: " ", with: "+"))

        quoteComponents?.queryItems = [queryItem]

        guard let fetchURL = quoteComponents?.url else {
            throw NetworkError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        guard 
            let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            throw NetworkError.badResponse
        }

        let quote = try JSONDecoder().decode(Quote.self, from: data)
        return quote
    }
}
