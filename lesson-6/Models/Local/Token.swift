//
//  Token.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 07.08.2024.
//

import Foundation

struct Token: Decodable {
    let accessToken: String
    let tokenType: String
}
