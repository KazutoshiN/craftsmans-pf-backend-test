require 'rails_helper'
RSpec.describe StatusChangeEvent, type: :request do
  describe 'GET /status_change_event' do
    it 'returns success response' do
      get '/v1/status_change_event'
      expect(response).to be_successful
    end

    it 'returns record when specify issue_id' do
      create(:status_change_event)
      get '/v1/status_change_event', params: {
        issue_id: StatusChangeEvent.first.issue_id
      }
      expect(response).to be_successful
    end
  end

  describe 'POST /status_change_event' do
    it 'creates a record ' do
      post_record = attributes_for(:status_change_event)
      post '/v1/status_change_event', params: post_record.to_param
      expect(response).to have_http_status(:created)
    end
  end
end
