//
//  WelcomeView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

struct WelcomeView: View {
  
  @ObservedObject var viewModel: WelcomeViewModel
  
  var body: some View {
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      GeometryReader { geo in
        VStack {
          Image("Twokittys")
            .resizable()
            .frame(width: 350, height: 350)
          
          Text("Find your furry soulmate with just a swipe")
            .font(.custom("Fredoka", size: 18))
            .foregroundColor(Color("Black"))
            .padding(.bottom, 36)
          
          Button {
            viewModel.pressSignup()
          } label: {
            Text("Get started!")
              .font(.custom("Fredoka", size: 20))
              .fontWeight(.medium)
              .foregroundColor(Color("White"))
              .frame(width: geo.size.width / 2, height: 60)
              .background(Color("Lilac"))
              .clipShape(Capsule())
          }
        }
        .frame(width: geo.size.width, height: geo.size.height)
      }
    }
  }
}

#Preview {
  WelcomeView(viewModel: WelcomeViewModel())
}
