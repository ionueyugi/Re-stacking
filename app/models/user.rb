class User < ApplicationRecord
   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_stories, through: :favorites, source: :story

  # フォローされる側
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  # フォローする側
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def following?(user)
    active_relationships.find_by(follower_id: user.id)
  end

  def follow(user)
    active_relationships.create(follower_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(follower_id: user.id).destroy
  end

  # 通知を送る側
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy

  # 通知を送られる側
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
  	end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :nick_name, presence: true
  validates :goal, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, length: { maximum: 20 }
  validates :last_name, length: { maximum: 20 }
end
