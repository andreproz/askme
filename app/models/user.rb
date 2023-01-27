class User < ApplicationRecord
  has_secure_password
  
  before_save :downcase_nickname
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }
  
  validates :head_color, format: { with: /\A#\h{3}{1,2}\z/ }
  
  def downcase_nickname
    nickname.downcase!
  end
end
