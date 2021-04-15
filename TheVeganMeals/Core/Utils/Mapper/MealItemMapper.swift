//
//  MealItemMapper.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

final class MealItemMapper {

  static func mapMealResponsesToDomains(
    input mealResponses: [MealResponse]
  ) -> [MealItemModel] {

    return mealResponses.map { result in
      return MealItemModel(
        id: result.id ?? "",
        title: result.title ?? "Unknow",
        image: result.image ?? "Unknow"
      )
    }
  }
}
