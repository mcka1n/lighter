class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_name,       type: String
  field :email,           type: String
  field :gender,          type: String
  field :age,             type: Integer, default: 0
  field :rank,            type: Float, default: 0.00

  validates :user_name, :email,  presence: true, uniqueness: true

  has_many :matches
  has_one :profile

  def self.search query
    if !query.blank?
      User.all.where user_name: /#{query}/i
    else
      User.all
    end
  end

end
