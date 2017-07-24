require 'rails_helper'

describe Profile do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a photo" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(location: "Washington DC",
                                 interest: "No interest", body_type: "Some type",
                                 classification: "huh", age: 33, user_id: user.id)
        expect(profile).to be_invalid
      end
      it "is invalid without a location" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png",
                                 interest: "No interest", body_type: "Some type",
                                 classification: "huh", age: 33, user_id: user.id)
        expect(profile).to be_invalid
      end
      it "is invalid without a interest" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png", location: "Washington DC",
                                 body_type: "Some type",
                                 classification: "huh", age: 33, user_id: user.id)
        expect(profile).to be_invalid

      end
      it "is invalid without a classification" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png", location: "Washington DC",
                                 interest: "No interest", body_type: "Some type",
                                 age: 33, user_id: user.id)
        expect(profile).to be_invalid
      end
      it "is invalid without a age" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png", location: "Washington DC",
                                 interest: "No interest", body_type: "Some type",
                                 classification: "huh", user_id: user.id)
        expect(profile).to be_invalid
      end
      it "is invalid without a body type" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png", location: "Washington DC",
                                 interest: "No interest",
                                 classification: "huh", age: 33, user_id: user.id)
        expect(profile).to be_invalid
      end
      it "is invalid without a user_id" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png", location: "Washington DC",
                                 interest: "No interest", body_type: "Some type",
                                 classification: "huh", age: 33)
        expect(profile).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a photo, location, interest, body type, classification, age" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png", location: "Washington DC",
                                 interest: "No interest", body_type: "Some type",
                                 classification: "huh", age: 33, user_id: user.id)
        expect(profile).to be_valid
      end
    end

    describe "relationship" do
      it "belongs to" do
        user = User.create(name: "Rf1", email: "rf1@robot.com", password: "password")
        profile = Profile.create(photo: "robot.png", location: "Washington DC",
                                 interest: "No interest", body_type: "Some type",
                                 classification: "huh", age: 33, user_id: user.id)
        expect(profile).to respond_to(:user)
      end
    end
  end
end
