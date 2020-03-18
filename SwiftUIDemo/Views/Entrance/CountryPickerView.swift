//
//  CountryPickerView.swift
//  SwiftUIDemo
//
//  Created by Wilson on 17.11.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI
import SwiftUIDemoFoundation

struct CountryPickerView: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @ObservedObject var viewModel: CountryViewModel
  
  init(viewModel: CountryViewModel
    = CountryViewModel(sourceCountry: BundleCountrySource())
  ) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack {
      HStack {
        SwiftUIDemoSearchBar(searchText: $viewModel.inputSearchText)
          .padding(.top, 5)
          .padding(.leading, 5)
        Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }, label: {
          Text("Cancel")
            .fontWeight(.semibold)
            .font(.body)
            .foregroundColor(Palette.blue.color)
        })
          .padding(.trailing, 10)
      }
      List {
        ForEach(viewModel.outputSections) { section in
          Section(header: Text(section.title)) {
            ForEach(section.cells) { cell in
              Button(action: {
                self.viewModel.outputCountry = cell
                self.presentationMode.wrappedValue.dismiss()
              }) {
                CountryPickerRowView(country: cell)
              }
            }
          }
        }
      }
    }
  }
}

struct CountryPickerRowView: View {
  var country: CountryModel
  
  var body: some View {
    HStack {
      Text(country.name)
        .fontWeight(.semibold)
        .font(.callout)
        .foregroundColor(Palette.primary.color)
      Spacer()
      Text(country.dialCode)
        .fontWeight(.regular)
        .font(.callout)
        .foregroundColor(Palette.primary.color)
    }
  }
}

#if DEBUG
struct CountryPickerView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CountryPickerView()
        .navigation()
        .previewDevice(.iphoneXsMax)
        .environment(\.colorScheme, .light)
      
      CountryPickerView()
        .navigation()
        .previewDevice(.iphone7)
        .environment(\.colorScheme, .dark)
      
      CountryPickerView()
        .navigation()
        .previewDevice(.iphoneSE)
    }
  }
}
#endif
