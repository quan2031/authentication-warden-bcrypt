class User < ApplicationRecord
	after_create :generate_authentication_token!

  has_secure_password

  private

  def generate_authentication_token!
    self.authentication_token = Digest::SHA1.hexdigest("#{Time.now}-#{self.id}-#{self.updated_at}")
    self.save
  end
end
