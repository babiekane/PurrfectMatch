//
//  BreedsView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 26/9/2566 BE.
//

import SwiftUI

struct BreedsView: View {
  @ObservedObject var viewModel = ProfileViewModel()
  @State private var searchText = ""
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(searchResults, id: \.self) { breed in
            Text(breed)
              .font(.custom("Fredoka", size: 18))
              .foregroundColor(Color("Black"))
        }
        .listRowSeparator(.hidden, edges: .all)
      }
      .listStyle(.plain)
      .navigationTitle("Cat breeds")
    }
    .searchable(text: $searchText)
//    {
//      ForEach(searchResults, id: \.self) { result in
//        Text("Are you looking for \(result)?").searchCompletion(result)
//      }
//    }
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
