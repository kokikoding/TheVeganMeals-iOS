//
//  ContentView.swift
//  TheVeganMeals
//
//  Created by Muhammad Hendra Pranajaya on 05/04/21.
//

import SwiftUI

struct ContentView: View {

  @EnvironmentObject var homePresenter: HomePresenter
  @State var isActive: Bool = false

    var body: some View {
        VStack {
            if self.isActive {
              TabBar()
            } else {
                ZStack {
                  Color("DarkBlue").ignoresSafeArea()
                  Image("Icon")
                    .resizable()
                    .frame(width: 150, height: 150)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
