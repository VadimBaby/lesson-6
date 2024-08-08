//
//  Optional.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 07.08.2024.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String { self ?? "" }
}
