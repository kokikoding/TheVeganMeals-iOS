//
//  Injection.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

import Foundation

final class Injection: NSObject {

  private func provideRepository() -> MealRepositoryProtocol {

    let remote: RemoteDataSource = RemoteDataSource.sharedInstance

    return MealRepository.sharedInstance(remote)
  }

  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }

  func provideDetail(meal: MealItemModel) -> DetailUseCase {
    let repository = provideRepository()
    return DetailInteractor(repository: repository, meal: meal)
  }
}
