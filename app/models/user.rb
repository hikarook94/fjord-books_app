# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy, inverse_of: :followee
  has_many :following, through: :active_relationships, source: :followee
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user_id)
    active_relationships.create(followee_id: other_user_id)
  end

  def unfollow(id)
    active_relationships.find_by(id: id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
