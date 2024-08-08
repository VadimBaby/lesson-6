//
//  ContentViewModel.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 07.08.2024.
//

import Foundation
import Combine
import CombineExt
import Moya

final class ContentViewModel: ObservableObject, Combiner {
    
    let input: Input
    @Published var output: Output
    
    private let authService = AuthAPIService()
    
    var cancellables: Set<AnyCancellable> = .init()
    
    init() {
        self.input = Input()
        self.output = Output()
        
        bind()
    }
}

private extension ContentViewModel {
    func bind() {
        let request = input.onAppear
            .first()
            .filter { UserStorage.shared.token == nil }
            .map { [unowned self] in
                self.authService.postToken().materialize()
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()
        
        request
            .values()
            .print()
            .sink {
                UserStorage.shared.token = $0.accessToken
            }
            .store(in: &self.cancellables)
        
        printErrors(request.failures())
    }
}

extension ContentViewModel {
    struct Input {
        let onAppear = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        
    }
}
