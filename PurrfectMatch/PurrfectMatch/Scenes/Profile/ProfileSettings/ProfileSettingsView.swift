//
//  ProfileFormView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 21/9/2566 BE.
//

import SwiftUI

struct ProfileSettingsView: View {
  @ObservedObject var viewModel: ProfileSettingsViewModel
  var user: User
  
  var body: some View {
    GeometryReader { geo in
      VStack(spacing: 20) {
        Text("Pet Profile 🐾")
          .font(.custom("Fredoka", size: 24))
          .fontWeight(.medium)
          .foregroundColor(Color("Black"))
        
        Button {
          //imagepicker
        } label: {
          HStack {
            Text("Profile picture")
              .font(.custom("Fredoka", size: 16))
              .foregroundColor(Color("Black"))
            
            Spacer()
            
            Image(user.profilePicture)
              .resizable()
              .scaledToFill()
              .frame(width: 70, height: 70)
              .clipShape(Circle())
            Image(systemName: "chevron.right")
              .font(.callout)
              .foregroundColor(Color("Black50"))
          }}
        .padding(20)
        .background(Color("White"))
        .cornerRadius(20)
        .padding(.horizontal, 20)
        
        VStack(spacing: 20) {
          Group {
            Button {
              viewModel.selectNameForm()
            } label: {
              HStack {
                Text("Name")
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black"))
                
                Spacer()
                
                Text(user.name)
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black50"))
                
                Image(systemName: "chevron.right")
                  .font(.callout)
                  .foregroundColor(Color("Black50"))
              }}
            .padding(.top, 10)
            
            Rectangle()
              .frame(width: geo.size.width - 80, height: 1)
              .foregroundColor(Color("Black50").opacity(0.1))
          }
          
          Group {
            Button {
              viewModel.selectGenderForm()
            } label: {
              HStack {
                Text("Gender")
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black"))
                
                Spacer()
                
                Text(user.sex)
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black50"))
                
                Image(systemName: "chevron.right")
                  .font(.callout)
                  .foregroundColor(Color("Black50"))
                //            Picker("", selection: $viewModel.selectedSex) {
                //              ForEach(viewModel.sex, id: \.self) {
                //                Text($0)
                //              }
                //            }
              }
          }
          
          Rectangle()
            .frame(width: geo.size.width - 80, height: 1)
            .foregroundColor(Color("Black50").opacity(0.1))
          }
          
          Group {
            Button {
              //todo
            } label: {
              HStack {
                Text("Breed")
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black"))
                
                //            Picker("", selection: $viewModel.selectedBreed) {
                //              ForEach(viewModel.breeds, id: \.self) {
                //                Text($0)
                //              }
                //            }
                
                Spacer()
                
                Text(user.breed)
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black50"))
                
                Image(systemName: "chevron.right")
                  .font(.callout)
                  .foregroundColor(Color("Black50"))
              }
          }
          
          Rectangle()
            .frame(width: geo.size.width - 80, height: 1)
            .foregroundColor(Color("Black50").opacity(0.1))
          }
          
          Group {
            Button {
              //todo
            } label: {
              HStack {
                Text("Colors")
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black"))
                
                Spacer()
                
                Text(user.color)
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black50"))
                
                Image(systemName: "chevron.right")
                  .font(.callout)
                  .foregroundColor(Color("Black50"))
              }
          }
          
          Rectangle()
            .frame(width: geo.size.width - 80, height: 1)
            .foregroundColor(Color("Black50").opacity(0.1))
          }
          
          Group {
            Button {
              //todo
            } label: {
              HStack {
                Text("Age")
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black"))
                
                //            DatePicker("", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                //              .datePickerStyle(.automatic)
                Spacer()
                
                Text(user.displayAge)
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black50"))
                
                Image(systemName: "chevron.right")
                  .font(.callout)
                  .foregroundColor(Color("Black50"))
              }
            }
          
          Rectangle()
            .frame(width: geo.size.width - 80, height: 1)
            .foregroundColor(Color("Black50").opacity(0.1))
          }
          
          Group {
            Button {
              //todo
            } label: {
              HStack {
                Text("Weight")
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black"))
                
                //            DatePicker("", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                //              .datePickerStyle(.automatic)
                Spacer()
                
                Text(user.displayWeight)
                  .font(.custom("Fredoka", size: 16))
                  .foregroundColor(Color("Black50"))
                
                Image(systemName: "chevron.right")
                  .font(.callout)
                  .foregroundColor(Color("Black50"))
              }}
          .padding(.bottom, 10)
          }
        }
        .padding(20)
        .frame(width: geo.size.width - 40)
        .background(Color("White"))
        .cornerRadius(20)
        .padding(.horizontal, 20)
        
        VStack(alignment: .leading, spacing: 8) {
          Text("About")
          Text(user.about)
            .font(.custom("Fredoka", size: 16))
            .foregroundColor(Color("Black50"))
        }
        .padding(20)
        .frame(width: geo.size.width - 40)
        .background(Color("White"))
        .cornerRadius(20)
        .padding(.horizontal, 20)
      }
    }
  }
}

struct ProfileSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileSettingsView(viewModel: ProfileSettingsViewModel(), user: User.mockUsers[0])
  }
}
