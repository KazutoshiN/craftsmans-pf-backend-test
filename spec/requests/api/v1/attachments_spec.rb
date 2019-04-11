require 'rails_helper'
RSpec.describe "AttachmentsController", type: :request do
  describe "GET #index" do
    it "returns a success response" do
      create(:user).attachments.create(filename: 'testfile.jpg', url: 'http://localhost/test')
      get '/api/v1/attachments'
      expect(response.status).to eq(200)
      expect(response.body).to match(/testfile.jpg/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      attachment = create(:user).attachments.create(filename: 'testfile.jpg', url: 'http://localhost/test')
      get "/api/v1/attachments/#{attachment.to_param}"
      expect(response.status).to eq(200)
      expect(response.body).to match(/testfile.jpg/)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested attachment" do
        attachment = create(:user).attachments.create(filename: 'testfile.jpg', url: 'http://localhost/test')
        put "/api/v1/attachments/#{attachment.to_param}", params: {attachment: {filename: "sample.jpg"}}
        attachment.reload
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')
        expect(Attachment.last.filename).to eq("sample.jpg")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested attachment" do
      attachment = create(:user).attachments.create(filename: 'testfile.jpg', url: 'http://localhost/test')
      expect {
        delete "/api/v1/attachments/#{attachment.to_param}"
      }.to change(Attachment, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end

end
