//
//  FavoritesView.swift
//  store
//
//  Created by e.otrokov on 25.07.2021.
//

import SwiftUI

struct FavoritesView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
      @State private var selectedImage: UIImage?
      @State private var isImagePickerDisplay = false
      
      var body: some View {
          NavigationView {
              VStack {
                  
                  if selectedImage != nil {
                      Image(uiImage: selectedImage!)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .clipShape(Circle())
                          .frame(width: 300, height: 300)
                  } else {
                      Image(systemName: "snow")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .clipShape(Circle())
                          .frame(width: 300, height: 300)
                  }
                  
                  Button("Camera") {
                      self.sourceType = .camera
                      self.isImagePickerDisplay.toggle()
                  }.padding()
                  
                  Button("photo") {
                      self.sourceType = .photoLibrary
                      self.isImagePickerDisplay.toggle()
                  }.padding()
              }
              .navigationBarTitle("Demo")
              .sheet(isPresented: self.$isImagePickerDisplay) {
                  ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
              }
              
          }
      }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
