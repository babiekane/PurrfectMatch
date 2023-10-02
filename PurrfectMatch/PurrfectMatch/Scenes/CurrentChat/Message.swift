//
//  Message.swift
//  PurrfectMatch
//
//  Created by CatMeox on 14/9/2566 BE.
//

import Foundation

struct Message: Identifiable, Codable {
  var id: String
  var text: String
  var received: Bool
  var timestamp: Date
}
