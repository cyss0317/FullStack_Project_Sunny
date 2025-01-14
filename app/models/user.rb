# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string           not null
#
class User < ApplicationRecord
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  attr_reader :password

  has_one :cart,
          foreign_key: :user_id,
          class_name: :Cart

  has_many :reviews,
           foreign_key: :user_id,
           class_name: :Review

  after_initialize :ensure_session_token
  # SPIRE

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email)
    return unless @user&.password?(password)

    @user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.base64(64)
    save!
    session_token
  end

  def password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.base64(64)
  end
end
