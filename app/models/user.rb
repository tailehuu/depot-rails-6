class User < ApplicationRecord
  class Error < StandardError; end

  after_destroy :ensure_an_admin_remains
  has_secure_password
  validates :name, presence: true, uniqueness: true

  private

    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end
end
