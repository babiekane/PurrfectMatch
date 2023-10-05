//
//  ProfileFlowView.swift
//  PurrfectMatch
//
//  Created by yossa on 5/10/2566 BE.
//

import SwiftUI

struct ProfileFlowView: View {
  
  @ObservedObject var viewModel: ProfileFlowViewModel
  
  var body: some View {
    NavigationStack(path: $viewModel.destinations) {
      viewModel.rootView
        .navigationDestination(for: ProfileFlowDestination.self) { destination in
          destination.view
        }
    }
  }
}

#if DEBUG
struct ProfileFlowView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileFlowView(viewModel: ProfileFlowViewModel())
  }
}
#endif
