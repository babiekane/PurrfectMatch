//
//  SignUpView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 3/10/2566 BE.
//

import SwiftUI

struct SignUpView: View {
  @ObservedObject var viewModel: AuthViewModel = AuthViewModel()
  
  var body: some View {
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      GeometryReader { geo in
        VStack {
          Text("Sign up")
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
              .keyboardType(.emailAddress)
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
            //TODO: create account
          } label: {
            Text("Create account")
              .font(.custom("Fredoka", size: 20))
              .fontWeight(.medium)
              .foregroundColor(Color("White"))
              .frame(width: geo.size.width / 2, height: 60)
              .background(Color("Lilac"))
              .clipShape(Capsule())
          }
          .padding(.bottom, 36)
          
          Text("Or sign up with")
            .font(.custom("Fredoka", size: 16))
            .foregroundColor(Color("Black"))
          
          HStack(spacing: 12) {
            Button {
              //TODO: sign up with apple
            } label: {
              Image("Applelogo")
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(RoundedRectangle(cornerRadius: 5))
          }
            
            Button {
              //TODO: sign up with gmail
            } label: {
              Image("Googlelogo")
                .resizable()
                .frame(width: 38, height: 38)
            }
          }
          .padding(.bottom, 36)
          
          HStack {
            Text("Already have an account?")
              .font(.custom("Fredoka", size: 16))
              .foregroundColor(Color("Black"))
            
            Button {
              viewModel.selectSignIn()
            } label: {
              Text("Sign in")
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

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
