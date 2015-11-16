require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

	describe "GET index" do
		it "get the index page" do
			get :index
			expect(response).to render_template("index")
		end
	end

	describe "GET about" do
		it "get the about template" do
			get :about
			expect(response).to render_template("about")
		end
	end

	describe "GET faq" do
		it "gets the faq template" do
			get :faq
			expect(response).to render_template("faq")
		end
	end

end
