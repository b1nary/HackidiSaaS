class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    :presence => true,
    :uniqueness => {
       :case_sensitive => false
    }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  after_create :user_created
  after_destroy :user_destroyed

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def name
    self.username || self.email
  end

  private

  def user_created
    slack_notify("😊 User created: #{self.email} (#{self.username})")
  end

  def user_destroyed
    slack_notify("😭 User destroyed: #{self.email} (#{self.username})")
  end
end
