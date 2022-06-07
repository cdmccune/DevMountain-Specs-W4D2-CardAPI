//
//  CardError.swift
//  Deck Of One Card
//
//  Created by Curt McCune on 6/7/22.
//

import Foundation

//enum CardError: String, Error {
//    case invalidURL = "Invalid URL"
//    case serverError =  "Server error"
//    case dataError =  "data Error"
//    case decodingError = "Decoding Error"
//}

enum CardError: LocalizedError {
  case invalidURL
  case thrownError(Error)
  case noData
  case unableToDecode

  // Give the user whatever information you think they should know. Feel free to write your own descriptions.
  var errorDescription: String? {
      switch self {
      case .invalidURL:
          return "Internal error. Please update Deck of One Card or contact support."
      case .thrownError(let error):
          return error.localizedDescription
      case .noData:
          return "The server responded with no data."
      case .unableToDecode:
          return "The server responded with bad data."
      }
  }
}
