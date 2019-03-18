FactoryBot.define do
  factory :status_change_event do
    issue_id            {1}
    project_type        {'退去工事'}
    project_name        {'ウエストインパート3 201号室＿リフレッシュ退去工事/一任 1/25'}
    property_name       {'ウエストインパート3'}
    client_name         {'MHE中央南_松本'}
    status              {'none'}
    status_started_at   {nil}
    status_completed_at {nil}
    next_status         {'need_appointment'}
    action_user_id      {1}
    action_user_name    {'BPM 高木'}
  end
end
