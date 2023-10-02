//
//  CardView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 8/9/2566 BE.
//

import SwiftUI

struct CardView: View {
  @EnvironmentObject var viewModel: FindingViewModel
  var user: User
  @State private var offset = CGSize.zero
  
  var body: some View {
      VStack(spacing: 20) {
        ZStack {
          Image(user.profilePicture)
            .resizable()
            .scaledToFill()
            .frame(width: 370, height: 575)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            
          VStack {
            Spacer()
            
            VStack(alignment: .leading) {
              Text("\(user.name), ")
                .font(.custom("Fredoka", size: 20))
                .foregroundColor(Color("Black"))
              + Text(user.displayAge)
                .font(.custom("Fredoka", size: 20))
                .foregroundColor(Color("Black"))
              Text(user.breed)
                .font(.custom("Fredoka", size: 16))
                .foregroundColor(Color("Black50"))
              HStack(spacing: 4) {
                Image(systemName: "mappin.and.ellipse")
                Text(user.place)
                  .font(.custom("Fredoka", size: 14))
                  .foregroundColor(Color("Black80"))
              }
            }
            .padding(.leading, 30)
            .frame(width: 270, height: 89, alignment: .leading)
            .background(Color("White").opacity(0.8).blur(radius: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.bottom, 20)
          }
        }
        .frame(width: 370, height: 575)
        .offset(x: offset.width, y: offset.height * 0.1)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
          DragGesture()
            .onChanged { gesture in
              offset = gesture.translation
            }
            .onEnded { _ in
              swipeCard(width: offset.width)
            }
        )
        
        HStack(spacing: 35) {
          Button {
            dislikeButtonPressed()
          } label: {
            Image(systemName: "xmark")
              .font(.title)
              .foregroundColor(Color("Peach"))
              .padding(16)
              .background(Color("Black"))
              .clipShape(Circle())
          }
          
          Button {
            likeButtonPressed()
          } label: {
            Image(systemName: "heart.fill")
              .font(.title)
              .foregroundColor(Color("Pinky"))
              .padding(16)
              .background(Color("Lavender"))
              .clipShape(Circle())
          }
        }
      }
  }
  
  func swipeCard(width: CGFloat) {
    switch width {
    case -500...(-150):
      print("\(user) removed")
      withAnimation {
        offset = CGSize(width: -500, height: 0)
      }
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        viewModel.dislike(user: user)
      }
      
    case 150...500:
      print("\(user) added")
      withAnimation {
        offset = CGSize(width: 500, height: 0)
      }
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        viewModel.like(user: user)
      }
      
    default:
      offset = .zero
    }
  }
  
  func likeButtonPressed() {
    withAnimation {
      offset = CGSize(width: 500, height: 0)
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      viewModel.like(user: user)
    }
  }
  
  func dislikeButtonPressed() {
    withAnimation {
      offset = CGSize(width: -500, height: 0)
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      viewModel.dislike(user: user)
    }
  }
}

extension User {
  var displayAge: String {
    let calendar = Calendar.current
    
    let ageComponents = calendar.dateComponents([.year, .month, .day], from: dateOfBirth, to: .now)
    
    var age = ""
    
    if let year = ageComponents.year, year > 0 {
      age += "\(year)y"
    }
    
    if let month = ageComponents.month, month > 0 {
      if !age.isEmpty {
        age += " \(month)m"
      } else {
        age += "\(month)m"
      }
    }
    
    if let day = ageComponents.day, day > 0, age.isEmpty {
      age += "\(day)d"
    }
    
    return age
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(user: User.mockUsers[0])
      .environmentObject(FindingViewModel())
  }
}
