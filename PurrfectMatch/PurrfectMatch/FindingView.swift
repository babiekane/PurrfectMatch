//
//  FindingView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

struct FindingView: View {
  
  @StateObject var viewModel: FindingViewModel = FindingViewModel()
  
  var body: some View {
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      VStack(spacing: 30) {
        HStack {
          Button {
            //TODO: re fetching data
          } label: {
            Image(systemName: "arrow.triangle.2.circlepath")
              .font(.title)
              .foregroundColor(Color("Lilac"))
          }
          
          Spacer()
          
          Text("Do you like me?")
            .font(.custom("Fredoka", size: 28))
            .fontWeight(.medium)
            .foregroundColor(Color("Pinky"))
          
          Spacer()
          
          Button {
            //TODO: make filter (subscriber member only)
          } label: {
            Image(systemName: "slider.horizontal.3")
              .font(.title)
              .foregroundColor(Color("Lilac"))
          }
        }
        
        ZStack {
          if let users = viewModel.displayingUsers {
            if users.isEmpty {
              Text("Come back later we can find more matches for you!")
                .font(.custom("Fredoka", size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("Black50"))
                .frame(width: 370, height: 655)
            } else {
              ForEach(users.reversed()) { user in
                CardView(user: user)
                  .environmentObject(viewModel)
              }
            }
          } else {
            ProgressView()
          }
        }
        
        Spacer()
      }
      .padding(.horizontal, 30)
      .padding(.top, 83)
    }
  }
}

struct FindingView_Previews: PreviewProvider {
  static var previews: some View {
    FindingView()
  }
}
