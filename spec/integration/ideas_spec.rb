# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'Ideas API', type: :request do
  path '/ideas' do
    get 'Find Ideas' do
      tags 'IdeaApi'
      description 'アイデア一覧情報取得'
      operationId 'FindIdeas'
      consumes 'multipart/form-data'
      parameter name: :category_name, in: :query, type: :string, required: false
      let(:category) { create(:category) }
      let(:idea) { create(:idea) }

      response '200', 'ok' do
        let(:category_name) { category.name }
        schema type: :object, title: 'Success Find Ideas', properties: {
          data: {
            type: :array,
            items: {
              properties: {
                id: { type: :integer },
                category: { type: :string },
                body: { type: :string },
                created_at: { type: :integer }
              }
            }
          }
        }
        run_test!
      end

      response '404', 'not_found' do
        let(:category_name) { 'tv' }
        run_test!
      end
    end
  end

  path '/ideas' do
    post 'Create Idea' do
      tags 'IdeaApi'
      description 'アイデア登録'
      operationId 'CreateIdea'
      consumes 'multipart/form-data'
      parameter name: :category_name, in: :formData
      parameter name: :body, in: :formData
      parameter name: :form, in: :formData, schema: {
        type: :object,
        properties: {
          category_name: { type: :string },
          body: { type: :string }
        },
        required: ['category_name']
      }
      let(:form) { {} }
      let(:category_name) { 'game' }

      response '201', 'created' do
        let(:body) { 'PS4' }
        run_test!
      end

      response '422', 'unprocessable_entity' do
        let(:body) { nil }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
