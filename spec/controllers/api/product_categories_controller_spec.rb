# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ProductCategoriesController, type: :controller do
  render_views

  let!(:model) { ::ProductCategory }

  let!(:resource) { FactoryBot.create(:product_category, sale_point_id: 3) }

  let!(:categories) do
    FactoryBot.create_list(:product_category, 5, sale_point_id: 1)
  end

  include_examples 'Categories'
end

