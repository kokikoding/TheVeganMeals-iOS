//
//  TheVeganMealsApp.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 05/04/21.
//

import SwiftUI

@main
struct TheVeganMealsApp: App {

  @StateObject var homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome())

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(homePresenter)
        }
    }
}
