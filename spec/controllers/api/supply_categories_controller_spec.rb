# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SupplyCategoriesController, type: :controller do
  render_views

  let!(:model) { ::SupplyCategory }

  let!(:resource) { FactoryBot.create(:supply_category, sale_point_id: 3) }

  let!(:categories) do
    FactoryBot.create_list(:supply_category, 5, sale_point_id: 1)
  end

  include_examples 'Categories'
end

