//
//  SignInView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 3/10/2566 BE.
//

import SwiftUI

struct SignInView: View {
  @ObservedObject var viewModel: SignInViewModel
  
  var body: some View {
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      GeometryReader { geo in
        VStack {
          Text("Sign in")
            .font(.custom("Fredoka", size: 28))
            .fontWeight(.medium)
            .foregroundColor(Color("Black"))
            .padding(.bottom, 60)
          
          VStack(spacing: 8) {
            HStack {
              Text("Email")
                .font(.custom("Fredoka", size: 16))
                .foregroundColor(Color("Black80"))
                .padding(.leading, 36)
              
              Spacer()
            }
            
            TextField("", text: $viewModel.email)
              .padding()
              .font(.custom("Fredoka", size: 16))
              .fontWeight(.medium)
              .foregroundColor(Color("Black"))
              .frame(width: geo.size.width - 72, height: 50)
              .background(Color("White"))
              .clipShape(RoundedRectangle(cornerRadius: 30))
              .overlay(
                RoundedRectangle(cornerRadius: 30)
                  .stroke(Color("Lilac"))
              )
          }
          .padding(.bottom, 20)
          
          VStack(spacing: 8) {
            HStack {
              Text("Password")
                .font(.custom("Fredoka", size: 16))
                .foregroundColor(Color("Black80"))
                .padding(.leading, 36)
              
              Spacer()
            }
            
            HStack {
              Group {
                if viewModel.showPassword {
                  HStack {
                    TextField("", text: $viewModel.password)
                    Button(action: {
                      viewModel.showPassword.toggle()
                    }) {
                      Image(systemName: self.viewModel.showPassword ? "eye" : "eye.slash")
                        .accentColor(.gray)
                    }
                  }
                      .padding()
                      .font(.custom("Fredoka", size: 16))
                      .fontWeight(.medium)
                      .foregroundColor(Color("Black"))
                      .frame(width: geo.size.width - 72, height: 50)
                      .background(Color("White"))
                      .clipShape(RoundedRectangle(cornerRadius: 30))
                      .overlay(
                        RoundedRectangle(cornerRadius: 30)
                          .stroke(Color("Lilac"))
                    )
                  
                } else {
                  HStack {
                    SecureField("", text: $viewModel.password)
                    Button(action: {
                      viewModel.showPassword.toggle()
                    }) {
                      Image(systemName: self.viewModel.showPassword ? "eye" : "eye.slash")
                        .accentColor(.gray)
                    }
                  }
                      .padding()
                      .font(.custom("Fredoka", size: 16))
                      .fontWeight(.medium)
                      .foregroundColor(Color("Black"))
                      .frame(width: geo.size.width - 72, height: 50)
                      .background(Color("White"))
                      .clipShape(RoundedRectangle(cornerRadius: 30))
                      .overlay(
                        RoundedRectangle(cornerRadius: 30)
                          .stroke(Color("Lilac"))
                    )
                }
              }
            }
          }
          .padding(.bottom, 36)
          
          Button {
            //TODO: sign in
          } label: {
            Text("Sign in")
              .font(.custom("Fredoka", size: 20))
              .fontWeight(.medium)
              .foregroundColor(Color("White"))
              .frame(width: geo.size.width / 2, height: 60)
              .background(Color("Lilac"))
              .clipShape(Capsule())
          }
          .padding(.bottom, 36)
          
          HStack {
            Text("Don't have an account?")
              .font(.custom("Fredoka", size: 16))
              .foregroundColor(Color("Black"))
            
            Button {
              //TODO: go to sign in screen
            } label: {
              Text("Sign up")
                .font(.custom("Fredoka", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(Color("Lilac"))
            }
          }
        }
        .frame(width: geo.size.width, height: geo.size.height)
      }
    }
  }
}

#Preview {
  SignInView(viewModel: SignInViewModel())
}
