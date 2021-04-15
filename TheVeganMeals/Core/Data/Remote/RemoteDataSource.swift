//
//  RemoteDataSource.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

import Foundation

protocol RemoteDataSourceProtocol: class {

  func getMealList(result: @escaping (Result<[MealResponse], URLError>) -> Void)

}

final class RemoteDataSource: NSObject {

  private override init() { }

  static let sharedInstance: RemoteDataSource =  RemoteDataSource()

}

extension RemoteDataSource: RemoteDataSourceProtocol {

  func getMealList(
    result: @escaping (Result<[MealResponse], URLError>) -> Void
  ) {
    guard let url = URL(string: Endpoints.Gets.meals.url) else { return }

    let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
      if maybeError != nil {
        result(.failure(.addressUnreachable(url)))
      } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse, response.statusCode == 200 {
        let decoder = JSONDecoder()
        do {
          let meals = try decoder.decode(MealsResponse.self, from: data).meals
          result(.success(meals))
        } catch {
          result(.failure(.invalidResponse))
        }
      }
    }
    task.resume()

  }

}
