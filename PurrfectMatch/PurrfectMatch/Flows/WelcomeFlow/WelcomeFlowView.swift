//
//  WelcomeFlowView.swift
//  PurrfectMatch
//
//  Created by yossa on 25/10/2566 BE.
//

import SwiftUI

struct WelcomeFlowView: View {

  @ObservedObject var viewModel: WelcomeFlowViewModel

  var body: some View {
    viewModel.view
      .transition(
        AnyTransition
          .opacity
          .animation(.smooth)
      )
      .id(UUID())
  }
}

#Preview {
  WelcomeFlowView(viewModel: WelcomeFlowViewModel())
}
