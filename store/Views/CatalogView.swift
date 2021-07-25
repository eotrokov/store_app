//
//  CatalogView.swift
//  store
//
//  Created by e.otrokov on 25.07.2021.
//

import SwiftUI

struct CatalogView: View {
    enum Category: Int {
        case Men = 0
        case Women = 1
        case Child = 2
    }
    
    @State var selected = 0
    @State var searchText = ""
    
    let array = ["Новинки","Одежда","Обувь","Распродажа"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $selected, label: Text(""), content: {
                Text("Женщинам") .onTapGesture {
                    self.selected = 0
                }.tag(0)
                Text("Мужчинам") .onTapGesture {
                    self.selected = 1
                }.tag(1)
                Text("Детям") .onTapGesture {
                    self.selected = 2
                }.tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                TextField("Type your search",
                          text: $searchText)
                Image(systemName: "camera")
            }.padding()
            .background(Capsule().fill(Color.white))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: 1)
            )
            ForEach(getCategories(), id:\.self){text in
                Text(text).bold()
                    .padding(15)
            }
            Spacer()
        }
        .padding(5)
        .navigationBarTitle(Text("The Title"))
    }
    
    func getCategories() -> Array<String> {
        switch self.selected {
        case 0:
            return ["Новинки","Одежда","Обувь","Распродажа"]
        case 1:
            return ["Новинки","Одежда","Обувь","Распродажа","Авто"]
        case 2:
            return ["Новинки","Одежда","Обувь","Распродажа", "Рождение"]
        default:
            return []
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
