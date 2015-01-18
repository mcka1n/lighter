class User
  include Mongoid::Document
  include Mongoid::Timestamps

  GENDERS = %W(male female both)

  field :user_name,       type: String
  field :email,           type: String
  field :gender,          type: String
  field :age,             type: Integer, default: 0
  field :rank,            type: Float, default: 0.00

  validates :user_name, :email,  presence: true, uniqueness: true
  validates :gender, :age, presence: true
  validates :gender, inclusion: { in: GENDERS,
    message: "%{value} is not a valid gender" }

  has_one :profile
  has_many :likes
  has_many :matches

  def send_like_to user_b_id
    result = true
    like = Like.new
    like.user_id = self.id
    like.to_user_id = user_b_id
    like.save
    result = like
    result
  end

  def search_compatible_users
    results = []
    profile = self.profile
    age_limits = profile.age_range_delta

    users = User.ne(id: self.id)
    if profile.orientation == "both"
      users = users.between(age: age_limits[:min]..age_limits[:max])
    else
      users = users.where(gender: profile.orientation).between(age: age_limits[:min]..age_limits[:max])
    end

    users.each do |user|
      if user.profile.orientation == "both" || user.profile.orientation == self.gender
        results << user unless results.include?(user)
      end
    end
    results
  end

  def self.search query
    if !query.blank?
      User.all.where user_name: /#{query}/i
    else
      User.all
    end
  end

end
