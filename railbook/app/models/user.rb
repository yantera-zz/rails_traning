class User < ActiveRecord::Base
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews
  validates :agreement, acceptance: { on: :create }
  with_options unless: 'dm.blank?' do |dm|
    dm.validates :email, presence: true 
    dm.validates :roles, presence: true 
  end
end
