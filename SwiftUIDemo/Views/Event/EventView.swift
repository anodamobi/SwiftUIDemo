//
//  EventView.swift
//  SwiftUIDemo
//
//  Created by Alex on 16.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI
import SwiftUIDemoFoundation

// TODO: investigate fow to fix animation
struct EventView: View {
  @Environment(\.localStatusBarStyle) var statusBarStyle
  
  @GestureState var dragState = DragState.inactive
  @State var dragPosition = CGPoint.zero
  @State var showSuccessView = false
  
  enum DragState {
    case inactive
    case positioning(location: CGPoint)
    case active(location: CGPoint)
    
    var location: CGPoint {
      switch self {
      case .inactive:
        return .zero
      case .active(let location),
           .positioning(let location):
        return location
      }
    }
    
    var isActive: Bool {
      switch self {
      case .inactive, .positioning:
        return false
      case .active:
        return true
      }
    }
    
    var isPositioning: Bool {
      switch self {
      case .inactive, .active:
        return false
      case .positioning:
        return true
      }
    }
  }
  
  var longPressDrag: some Gesture {
    LongPressGesture(minimumDuration: 1, maximumDistance: .greatestFiniteMagnitude)
      .simultaneously(with: DragGesture(minimumDistance: 0))
      .updating($dragState) { value, state, transaction in
        print(state)
        switch (value.first, value.second) {
        case (true, let drag):
          
          let location = drag?.location ?? .zero
          
          if case .inactive = state {
            self.dragPosition = location
            state = .positioning(location: location)
          }
          
          self.dragPosition = location
          state = .active(location: location)
          
        default:
          state = .inactive
        }
    }.onEnded { value in
      switch (value.first, value.second) {
      case (true, let drag):
        if let _ = drag {
          self.showSuccessView = true
        } else {
          fallthrough
        }
        
      default:
        self.showSuccessView = false
      }
    }
  }
  
  var bubleViewScale: CGFloat {
    if self.dragState.isPositioning {
      return .ulpOfOne
    }
    return self.dragState.isActive ? 3.0 : .ulpOfOne
  }
  
  var bubleViewAnimation: Animation? {
    if self.dragState.isPositioning {
      return nil
    }
    return self.dragState.isActive ?
      Animation.spring().speed(0.3) :
      Animation.default.speed(0.5)
  }
  
  var body: some View {
    ZStack {
      GeometryReader { geometry in
        ZStack {
          VStack {
            Spacer()
              .frame(height: 120)
            
            Text("Tap and hold".uppercased())
              .font(.system(size: 20, weight: .bold))
              .foregroundColor(.white)
            
            Spacer()
          }
          VStack(spacing: 10) {
            Image(Icons.eventsIcon.name)
            Text("Some event".uppercased())
              .font(.system(size: 25, weight: .bold))
              .foregroundColor(.black)
            
            VStack {
              Text("Thursday – 8pm")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Palette.greyWarm4.color)
              Text("London")
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(Palette.greenFern.color)
            }
          }
          .padding()
          .frame(width: geometry.size.width - 30, height: nil)
          .background(Palette.white.color)
          .cornerRadius(10)
        }
        .frame(size: geometry.size)
      }
      .background(Palette.greenFern.color)
      .edgesIgnoringSafeArea(.all)
      .gesture(longPressDrag)
      
      Circle()
        .fill(Palette.greenShamrock.color)
        .scaleEffect(self.bubleViewScale, anchor: .center)
        .animation(self.bubleViewAnimation)
      
      if showSuccessView {
        EventBubbleSuccessView(presented: $showSuccessView)
          .transition(.asymmetric(insertion: .opacity, removal: .opacity))
          .animation(.default)
      }
      
    }.onAppear {
      self.statusBarStyle.currentStyle = .lightContent
    }
  }
}

#if DEBUG
struct EventView_Previews: PreviewProvider {
  static var previews: some View {
    EventView()
  }
}
#endif
