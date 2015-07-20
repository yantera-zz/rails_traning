class User < ActiveRecord::Base
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews
  validates :agreement, acceptance: { on: :create }
  with_options unless: 'dm.blank?' do |dm|
    dm.validates :email, presence: true 
    dm.validates :roles, presence: true 
  end
  def self.auhtenticate(username, passsword)
    usr = find_by(username: username)
    if usr != nil && usr.password == Digest::SHA1.hexdigest(usr.salt + password) then
    usr
    else
      return
    end
  end
end
