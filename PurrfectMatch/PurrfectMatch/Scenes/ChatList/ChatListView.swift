//
//  ChatListView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

struct ChatListView: View {
  @StateObject var viewModel: FindingViewModel = FindingViewModel()
  @State var search: String = ""
  
  var body: some View {
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      VStack(alignment: .leading, spacing: 0) {
        TextField("\(Image(systemName: "magnifyingglass")) Search", text: $search)
          .padding(12)
          .padding(.leading, 12)
          .background(Color("Lilac").opacity(0.2))
          .clipShape(Capsule())
          .padding(.top, 80)
          .padding(.bottom, 30)
        
        VStack(spacing: 0) {
          ScrollView(.vertical, showsIndicators: false) {
            if let users = viewModel.displayingUsers {
              ForEach(users) { user in
                Button {
                  //TODO: go to selected chat
                } label: {
                  HStack(alignment: .center, spacing: 20) {
                    Image(user.profilePicture)
                      .resizable()
                      .scaledToFill()
                      .frame(width: 70, height: 70)
                      .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 6) {
                      Text(user.name)
                        .font(.custom("Fredoka", size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(Color("Black"))
                      Text("Messages")
                        .font(.custom("Fredoka", size: 14))
                        .foregroundColor(Color("Black50"))
                    }
                    
                    Spacer()
                    
                    Text("time")
                      .font(.custom("Fredoka", size: 12))
                      .foregroundColor(Color("Black30"))
                  }
                  .padding(.bottom, 30)
                }
              }
            }
          }
        }
      }
      .padding(.horizontal, 30)
    }
  }
}

struct ChatListView_Previews: PreviewProvider {
  static var previews: some View {
    ChatListView()
  }
}
