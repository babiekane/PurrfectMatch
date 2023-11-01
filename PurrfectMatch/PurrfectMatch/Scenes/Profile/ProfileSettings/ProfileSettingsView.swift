//
//  ProfileFormView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 21/9/2566 BE.
//

import SwiftUI

struct ProfileSettingsView: View {
  @ObservedObject var viewModel: ProfileSettingsViewModel
  @State var user: User
  @State var isEditing = false
  
  var body: some View {
    GeometryReader { geo in
      VStack(spacing: 20) {
        ZStack {
          HStack {
            Button {
              // todo
            } label: {
              Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(Color("Black"))
            }
            
            Spacer()
          }
          
          Text("Pet Profile")
            .font(.custom("Fredoka", size: 24))
            .fontWeight(.medium)
          .foregroundColor(Color("Black"))
        }
        .padding(.horizontal, 20)
        
        ScrollView(showsIndicators: false) {
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
                }
              }
              
              Rectangle()
                .frame(width: geo.size.width - 80, height: 1)
                .foregroundColor(Color("Black50").opacity(0.1))
            }
            
            Group {
              Button {
                viewModel.selectBreeds()
              } label: {
                HStack {
                  Text("Breed")
                    .font(.custom("Fredoka", size: 16))
                    .foregroundColor(Color("Black"))
                  
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
                viewModel.selectColorForm()
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
                viewModel.selectDatePicker()
              } label: {
                HStack {
                  Text("Age")
                    .font(.custom("Fredoka", size: 16))
                    .foregroundColor(Color("Black"))
                  
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
                viewModel.selectWeightPickerView()
              } label: {
                HStack {
                  Text("Weight")
                    .font(.custom("Fredoka", size: 16))
                    .foregroundColor(Color("Black"))
                  
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
          
          if !isEditing {
            VStack(alignment: .leading, spacing: 8) {
              HStack {
                Text("About")
                
                Spacer()
                
                Button {
                  isEditing = true
                } label: {
                  Image(systemName: "square.and.pencil")
                    .foregroundColor(Color("Black"))
                }
              }
              Text(user.about)
                .font(.custom("Fredoka", size: 16))
                .foregroundColor(Color("Black50"))
            }
            .padding(20)
            .frame(width: geo.size.width - 40)
            .background(Color("White"))
            .cornerRadius(20)
            .padding(.horizontal, 20)
          } else {
            VStack(alignment: .leading, spacing: 8) {
              HStack {
                Text("About")
                Spacer()
              }
              
              TextField("", text: $user.about)
                .padding(6)
                .font(.custom("Fredoka", size: 16))
                .foregroundColor(Color("Black50"))
                .background(Color("Black50").opacity(0.1))
                .padding(.bottom, 12)
              
              HStack(spacing: 12) {
                Spacer()
                
                Button {
                  //TODO
                } label: {
                  Text("Cancel")
                    .font(.custom("Fredoka", size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color("Black"))
                    .padding(6)
                    .background(Color("White"))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(
                      RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("Black"))
                    )
                }
                
                Button {
                  //TODO
                } label: {
                  Text("Update")
                    .font(.custom("Fredoka", size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color("White"))
                    .padding(6)
                    .background(Color("Lilac"))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(
                      RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("Lilac"))
                    )
                }
              }
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
  }
}

struct ProfileSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileSettingsView(viewModel: ProfileSettingsViewModel(), user: User.mockUsers[0])
  }
}
