//
//  InformationView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

struct InformationView: View {
  
  @ObservedObject var viewModel: InformationViewModel
  
  var body: some View {
    let user = viewModel.user
    
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      if let user = user {
        GeometryReader { geo in
          ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
              VStack {
                Image(user.profilePicture)
                  .resizable()
                  .scaledToFill()
                  .frame(width: geo.size.width, height: geo.size.height / 2)
                .cornerRadius(40)
              }
              
              VStack {
                Text(user.name)
                  .font(.custom("Fredoka", size: 24))
                  .fontWeight(.medium)
                  .foregroundColor(Color("Black"))
                Label(user.place, systemImage: "mappin.and.ellipse")
                  .font(.custom("Fredoka", size: 18))
                  .foregroundColor(Color("Black"))
              }
              
              VStack {
                HStack(spacing: 8) {
                  VStack {
                    Text("Breed")
                      .font(.custom("Fredoka", size: 14))
                      .foregroundColor(Color("Black50"))
                    Text(user.breed)
                      .font(.custom("Fredoka", size: 16))
                      .fontWeight(.medium)
                      .foregroundColor(Color("Black"))
                  }
                  .frame(width: geo.size.width / 2 - 6, height: 60)
                  .background(Color("Lilac").opacity(0.2))
                  .cornerRadius(10)
                  
                  VStack {
                    Text("Color")
                      .font(.custom("Fredoka", size: 14))
                      .foregroundColor(Color("Black50"))
                    Text(user.color)
                      .font(.custom("Fredoka", size: 16))
                      .fontWeight(.medium)
                      .foregroundColor(Color("Black"))
                  }
                  .frame(width: geo.size.width / 2 - 6, height: 60)
                  .background(Color("Lilac").opacity(0.2))
                  .cornerRadius(10)
                }
                
                HStack(spacing: 8) {
                  VStack {
                    Text("Age")
                      .font(.custom("Fredoka", size: 14))
                      .foregroundColor(Color("Black50"))
                    Text(user.displayAge)
                      .font(.custom("Fredoka", size: 16))
                      .fontWeight(.medium)
                      .foregroundColor(Color("Black"))
                  }
                  .frame(width: geo.size.width / 3 - 6, height: 60)
                  .background(Color("Lilac").opacity(0.2))
                  .cornerRadius(10)
                  
                  VStack {
                    Text("Sex")
                      .font(.custom("Fredoka", size: 14))
                      .foregroundColor(Color("Black50"))
                    Text(user.sex)
                      .font(.custom("Fredoka", size: 16))
                      .fontWeight(.medium)
                      .foregroundColor(Color("Black"))
                  }
                  .frame(width: geo.size.width / 3 - 6, height: 60)
                  .background(Color("Lilac").opacity(0.2))
                  .cornerRadius(10)
                  
                  VStack {
                    Text("Weight")
                      .font(.custom("Fredoka", size: 14))
                      .foregroundColor(Color("Black50"))
                    Text(user.displayWeight)
                      .font(.custom("Fredoka", size: 16))
                      .fontWeight(.medium)
                      .foregroundColor(Color("Black"))
                  }
                  .frame(width: geo.size.width / 3 - 6, height: 60)
                  .background(Color("Lilac").opacity(0.2))
                  .cornerRadius(10)
                }
              }
              
              VStack(spacing: 4) {
                HStack {
                  Text("About")
                    .font(.custom("Fredoka", size: 18))
                    .fontWeight(.medium)
                  .foregroundColor(Color("Black"))
                  
                  Spacer()
                }
                ScrollView(showsIndicators: false) {
                  Text(user.about)
                    .font(.custom("Fredoka", size: 16))
                    .foregroundColor(Color("Black"))
                    .padding(20)
                    .background(Color("White").opacity(0.5))
                    .cornerRadius(10)
                }
              }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .padding(.vertical, 20)
          }
        }
        .padding(.horizontal, 24)
      } else if viewModel.isLoading {
        // ...
      } else {
        // ...
      }
    }
    .task {
      await viewModel.fetchUser()
    }
  }
}
 
struct InformationView_Previews: PreviewProvider {
  static var previews: some View {
    InformationView(viewModel: InformationViewModel())
  }
}
