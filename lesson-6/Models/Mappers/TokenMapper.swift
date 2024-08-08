//
//  TokenMapper.swift
//  lesson-6
//
//  Created by Вадим Мартыненко on 07.08.2024.
//

import Foundation

final class TokenMapper: BaseModelMapper<ServerToken, Token> {
    override func toLocal(serverEntity: ServerToken) -> Token {
        .init(
            accessToken: serverEntity.accessToken.orEmpty,
            tokenType: serverEntity.tokenType.orEmpty
        )
    }
}
