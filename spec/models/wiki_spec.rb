require 'rails_helper'

RSpec.describe Wiki, type: :model do
     let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: false) }
 
 # #2
   describe "attributes" do
     it "has title, body and private attributes" do
       expect(post).to have_attributes(title: "New Post Title", body: "New Post Body", private: false)
     end
   end
end
