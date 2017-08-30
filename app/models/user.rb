class User < ApplicationRecord
  fuzzily_searchable :name
  validates_presence_of :name
  validates_presence_of :description

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100#"},
                    :default_url => "/images/user.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :tweets
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy
  has_many :following, -> {where(relationships: {accepted: true})}, through: :active_relationships, source: :followed
  has_many :pending_following, -> {where(relationships: {accepted: false})}, through: :active_relationships, source: :followed
  has_many :followers, -> {where(relationships: {accepted: true})}, through: :passive_relationships, source: :follower


  def notifications
    Notification.by_user self
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def has_pending_following?(other_user)
    pending_following.include?(other_user)
  end

  def can_follow?(other_user)
    return !following?(other_user) && !has_pending_following?(other_user)
  end

end
