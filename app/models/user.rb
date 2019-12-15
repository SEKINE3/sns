class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_image, ProfileImageUploader
  mount_uploader :back_image, BackImageUploader

  has_many :active_relationships, class_name: "Relationship",
  #一つのモデルから二つのアソシエーション経路を組むときにclass_nameを使いモデルを二つに分けることができる
        foreign_key: "following_id", dependent: :destroy #following_idは自分
  has_many :passive_relationships, class_name: "Relationship",
        foreign_key: "followed_id", dependent: :destroy #followed_idは自分

  has_many :followeds, through: :active_relationships, source: :followed #フォローしているユーザを取り出せるようにしている
  #class_nameで便宜的に"User"モデルを分け(followingとfollowed)、followingテーブルーrelationshioテーブルーfollowedテーブルの形を作り、has_many,thoughを使いfollowingテーブルから直接followedテーブルを定義している
  has_many :followings, through: :passive_relationships, source: :following

  def follow(other_user) #ユーザをフォローする
    self.active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user) #ユーザのフォローを外す
    self.active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user) #フォローしているかどうかを確認する(フォローしていたらtrueを返す)
    followeds.include?(other_user) #followedの中にユーザが含まれているかどうか
  end

  has_many :active_notifications, class_name: "Notification",
        foreign_key: "sender_id", dependent: :destroy
  has_many :passive_notifications, class_name: "notification",
        foreign_key: "recipient_id", dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :contacts, dependent: :destroy

end
