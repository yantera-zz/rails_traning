class User < ActiveRecord::Base
  validates :agreement, acceptance: { on: :create }
  with_options unless: 'dm.blank?' do |dm|
    dm.validates :email, presence: true 
    dm.validates :roles, presence: true 
  end
end
