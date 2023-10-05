//
//  TabbarView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 7/9/2566 BE.
//

import SwiftUI

struct MainTabView: View {
  @State var selectedTab = 0
  
  var body: some View {
    ZStack (alignment: .bottom) {
      TabView (selection: $selectedTab) {
        FindingView()
          .tag(0)
        
        NotificationView()
          .tag(1)
        
        ChatListView()
          .tag(2)
        
        ProfileView(user: User.mockUsers[0], viewModel: ProfileViewModel())
          .tag(3)
      }
      
      ZStack {
          HStack {
              ForEach((TabbedItems.allCases), id: \.self) { item in
                Button {
                  withAnimation(.spring()) {
                    selectedTab = item.rawValue
                  }
                  } label: {
                      CustomTabItem(image: item.icon, title: item.title, isActive: (selectedTab == item.rawValue))
                  }
              }
          }
          .padding(6)
      }
      .frame(height: 70)
      .background(Color("White"))
      .cornerRadius(35)
      .padding(.horizontal, 26)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}

extension MainTabView {
  func CustomTabItem(image: Image, title: String, isActive: Bool) -> some View {
    HStack(spacing: 10) {
      
      Spacer()
      
      image
        .resizable()
        .renderingMode(.template)
        .foregroundColor(isActive ? Color("Black") : Color("Black50"))
        .frame(width: 20, height: 20)
      if isActive {
        Text(title)
          .font(.system(size: 14))
          .foregroundColor(isActive ? .black : .gray)
      }
      
      Spacer()
    }
    .frame(width: isActive ? .infinity : 60, height: 60)
    .background(isActive ? Color("Lilac").opacity(0.4) : .clear)
    .cornerRadius(30)
  }
}
