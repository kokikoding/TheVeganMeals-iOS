//
//  DetailInteractor.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

import Foundation

protocol DetailUseCase {

  func getMeal() -> MealItemModel

}

class DetailInteractor: DetailUseCase {

  private let repository: MealRepositoryProtocol
  private let meal: MealItemModel

  required init(
    repository: MealRepositoryProtocol,
    meal: MealItemModel
  ) {
    self.repository = repository
    self.meal = meal
  }

  func getMeal() -> MealItemModel {
    return meal
  }

}
