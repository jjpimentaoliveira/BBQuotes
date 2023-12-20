//
//  Constants.swift
//  BBQuotes
//
//  Created by José João Pimenta Oliveira on 20/12/2023.
//

import Foundation

extension String {
    var replaceWhitespaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
