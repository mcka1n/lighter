class Match
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id,      type: String
  field :friend_id,    type: String

  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => "friend_id"
end
