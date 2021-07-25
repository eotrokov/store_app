//
//  TabBarControl.swift
//  store
//
//  Created by e.otrokov on 25.07.2021.
//

import SwiftUI

struct TabBarControl: View {
    @State private var selectedTab = 0
  
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuView()
                .onTapGesture {
                    self.selectedTab = 0
                }
                .tabItem {
                    Image(systemName: getIcon(name: "flame", index: 0))
                    Text("Меню")
                }.tag(0)
            CatalogView()
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: getIcon(name: "tray.2", index: 1))
                    Text("Каталог")
                }.tag(1)
            FavoritesView()
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem {
                    Image(systemName: getIcon(name: "heart", index: 2))
                    Text("Избранное")
                }.tag(2)
            ProfileView()
                .onTapGesture {
                    self.selectedTab = 3
                }
                .tabItem {
                    Image(systemName: getIcon(name: "person", index: 3))
                    Text("Профиль")
                }.tag(3)
            CartView()
                .onTapGesture {
                    self.selectedTab = 4
                }
                .tabItem {
                    Image(systemName: getIcon(name: "cart", index: 4))
                    Text("Корзина")
                }.tag(4)
        }
    }
    func getIcon(name: String, index: Int) -> String {
        if (index == self.selectedTab) {
            return name + ".fill"
        }
        return name
    }
}

struct TabBarControl_Previews: PreviewProvider {
    static var previews: some View {
        TabBarControl()
    }
}
