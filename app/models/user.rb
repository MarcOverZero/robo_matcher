class User < ApplicationRecord
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages

  has_one :profile

end
