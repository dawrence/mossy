module Api
  class ProductCategoriesController < CategoriesController
    def model
      ::ProductCategory
    end
  end
end
