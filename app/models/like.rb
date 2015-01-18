class Like
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id,       type: String
  field :to_user_id,    type: String

  belongs_to :user

  validate :viewer_does_not_already_like_user

  before_create :check_matches

  def already_likes?
    Like.where(user_id: user_id, to_user_id: to_user_id).size > 0
  end

  def is_it_a_match?
    Like.where(user_id: to_user_id, to_user_id: user_id).size > 0
  end

  private

  def viewer_does_not_already_like_user
    errors.add(:like, "You can only like a user once.") if already_likes?
  end

  def check_matches
    Match.create(user_id: user_id, friend_id: to_user_id) if is_it_a_match?
  end

end
