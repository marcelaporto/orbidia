class User < ActiveRecord::Base
  belongs_to :country, class_name: "Country"
  has_many :sugestions
  has_many :endorsements
  has_many :preferences

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
