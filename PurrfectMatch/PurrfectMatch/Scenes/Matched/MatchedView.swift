//
//  MatchedView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

struct MatchedView: View {
  var body: some View {
    GeometryReader { geo in
      ZStack {
        Image("Background")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
        
        VStack(spacing: 40) {
          Text("Purrfect match!!!")
            .font(.custom("Fredoka", size: 36))
            .fontWeight(.medium)
            .foregroundColor(Color("Pinky"))
          
          ZStack {
            HStack {
              Image("Ragdoll2")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width / 2 , height: geo.size.height / 3)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .rotationEffect(.degrees(-5))
                .offset(x: 30, y: -50)
              
              Image("Ragdoll3")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width / 2 , height: geo.size.height / 3)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .rotationEffect(.degrees(5))
                .offset(x: -30, y: 50)
            }
          }
          .frame(width: geo.size.width, height: geo.size.height / 2)
          
          
          Text("It's a furry-tale ending! Your pet match story begins now.")
            .multilineTextAlignment(.center)
            .font(.custom("Fredoka", size: 18))
            .foregroundColor(Color("Black80"))
            .frame(width: geo.size.width / 1.2, alignment: .center)
            .padding(.bottom, 20)
          
          HStack {
            Button {
              //TODO: back to prev view
            } label: {
              Text("Later")
                .font(.custom("Fredoka", size: 20))
                .fontWeight(.medium)
                .foregroundColor(Color("Lilac"))
                .frame(width: geo.size.width / 2 - 20, height: 50)
                .background(Color("White"))
                .clipShape(Capsule())
                .overlay(
                  Capsule()
                    .stroke(Color("Lilac"), lineWidth: 1)
                )
            }
            
            Button {
              //TODO: go to chat chanel
            } label: {
              Text("Say \"Meowing!\" ")
                .font(.custom("Fredoka", size: 20))
                .fontWeight(.medium)
                .foregroundColor(Color("White"))
                .frame(width: geo.size.width / 2 - 20, height: 50)
                .background(Color("Lilac"))
                .clipShape(Capsule())
            }
          }
        }
      }
      .frame(width: geo.size.width, height: geo.size.height)
    }
  }
}

struct MatchedView_Previews: PreviewProvider {
  static var previews: some View {
    MatchedView()
  }
}
