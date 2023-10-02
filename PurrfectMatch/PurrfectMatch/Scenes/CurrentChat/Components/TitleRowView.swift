//
//  TitleRowView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 14/9/2566 BE.
//

import SwiftUI

struct TitleRowView: View {
  var user: User
  
  var body: some View {
    VStack {
      HStack(spacing: 0) {
        Button {
          //TODO
        } label: {
          Image(systemName: "chevron.left")
            .font(.title)
            .frame(width: 20, height: 20)
            .foregroundColor(Color("Lilac"))
        }
        
        Spacer()
        
        Image(user.profilePicture)
          .resizable()
          .scaledToFill()
          .frame(width: 70, height: 70)
          .clipShape(Circle())
        
        Spacer()
        
        Button {
          //TODO
        } label: {
          Image(systemName: "ellipsis")
            .rotationEffect(.degrees(-90))
            .font(.title)
            .frame(width: 20, height: 20)
            .foregroundColor(Color("Lilac"))
        }
      }
      .padding(.horizontal, 24)
      .padding(.top, 60)
      
      Text(user.name)
        .font(.custom("Fredoka", size: 20))
        .fontWeight(.medium)
        .foregroundColor(Color("Black"))
    }
  }
}

struct TitleRowView_Previews: PreviewProvider {
  static var previews: some View {
    TitleRowView(user: User.mockUsers[0])
  }
}
