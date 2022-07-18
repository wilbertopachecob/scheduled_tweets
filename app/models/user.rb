class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, format: {with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/}
end
