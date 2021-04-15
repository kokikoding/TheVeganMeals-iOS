//
//  HomeInteractor.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

import Foundation

protocol HomeUseCase {

  func getMealList(completion: @escaping (Result<[MealItemModel], Error>) -> Void)

}

class HomeInteractor: HomeUseCase {

  private let repository: MealRepositoryProtocol

  required init(repository: MealRepositoryProtocol) {
    self.repository = repository
  }

  func getMealList(
    completion: @escaping (Result<[MealItemModel], Error>) -> Void
  ) {
    repository.getMealList { result in
      completion(result)
    }
  }

}
