//
//  ListItem.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 15/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListItem: View {

  var item: MealItemModel
  var body: some View {
    VStack {
      imageItem
      content
    }
    .frame(width: (UIScreen.main.bounds.width / 2) - 32, height: 250)
    .background(Color("LightYellow"))
    .cornerRadius(10)
  }

}

extension ListItem {

  var imageItem: some View {
    WebImage(url: URL(string: item.image))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .aspectRatio(contentMode: .fill)
      .cornerRadius(10)
  }

  var content: some View {
    HStack(alignment: .center) {
      Text(item.title)
        .font(.system(size: 16))
        .bold()
        .frame(minWidth: 0,
               maxWidth: .infinity,
               alignment: .leading
        )
        .foregroundColor(Color("DarkBlue"))

      Button(action: {
        print("save")
      }) {
          Image(systemName: "heart").foregroundColor(Color("DarkBlue"))
      }
      .padding(.horizontal, 2)
    }
    .padding(8)
  }

}

struct ListItem_Previews: PreviewProvider {

  static var previews: some View {
    let meal = MealItemModel(
      id: "123",
      title: "Baingan Bharta",
      image: "https://www.themealdb.com/images/media/meals/urtpqw1487341253.jpg"
    )
    return ListItem(item: meal)
  }

}
