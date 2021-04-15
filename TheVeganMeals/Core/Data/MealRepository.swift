//
//  MealRepository.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

import Foundation

protocol MealRepositoryProtocol {

  func getMealList(result: @escaping (Result<[MealItemModel], Error>) -> Void)

}

final class MealRepository: NSObject {

  typealias MealInstance = (RemoteDataSource) -> MealRepository

  fileprivate let remote: RemoteDataSource

  private init(remote: RemoteDataSource) {
    self.remote = remote
  }

  static let sharedInstance: MealInstance = { remoteRepo in
    return MealRepository(remote: remoteRepo)
  }

}

extension MealRepository: MealRepositoryProtocol {

  func getMealList(
    result: @escaping (Result<[MealItemModel], Error>) -> Void
  ) {

    self.remote.getMealList { remoteResponses in
      switch remoteResponses {
      case .success(let mealResponses):
        let resultList = MealItemMapper.mapMealResponsesToDomains(input: mealResponses)
        result(.success(resultList))
      case .failure(let error):
        result(.failure(error))
      }
    }
  }
}
