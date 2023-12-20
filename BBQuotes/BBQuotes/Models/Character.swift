//
//  Character.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
}
