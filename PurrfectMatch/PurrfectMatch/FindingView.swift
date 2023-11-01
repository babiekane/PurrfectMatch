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
    GeometryReader { geo in
      ZStack {
        Image("Background")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
          .frame(width: geo.size.width, height: geo.size.height)
        
        VStack(spacing: 20) {
          HStack {
            Text("PurrfectMatch")
              .font(.custom("Fredoka", size: 28))
              .fontWeight(.medium)
              .foregroundColor(Color("Pinky"))
            
            Spacer()
            
            Button {
              //TODO: re fetching data
            } label: {
              Image(systemName: "arrow.triangle.2.circlepath")
                .font(.title)
                .foregroundColor(Color("Lilac"))
            }
            
            Button {
              //TODO: make filter (subscriber member only)
            } label: {
              Image(systemName: "slider.horizontal.3")
                .font(.title)
                .foregroundColor(Color("Lilac"))
            }
          }
          .frame(width: geo.size.width - 30)
          
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
        }
        .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
      }
    }
  }
}

struct FindingView_Previews: PreviewProvider {
  static var previews: some View {
    FindingView()
  }
}
