//
//  UserLoader.swift
//  PurrfectMatch
//
//  Created by CatMeox on 20/9/2566 BE.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class UserLoader {
  
//  func loadUsers() async throws -> [User] {
//
//  }
  
  func loadUser(id: String) async throws -> User {
    let db = Firestore.firestore()
    
    let document = try await db.collection("users").document(id).getDocument()
    
    guard let data = document.data() else {
      throw InvalidDataError()
    }
    
    let name = (data["name"] as? String) ?? ""
    let sex = (data["sex"] as? String) ?? ""
    let breed = (data["breed"] as? String) ?? ""
    let birthdate = (data["birthdate"] as? Timestamp)?.dateValue() ?? Date()
    let color = (data["color"] as? String) ?? ""
    let about = (data["about"] as? String) ?? ""
    let weight = (data["weight"] as? Double) ?? 0.0
    
    let location = data["location"] as? GeoPoint
    let latitude = location?.latitude ?? 0.0
    let longitude = location?.longitude ?? 0.0
    
    return User(name: name, dateOfBirth: birthdate, sex: sex, breed: breed, color: color, place: "Ratsada, Phuket", profilePicture: "Regdoll1", weight: weight, about: about)
  }
  
  struct InvalidDataError: Error {}
}
