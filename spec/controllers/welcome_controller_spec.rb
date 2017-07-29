require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do

    before {
      create(:vote)
    }

    it "displays @data_set and campaigns" do
      data_set = Vote.all
      get :index

      expect(assigns(:dashboard).votes).to match_array(data_set)
      expect(assigns(:dashboard).campaigns).to eql(["first_campain"])
    end
  end

end
