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
      expect(assigns(:dashboard).campaigns).to eql(["first_campaign"])
    end
  end

  describe "GET by_campaign" do

    before {
      create(:vote)
      create(:vote)
      create(:vote)
      create(:vote, validity: "pre")
    }

    it "displays campaign votes" do
      data_set = Vote.all
      get :by_campaign, params: {campaign: "first_campaign"}

      expect(assigns(:dashboard).votes).to match_array(data_set)
      expect(assigns(:dashboard).valid_votes.count).to eql(3)
      expect(assigns(:dashboard).campaign_name).to eql("first_campaign")
      expect(assigns(:dashboard).choices).to match_array(["Joe"])
      expect(assigns(:dashboard).by_choice("Joe")).to match_array(assigns(:dashboard).valid_votes)
    end

  end

end
