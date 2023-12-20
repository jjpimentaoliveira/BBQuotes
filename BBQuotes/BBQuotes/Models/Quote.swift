//
//  Quote.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}
