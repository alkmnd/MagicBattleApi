//
//  File.swift
//  
//
//  Created by belova natasha on 09.01.2024.
//

import Foundation
import Vapor

enum UserError {
  case usernameTaken
}

extension UserError: AbortError {
  var description: String {
    reason
  }

  var status: HTTPResponseStatus {
    switch self {
    case .usernameTaken: return .conflict
    }
  }

  var reason: String {
    switch self {
    case .usernameTaken: return "Username already taken"
    }
  }
}
