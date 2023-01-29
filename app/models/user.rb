class User < ApplicationRecord
  has_secure_password
  
  has_many :questions, dependent: :delete_all
  
  before_validation :downcase_user_params
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }
  
  validates :head_color, format: { with: /\A#\h{3}{1,2}\z/ }
  
  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')
  
  private
  
  def downcase_user_params
    nickname&.downcase!
    email&.downcase!
  end
end
