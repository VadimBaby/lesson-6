//
//  AuthAPI.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 07.08.2024.
//

import Foundation
import Moya
import Combine
import CombineMoya

final class AuthAPIService {
    private let provider = Provider<AuthEndpoint>()
}

extension AuthAPIService {
    func postToken() -> AnyPublisher<Token, MoyaError> {
        provider.requestPublisher(.postToken)
            .filterSuccessfulStatusCodes()
            .map(ServerToken.self)
            .map { TokenMapper().toLocal(serverEntity: $0) }
            .mapError({ error in
                print(error.errorUserInfo)
                return error
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
