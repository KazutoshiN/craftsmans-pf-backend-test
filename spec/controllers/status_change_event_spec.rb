require 'rails_helper'
RSpec.describe StatusChangeEvent, type: :request do
  fixtures :status_change_events

  # fixtures :sections, :blocks
  describe 'GET /status_change_event' do
    it 'returns success response' do
      get '/v1/status_change_event'
      expect(response).to have_http_status(:ok)
    end

    it 'returns record when specify issue_id' do
      get '/v1/status_change_event', params: {
        project_id: StatusChangeEvent.first.issue_id
      }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /status_change_event' do
    let(:post_record) do
      {
        issue_id:            1,
        project_type:        '退去工事',
        project_name:        'ウエストインパート3 201号室＿リフレッシュ退去工事/一任 1/25',
        property_name:       'ウエストインパート3',
        client_name:         'MHE中央南_松本',
        status:              'none',
        status_started_at:   nil,
        status_completed_at: nil,
        next_status:         'need_appointment',
        action_user_id:      1,
        action_user_name:    'BPM 高木'
      }
    end
    it 'creates a record ' do
      post '/v1/status_change_event', params: post_record
      expect(response).to have_http_status(:created)
    end
  end
end
