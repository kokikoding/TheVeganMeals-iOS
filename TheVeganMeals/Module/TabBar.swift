//
//  TabBar.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 16/04/21.
//

import SwiftUI

struct TabBar: View {

  @EnvironmentObject var homePresenter: HomePresenter
  @State var isActive: Bool = false

    var body: some View {
      TabView {
         HomeView(presenter: homePresenter)
        .tabItem {
          Image(systemName: "house.fill")
        }
      }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
      TabBar()
    }
}
