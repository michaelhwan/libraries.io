require "rails_helper"

RSpec.describe LicensesController, :vcr do
  before :each do
    @project = create(:project)
    Project.__elasticsearch__.import force: true
    Project.__elasticsearch__.refresh_index!
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, params: {id: @project.normalize_licenses.first}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, params: {id: @project.normalize_licenses.first}
      expect(response).to render_template("show")
    end
  end
end
