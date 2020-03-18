//
//  SearchBar.swift
//  SwiftUIDemo
//
//  Created by Wilson on 16.12.2019.
//  Copyright © 2019 Wilson. All rights reserved.
//

import SwiftUI

struct SwiftUIDemoSearchBar: UIViewRepresentable {
  @Binding var searchText: String
  
  class Coordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String
    
    init(text: Binding<String>) {
      _text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      text = searchText
    }
  }
  
  func makeCoordinator() -> SwiftUIDemoSearchBar.Coordinator {
    return Coordinator(text: $searchText)
  }
  
  func makeUIView(context: UIViewRepresentableContext<SwiftUIDemoSearchBar>) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.autocapitalizationType = .none
    searchBar.placeholder = "Search"
    searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    return searchBar
  }
  
  func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SwiftUIDemoSearchBar>) {
    uiView.text = searchText
  }
}
