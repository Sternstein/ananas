class Post < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "850x425>" }, default_url: "/images/post/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  belongs_to :category, counter_cache: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :sinopsis, :body, :title, presence: true
  validates :user, presence: true
  validates :category_id, presence: true
  validates :category, presence: true
  validates :avatar, attachment_presence: true

  def self.best_weekly
    where('created_at > ?', 1.week.ago).order(impressions: :desc).limit(10)
  end
end
