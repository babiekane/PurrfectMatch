//
//  User.swift
//  PurrfectMatch
//
//  Created by CatMeox on 8/9/2566 BE.
//

import SwiftUI

struct User: Identifiable, Hashable {
  var id = UUID().uuidString
  var name: String
  var dateOfBirth: Date
  var sex: String
  var breed: String
  var color: String
  var place: String
  var profilePicture: String
  var weight: Double
  var about: String
}

extension User {
  var displayWeight: String {
    "\(weight)kg"
  }
}

extension User {
  static var mockUsers: [User] {
    [
      User(name: "Antony", dateOfBirth: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 12), sex: "Male", breed: "Ragdoll", color: "Red", place: "Ratsada, Phuket", profilePicture: "Ragdoll1", weight: 4.7, about: "lorem"),
      User(name: "Yayoi", dateOfBirth: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 15), sex: "Male", breed: "British Short Hair", color: "Black", place: "Mueang, Phuket", profilePicture: "British2", weight: 4.7, about: "lorem"),
      User(name: "Smooth", dateOfBirth: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 25), sex: "Male", breed: "Ragdoll", color: "White", place: "Ratsada, Phuket", profilePicture: "Ragdoll3", weight: 4.7, about: "lorem"),
      User(name: "Zoro", dateOfBirth: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 32), sex: "Male", breed: "Scottish Fold", color: "Orange", place: "Mueang, Phuket", profilePicture: "ScottishFold", weight: 4.7, about: "lorem"),
      User(name: "Tororo", dateOfBirth: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 20), sex: "Male", breed: "Ragdoll", color: "White", place: "Thalang, Phuket", profilePicture: "Ragdoll4", weight: 4.5, about: "lorem"),
      User(name: "Bingsu", dateOfBirth: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 21), sex: "Male", breed: "British", color: "Orange", place: "Mueang, Phuket", profilePicture: "British3", weight: 4.7, about: "lorem"),
      User(name: "Satoru", dateOfBirth: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30 * 18), sex: "Male", breed: "Ragdoll", color: "Red", place: "Ratsada, Phuket", profilePicture: "Ragdoll5", weight: 4.7, about: "lorem"),
    ]
  }
}
