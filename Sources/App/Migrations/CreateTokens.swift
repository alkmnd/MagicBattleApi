//
//  CreateTokens.swift
//  
//
//  Created by belova natasha on 09.01.2024.
//

import Vapor
import Fluent

struct CreateTokens: AsyncMigration {
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("tokens").delete()
    }
    
    func prepare(on database: FluentKit.Database) async throws {
        let schema = database.schema("tokens")
            .id()
            .field("user_id", .uuid, .references("users", "id"))
            .field("value", .string, .required)
            .unique(on: "value")
            .field("source", .int, .required)
            .field("created_at", .datetime, .required)
            .field("expires_at", .datetime)

            try await schema.create()
    }
    
}
