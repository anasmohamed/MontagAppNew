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

        
        categories.append(Category(categoryName: "إعلانات أخرى", categoryImage: "app_logo-1"))
        
        categories.append(Category(categoryName: " مقاولات", categoryImage: "articles"))
        
        categories.append(Category(categoryName: "مواشى وحيوانات وطيور", categoryImage: "animals"))
        
        categories.append(Category(categoryName: "خدمات", categoryImage: "services"))
        
        categories.append(Category(categoryName: "سفر وسياحة", categoryImage: "travel_tourism"))
        //
        categories.append(Category(categoryName: "الحرف والصناعات اليدوية", categoryImage: "arts"))
        
        categories.append(Category(categoryName: "مستلزمات الرحلات", categoryImage: "trips"))
        
        categories.append(Category(categoryName: "مستلزمات نسائية وأطفال", categoryImage: "women"))
        
        categories.append(Category(categoryName: "مستلزمات رجالية", categoryImage: "men"))
        
        categories.append(Category(categoryName: "عطور وبخور", categoryImage: "incense"))
        
        categories.append(Category(categoryName: "الموضة والجمال", categoryImage: "makeup"))
        
        categories.append(Category(categoryName: "صالونات ومشاغل", categoryImage: "fashion"))
        
        categories.append(Category(categoryName: "الأسر المنتجة", categoryImage: "pastries"))
        
        categories.append(Category(categoryName: "سكراب", categoryImage: "old_iron"))
        
        categories.append(Category(categoryName: "العقارات", categoryImage: "home4556"))
        categories.append(Category(categoryName: "أجهزة إلكترونية وجوالات", categoryImage: "phones"))
        categories.append(Category(categoryName: "الأثاث والديكور", categoryImage: "decoration"))
        categories.append(Category(categoryName: "السيارات وقطع الغيار", categoryImage: "car3774"))
        
        
        
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        //        categories.append(Category(categoryName: "", categoryImage: ""))
        return categories
    }
}
