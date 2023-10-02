//
//  TabbedItems.swift
//  PurrfectMatch
//
//  Created by CatMeox on 11/9/2566 BE.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case finding = 0
    case notification
    case chat
    case profile
    
    var title: String {
        switch self {
        case .finding:
            return "Explore"
        case .notification:
            return "Notifications"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: Image {
        switch self {
        case .finding:
            return Image(systemName: "pawprint")
        case .notification:
            return Image(systemName: "heart")
        case .chat:
            return Image(systemName: "ellipsis.bubble")
        case .profile:
            return Image(systemName: "person")
        }
    }
}
