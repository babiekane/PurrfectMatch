//
//  NotificationView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 11/9/2566 BE.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
      GeometryReader { geometry in
        VStack {
          Text("Notification View")
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .background(.red)
      }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
