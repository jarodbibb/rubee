class User < ActiveRecord::Base
  validates :first_name, :last_name, :password, presence:true 
  validates :email, uniqueness: true 
  before_save :downcase_fields
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  
  def downcase_fields
    self.email.downcase!
  end 

  has_many :playlists
  has_many :songs, through: :playlists
  has_secure_password
end
