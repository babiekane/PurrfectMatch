//
//  NotificationView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 11/9/2566 BE.
//

import SwiftUI

struct NotificationView: View {
  var body: some View {
    GeometryReader { geo in
      ZStack {
        Image("Background")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
          .frame(width: geo.size.width, height: geo.size.height)
        
        VStack(alignment: .leading, spacing: 20) {
          HStack {
            Spacer()
            
            Text("Notifications")
              .font(.custom("Fredoka", size: 24))
              .fontWeight(.medium)
              .foregroundColor(Color("Black"))
            
            Spacer()
          }
          
          HStack {
            ZStack {
              Image("Ragdoll1")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
              
              Image(systemName: "hand.thumbsup.fill")
                .font(.title2)
                .foregroundColor(Color("Lilac"))
                .frame(width: 70, height: 60, alignment: .bottomTrailing)
              
            }
            
            VStack(alignment: .leading, spacing: 4) {
              HStack(spacing: 0) {
                Button {
                  //TODO: enter profile who liked
                } label: {
                  Text("Tigger")
                    .font(.custom("Fredoka", size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
                }
                
                Text(" liked your profile.")
                  .font(.custom("Fredoka", size: 18))
                  .foregroundColor(Color("Black"))
              }
              Text("1 days ago")
                .font(.custom("Fredoka", size: 16))
                .foregroundColor(Color("Black50"))
            }
          }
          .padding(.horizontal, 20)
          
          HStack {
            ZStack {
              Image("Ragdoll4")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
              .clipShape(Circle())
              
              Image(systemName: "heart.fill")
                .font(.title2)
                .foregroundColor(Color("Pinky"))
                .frame(width: 70, height: 60, alignment: .bottomTrailing)
            }
            
            VStack(alignment: .leading, spacing: 4) {
              HStack(spacing: 0) {
                Button {
                  //TODO: enter profile who liked
                } label: {
                  Text("Dizel")
                    .font(.custom("Fredoka", size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
                }
                
                Text(" super liked your profile.")
                  .font(.custom("Fredoka", size: 18))
                  .foregroundColor(Color("Black"))
              }
              
              Text("1 days ago")
                .font(.custom("Fredoka", size: 16))
                .foregroundColor(Color("Black50"))
            }
          }
          .padding(.horizontal, 20)
        }
        .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
      }
    }
  }
}

struct NotificationView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationView()
  }
}
