//
//  HomeView.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 05/04/21.
//

import SwiftUI

struct HomeView: View {

  @ObservedObject var presenter: HomePresenter
  let columns = [
          GridItem(.flexible()),
          GridItem(.flexible())
      ]

  var body: some View {
    NavigationView {
      ZStack {
        if presenter.loadingState {
            ActivityIndicator()
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 0) {
              ForEach(
                self.presenter.meals,
                id: \.id
              ) { meal in
                ZStack {
                  self.presenter.linkBuilder(for: meal) {
                    ListItem(item: meal)
                  }.buttonStyle(PlainButtonStyle())
                }.padding(.vertical, 8)
              }
            }
          }.padding(.horizontal, 16)
        }
      }
      .background(Color("Yellow"))
      .navigationBarTitle(Text("Vegan Meals"), displayMode: .inline)
    }
    .onAppear {
      if self.presenter.meals.count == 0 {
        self.presenter.getMealList()
      }
    }
  }
}
