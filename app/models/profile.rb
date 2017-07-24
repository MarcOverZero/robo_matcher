class Profile < ApplicationRecord
  belongs_to :user

  validates_presence_of :photo, :location, :interest, :classification, :age,
                        :body_type

end
