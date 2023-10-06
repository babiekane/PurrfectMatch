//
//  BreedsView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 26/9/2566 BE.
//

import SwiftUI

struct BreedsView: View {
  @ObservedObject var viewModel: ProfileViewModel
  @State private var searchText = ""
  
  var body: some View {
    List {
      ForEach(searchResults, id: \.self) { breed in
        Button {
          // TODO: Insert action here
          print(breed)
        } label: {
          Text(breed)
            .font(.custom("Fredoka", size: 18))
            .foregroundColor(Color("Black"))
        }
      }
      .listRowSeparator(.hidden, edges: .all)
    }
    .listStyle(.plain)
    .navigationTitle("Cat breeds")
    .navigationBarTitleDisplayMode(.large)
    .searchable(text: $searchText)
  }
  
  var searchResults: [String] {
    if searchText.isEmpty {
      return viewModel.breeds
    } else {
      return viewModel.breeds.filter { $0.contains(searchText) }
    }
  }
}

struct BreedsView_Previews: PreviewProvider {
  static var previews: some View {
    BreedsView(viewModel: ProfileViewModel())
  }
}
