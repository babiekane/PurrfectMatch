//
//  WeightPickerView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 25/9/2566 BE.
//

import SwiftUI

struct WeightPickerView: View {
  @State var unitSelected = 0
  @State var firstDecimalSelected = 0
  @State var lastDecimalSelected = 0
  
  var units = [Int](0...20)
  var firstDecimals = [Int](0...9)
  var lastDecimals = [Int](0...9)
  
  var body: some View {
    GeometryReader { geo in
      ZStack(alignment: .bottom) {
        VStack(spacing: 40) {
          HStack(alignment: .center) {
            Picker(selection: self.$unitSelected, label: Text("")) {
              ForEach(0..<self.units.count) { index in
                Text("\(self.units[index])").tag(index)
                  .font(.custom("Fredoka", size: 20))
                  .foregroundColor(Color("Black"))
              }
            }
            .pickerStyle(.wheel)
            
            Text(".")
            
            Picker(selection: self.$firstDecimalSelected, label: Text("")) {
              ForEach(0..<self.firstDecimals.count) { index in
                Text("\(self.firstDecimals[index])").tag(index)
                  .font(.custom("Fredoka", size: 20))
                  .foregroundColor(Color("Black"))
              }
            }
            .pickerStyle(.wheel)
            
            Picker(selection: self.$lastDecimalSelected, label: Text("")) {
              ForEach(0..<self.lastDecimals.count) { index in
                Text("\(self.lastDecimals[index])").tag(index)
                  .font(.custom("Fredoka", size: 20))
                  .foregroundColor(Color("Black"))
              }
            }
            .pickerStyle(.wheel)
            
            Text("kg")
              .font(.custom("Fredoka", size: 18))
              .foregroundColor(Color("Black"))
          }
          
          Text("Your pet weight: \(unitSelected).\(firstDecimalSelected)\(lastDecimalSelected) kg")
            .font(.custom("Fredoka", size: 18))
            .foregroundColor(Color("Black"))
        }
        .frame(width: geo.size.width - 100, height: geo.size.height, alignment: .center)
      .padding(.horizontal, 50)
        
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
    }
  }
}

struct WeightPickerView_Previews: PreviewProvider {
  static var previews: some View {
    WeightPickerView()
  }
}
