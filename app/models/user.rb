class User < ActiveRecord::Base
  belongs_to :country, class_name: "Country"


  def get_gravatar(email)
    # get the email from URL-parameters or what have you and make lowercase
    email_address = self.email.downcase

    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)

    # compile URL which can be used in <img src="RIGHT_HERE"...
    "https://www.gravatar.com/avatar/#{hash}"
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plaintext)
    @password = BCrypt::Password.create(plaintext)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end



end
