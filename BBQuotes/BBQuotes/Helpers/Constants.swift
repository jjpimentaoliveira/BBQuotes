//
//  Constants.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import Foundation

enum Constants {
    static let bbName = "Breaking Bad"
    static let bcsName = "Better Call Saul"
}

extension String {
    var replaceWhitespaceWithPlus: String {
        replacingOccurrences(of: " ", with: "+")
    }

    var noSpaces: String {
        replacingOccurrences(of: " ", with: "")
    }

    var lowerNoSpaces: String {
        noSpaces.lowercased()
    }
}
