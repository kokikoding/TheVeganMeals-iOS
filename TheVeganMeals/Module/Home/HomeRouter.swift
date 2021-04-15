//
//  HomeRouter.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

import SwiftUI

class HomeRouter {

  func makeDetailView(for item: MealItemModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(meal: item)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    return DetailView(presenter: presenter)
  }
}
