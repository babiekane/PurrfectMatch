//
//  ProfileView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

struct ProfileView: View {
  
  var user: User
  
  @ObservedObject var viewModel: ProfileViewModel
  
  var body: some View {
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      GeometryReader { geo in
        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            
            HStack {
              Spacer()
              
              Button {
                viewModel.selectMenu()
              } label: {
                Image(systemName: "line.3.horizontal")
                  .font(.title)
                  .foregroundColor(Color("Lilac"))
              }
            }
            .padding(.trailing, 20)
            
            Image(user.profilePicture)
              .resizable()
              .scaledToFill()
              .frame(width: 120, height: 120)
              .clipShape(Circle())
            
            
            VStack {
              Text(user.name)
                .font(.custom("Fredoka", size: 28))
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
                .frame(width: geo.size.width / 2 - 6 - 20, height: 60)
                .background(Color("Lilac").opacity(0.2))
                .cornerRadius(10)
                
                VStack {
                  Text("Color")
                    .font(.custom("Fredoka", size: 14))
                    .foregroundColor(Color("Black50"))
                  Text("Bi-color")
                    .font(.custom("Fredoka", size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
                }
                .frame(width: geo.size.width / 2 - 6 - 20, height: 60)
                .background(Color("Lilac").opacity(0.2))
                .cornerRadius(10)
              }
              
              HStack(spacing: 8) {
                VStack {
                  Text("Age")
                    .font(.custom("Fredoka", size: 14))
                    .foregroundColor(Color("Black50"))
                  Text("1y 4m")
                    .font(.custom("Fredoka", size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
                }
                .frame(width: geo.size.width / 3 - 6 - 14, height: 60)
                .background(Color("Lilac").opacity(0.2))
                .cornerRadius(10)
                
                VStack {
                  Text("Gender")
                    .font(.custom("Fredoka", size: 14))
                    .foregroundColor(Color("Black50"))
                  Text("Female")
                    .font(.custom("Fredoka", size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
                }
                .frame(width: geo.size.width / 3 - 6 - 14, height: 60)
                .background(Color("Lilac").opacity(0.2))
                .cornerRadius(10)
                
                VStack {
                  Text("Weight")
                    .font(.custom("Fredoka", size: 14))
                    .foregroundColor(Color("Black50"))
                  Text("4.5kg")
                    .font(.custom("Fredoka", size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
                }
                .frame(width: geo.size.width / 3 - 6 - 14, height: 60)
                .background(Color("Lilac").opacity(0.2))
                .cornerRadius(10)
              }
            }
            
            VStack(spacing: 8) {
              HStack {
                Text("Gallery")
                  .font(.custom("Fredoka", size: 20))
                  .fontWeight(.medium)
                  .foregroundColor(Color("Black"))
                
                Spacer()
              }
              .padding(.leading, 20)
              
              HStack {
                ForEach(0..<3) { index in
                  Image("Ragdoll3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width / 3 - 20, height: 120)
                    .cornerRadius(12)
                }
              }
              
              Button {
                
              } label: {
                Text("See more")
                  .font(.custom("Fredoka", size: 14))
                  .fontWeight(.medium)
                  .foregroundColor(Color("Black"))
                  .frame(width: geo.size.width - 40, height: 32)
                  .background(Color("Lilac").opacity(0.8))
                  .cornerRadius(8)
              }
            }
            
            VStack(spacing: 2) {
              HStack {
                Text("About")
                  .font(.custom("Fredoka", size: 20))
                  .fontWeight(.medium)
                  .foregroundColor(Color("Black"))
                
                Spacer()
              }
              .padding(.leading, 20)
              
              ScrollView(showsIndicators: false) {
                Text("“ Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitatinostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ”")
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black"))
              }
              .padding(10)
              .frame(width: geo.size.width - 30, height: geo.size.height / 6)
            }
          }
          .padding(.top, 40)
        }
      }
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(user: User.mockUsers[0], viewModel: ProfileViewModel())
  }
}
