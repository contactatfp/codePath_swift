//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Ben Stone on 4/19/21.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @StateObject private var recipeData = RecipeData()

    var body: some View {
        let columns = [GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(
                            destination: RecipesListView(category: category).environmentObject(recipeData),
                            label: {
                                CategoryView(category: category)
                            })
                    }
                })
            }
            .navigationTitle("Meals")
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            Text(category.rawValue)
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
