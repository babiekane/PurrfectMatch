//
//  NameView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 26/9/2566 BE.
//

import SwiftUI

struct NameView: View {
  @ObservedObject var viewModel = ProfileViewModel()
  var body: some View {
    GeometryReader { geo in
      VStack(alignment: .leading, spacing: 40) {
        Button {
          // todo
        } label: {
          Image(systemName: "chevron.left")
            .font(.title2)
            .foregroundColor(Color("Black"))
        }
        
        Text("Pet name")
          .font(.custom("Fredoka", size: 24))
          .fontWeight(.medium)
          .foregroundColor(Color("Black"))
          .padding(.top, 30)
        
        TextField("Enter your pet name", text: $viewModel.name)
          .font(.custom("Fredoka", size: 18))
          .foregroundColor(Color("Black"))
          .padding()
          .frame(width: geo.size.width - 40)
          .background(Color("Black50").opacity(0.1))
          .clipShape(Capsule())
        
        Spacer()
        
        Button {
          //todo
        } label: {
          Text("Save")
            .font(.custom("Fredoka", size: 20))
            .foregroundColor(Color("White"))
            .frame(width: geo.size.width - 40, height: 50)
            .background(Color("Lilac"))
            .clipShape(Capsule())
        }
      }
      .frame(maxWidth: geo.size.width)
    }
  }
}

struct NameView_Previews: PreviewProvider {
  static var previews: some View {
    NameView(viewModel: ProfileViewModel())
  }
}
