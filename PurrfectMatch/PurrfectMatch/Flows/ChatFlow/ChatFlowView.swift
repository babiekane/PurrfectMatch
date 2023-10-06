//
//  ChatFlowView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/10/2566 BE.
//

import SwiftUI

struct ChatFlowView: View {
  @ObservedObject var viewModel: ChatFlowViewModel
  
  var body: some View {
    NavigationStack(path: $viewModel.destinations) {
      viewModel.rootView
        .navigationDestination(for: ChatFlowDestination.self) { destination in
          destination.view
        }
    }
  }
}

struct ChatFlowView_Previews: PreviewProvider {
  static var previews: some View {
    ChatFlowView(viewModel: ChatFlowViewModel())
  }
}
