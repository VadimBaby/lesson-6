//
//  Combiner.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 08.08.2024.
//

import Foundation
import Combine

class Combiner {
    var cancellables: Set<AnyCancellable> = .init()
    
    func printErrors<T: Error>(_ publisher: AnyPublisher<T, Never>) {
        publisher
            .sink { print($0) }
            .store(in: &cancellables)
    }
    
    func cancelAllCancellables() {
        cancellables.forEach{ $0.cancel() }
        cancellables.removeAll()
    }
}
