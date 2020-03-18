//
//  AppCardViewDetails.swift
//  SwiftUIDemo
//
//  Created by Alex on 12.03.2020.
//  Copyright © 2020 Wilson. All rights reserved.
//

import SwiftUI
import SwiftUIDemoFoundation

struct AppCardViewDetails: View {

  let preferences: AppCardPreferenceData

  @Binding var activeDetailsItem: AppModel?
  @State var isExpanded: Bool = false

  var body: some View {
    GeometryReader { geometry in
        ScrollView(showsIndicators: false) {
          VStack {
            ZStack(alignment: .top) {
              Image(self.preferences.data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
              HStack {
                Spacer()
                Button(action: {
                  self.isExpanded.toggle()
                  // TODO: Investigate more. Here shoud be a completion of the animation
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.activeDetailsItem = nil
                  }
                }, label: {
                  Image(systemName: "xmark")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.black)
                    .clipShape(Circle())
                    .opacity(self.isExpanded ? 1 : 0)
                    .padding()
                    .padding(.top, 50)
                })
              }
            }

            HStack {
              VStack(alignment: .leading, spacing: 5) {
                Text(self.preferences.data.category)
                  .font(.headline)
                  .foregroundColor(.secondary)
                Text(self.preferences.data.heading)
                  .font(.title)
                  .fontWeight(.black)
                  .foregroundColor(.primary)
                  .lineLimit(3)
                Text(self.preferences.data.author.uppercased())
                  .font(.caption)
                  .foregroundColor(.secondary)
              }
              .layoutPriority(100)

              Spacer()
            }
            .padding()
            .animation(.linear(duration: 0.1))

            if self.isExpanded {
              VStack(alignment: .leading, spacing: 25) {
                VStack(alignment: .leading, spacing: 10) {
                  Text("About this course")
                    .font(.title)
                    .fontWeight(.bold)

                  Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 10) {
                  Text("Requirements")
                    .font(.title)
                    .fontWeight(.bold)

                  Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                    .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 10) {
                  Text("Animations")
                    .font(.title)
                    .fontWeight(.bold)

                  Text("SwiftUI provides a number of ways to animate your transitions. They even have their own physics-based built-in functions that allows you to use overshoot and apply bounciness to your animations.")
                    .foregroundColor(.secondary)
                }
              }
              .padding()
              .animation(nil)
            }
          }
          .background(Color.white)
          .cornerRadius(self.isExpanded ? 0 : 10)
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
          )
            .shadow(radius: self.isExpanded ? 0 : 5)
            .offset(x: 0, y: self.isExpanded ? 0 : self.preferences.rect.minY)
            .frame(minWidth: self.preferences.rect.size.width, minHeight: self.preferences.rect.size.height)
            .padding(.horizontal, self.isExpanded ? 0 : self.preferences.rect.minX)
        }
        .edgesIgnoringSafeArea(.all)
        .animation(Animation.spring())
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.isExpanded.toggle()
          }
      }
    }
  }
}

struct AppCardViewDetails_Previews: PreviewProvider {
  static var previews: some View {
    AppCardViewDetails(preferences:
      AppCardPreferenceData(data:
        AppModel(
          image: "swiftui-button",
          category: "SwiftUI",
          heading: "Drawing a Border with Rounded Corners",
          author: "Simon Ng"
      ), rect: .zero)
      , activeDetailsItem: .constant(nil)
    )
  }
}

