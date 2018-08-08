# frozen_string_literal: true

RSpec.shared_examples 'Categories' do
  render_views

  let(:basic_params) do
    {
      category: {
        name: 'Beers', description: nil, sale_point_id: 1
      }
    }
  end

  let(:bad_params) do
    {
      category: {
        name: nil, sale_point_id: nil
      }
    }
  end

  let(:full_params) do
    {
      category: {
        name: 'Beers', description: 'Beerrs for all',
        sale_point_id: 1,
        published_at: Time.zone.today,
        published_until: nil,
        published: true
      }
    }
  end

  let(:update_params) do
    {
      name: 'Beeerz',
      description: 'Geezz Beeerzz'
    }
  end

  let(:update_full_params) do
    {
      name: 'Beeerz',
      description: 'Geezz Beeerzz',
      published_at: Time.zone.today,
      published_until: nil,
      published: true
    }
  end

  let(:json_body) { response.body }

  let(:json) { JSON.parse(json_body) }

  describe '#index' do

    context 'Good Requests' do
      it 'returns categories from sale point' do
        get :index, params: { sale_point_id: 1 }
        expect(json['categories'].size).to eq(categories.size)
      end
    end

    context 'Bad requests' do
      it 'without any params' do
        get :index
        expect(response).not_to be_success
      end

      it 'if null sale_point_id' do
        get :index, params: { sale_point_id: nil }
        expect(response).not_to be_success
      end

      it 'when unknown sale_point_id' do
        get :index, params: { sale_point_id: 2 }
        expect(response).not_to be_success
      end
    end
  end

  describe '#create' do
    context 'Good requests' do
      context 'creates category' do
        it 'with basic params' do
          expect { post :create, params: basic_params }.to(
            change(model, :count).by(1)
          )
        end

        it 'with full params' do
          expect { post :create, params: full_params }.to(
            change(model, :count).by(1)
          )
        end

        it 'returns a JSON with the created category' do
          post :create, params: basic_params
          expect(json_body).to eq(assigns(:category).to_json)
        end
      end
    end

    context 'Bad Requests' do
      it 'do not creates without sale_point_id' do
        params = { category: { name: 'Beer', sale_point_id: nil } }
        expect { post :create, params: params }.to(
          change(model, :count).by(0)
        )
      end

      it 'do not creates with invalid_params' do
        expect { post :create, params: bad_params }.to(
          change(model, :count).by(0)
        )
      end
    end
  end

  describe '#update' do
    context 'Good Requests' do
      it 'updates params with given id and sale_point_id' do
        params = {
          id: resource.id,
          sale_point_id: resource.sale_point_id,
          category: update_params
        }
        patch :update, params: params
        resource.reload
        expect(resource.name).to eq(assigns(:category).name)
        expect(resource.description).to(
          eq(assigns(:category).description)
        )
      end

      it 'do not update sale_point_id on category' do
        params = {
          id: resource.id,
          sale_point_id: resource.sale_point_id,
          category: {
            sale_point_id: 33443
          }
        }
        patch :update, params: params
        expect { resource.reload }.not_to(
          change(resource, :sale_point_id)
        )
      end

      it 'updates all params' do
        params = {
          id: resource.id,
          sale_point_id: resource.sale_point_id,
          category: update_full_params
        }
        put :update, params: params
        resource.reload
        expect(JSON.parse(resource.to_json)).to eq(json)
      end
    end

    context 'Bad requests' do
      it 'returns unsuccesfull if not sale_point_id given' do
        patch :update, params: {
          id: resource.id,
          sale_point_id: nil,
          category: update_params
        }
        expect(response).not_to be_success
      end

      it 'returns unsuccesfull if wrong id given' do
        patch :update, params: {
          id: 123456,
          sale_point_id: resource.sale_point_id,
          category: update_params
        }
        expect(response).not_to be_success
      end

      it 'unsuccesfull if wrong sale_point_id' do
        patch :update, params: {
          id: resource.id,
          sale_point_id: 1,
          category: update_params
        }
        expect(response).not_to be_success
      end
    end
  end

  describe '#show' do
    context 'Good requests' do
      it 'gives category by id and sale point id' do
        get :show, params: {
          id: resource.id,
          sale_point_id: resource.sale_point_id
        }
        json_resource = JSON.parse(resource.to_json)
        expect(json).to eq(json_resource)
      end
    end

    context 'Bad requests' do
      it 'unsuccesfull by only id' do
        get :show, params: {
          id: resource.id
        }
        expect(response).not_to be_success
      end

      it 'unsuccesfull if wrong id' do
        get :show, params: {
          id: 123456,
          sale_point_id: resource.sale_point_id
        }
        expect(response).not_to be_success
      end

      it 'unsuccesfull if wrong sale_point_id' do
        get :show, params: {
          id: resource.id,
          sale_point_id: 1
        }
        expect(response).not_to be_success
      end
    end
  end
end

