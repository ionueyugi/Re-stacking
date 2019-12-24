class Post < ApplicationRecord
	has_many :post_comments, dependent: :destroy
	has_many :notifications, dependent: :destroy
	has_many :favorites, dependent: :destroy
  	has_many :favorites_users, through: :favorites, source: :user
	belongs_to :user
	attachment :post_image

  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end

  def create_notification_favorite!(current_user)
    # すでに「いいね」してているか検索
    #「?」はSQLのインジェクションを防いでいる。プレスホルダー
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # 既に「いいね」されていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def self.post_destroy
    posts = Post.where("created_at between '#{Time.zone.now.ago(2.days)}' and '#{Time.zone.now.ago(1.days)}'")
    posts.delete_all
  end
  validates :post_content, presence: true
end
