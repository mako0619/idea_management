# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'Ideas API', type: :request do
  path '/ideas' do
    post 'Create Idea' do
      tags 'IdeaApi'
      description 'アイデア登録'
      operationId 'CreateIdea'
      consumes 'multipart/form-data'
      parameter name: :category_name, in: :formData
      parameter name: :body, in: :formData
      let(:form) { {} }
      parameter name: :form, in: :formData, schema: {
        type: :object,
        properties: {
          category_name: { type: :string },
          body: { type: :string }
        },
        required: ['category_name']
      }

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
