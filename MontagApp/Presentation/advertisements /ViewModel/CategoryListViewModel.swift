//
//  CategoryListViewModel.swift
//  MontagApp
//
//  Created by no one on 03/06/2021.
//

import Foundation
class CategoryListViewModel {
    var categoryViewModels  = [CategoryViewModel]()
       var categoryDataAccess : CategoryDataAccess
       init(categoryDataAccess: CategoryDataAccess) {
           self.categoryDataAccess = categoryDataAccess
        populateCategories()
       }
       private func populateCategories() {
        let categories = categoryDataAccess.getAllCategoies()
           self.categoryViewModels = categories.map{category in
                 return CategoryViewModel(category: category)
                                                  
           }
       }
}
class CategoryViewModel {
    var categoryName : String!
    var categoryImage : String!
    init(category: Category) {
        self.categoryName = category.categoryName
        self.categoryImage = category.categoryImage
    }
}

struct CategoryDataAccess {
    func getAllCategoies() ->[Category]
    {
        var categories = [Category]()
        categories.append(Category(categoryName: "", categoryImage: ""))
        categories.append(Category(categoryName: "", categoryImage: ""))
        categories.append(Category(categoryName: "", categoryImage: ""))
        categories.append(Category(categoryName: "", categoryImage: ""))
        return categories
    }
}
