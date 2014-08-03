require 'spec_helper'

describe "StaticPages" do
	describe "Home page" do
		it "should have the content 'sample'" do
			visit '/static_pages/home'
			expect(page).to have_content('Sample')
		end
	end
end
