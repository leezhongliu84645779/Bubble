class User < ApplicationRecord
    # attr_accessible :image
    attr_accessor :password 
    before_create :encrypt_password
    validates_uniqueness_of :username, :email
    validates_confirmation_of :password
    validates_presence_of :password, :username, :email, :password_confirmation, :on => :create
    require 'carrierwave/orm/activerecord'
    mount_uploader :image, UserimageUploader
    mount_uploader :background, UserimageUploader
    
    def encrypt_password
        self.passwordsalt = BCrypt::Engine.generate_salt
        self.encrypted_password = BCrypt::Engine.hash_secret(password, self.passwordsalt)
    end
    
    def self.authenticate(user, password)
        if user.encrypted_password != BCrypt::Engine.hash_secret(password, user.passwordsalt)  
          return false
        else
          return true
        end
    end
end
