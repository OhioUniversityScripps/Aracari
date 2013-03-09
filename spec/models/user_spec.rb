require 'spec_helper'

describe User do
  let(:user) { build(:user) }
  
  it "must save a valid user" do
    user.should be_valid
  end
  
  it "must validate presence of password" do
    user.password = nil
    user.password_confirmation = nil
    user.should_not be_valid
  end
  
  it "must validate presence of email" do
    user.email = nil
    user.should_not be_valid
  end
  
  it "must validate uniqueness of email" do
    create(:user, :email => "abcd@google.com") #Create a original user with an email address.
    
    user.email = "abcd@google.com" #Let the newly built user have the same email
    
    user.should_not be_valid
  end
  
end
