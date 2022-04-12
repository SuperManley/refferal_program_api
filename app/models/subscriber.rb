class Subscriber < ApplicationRecord
  before_save { email.downcase! }
  has_many :referrals, class_name: "Subscriber", foreign_key: "referrer_id"
  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: {case_sensitive: false}

  # Assign a share key
  before_create do |subscriber|
    subscriber.share_key = generate_unique_key('share_key')
    subscriber.user_key = generate_unique_key('user_key')
    subscriber.prize_sent = false
    subscriber.sent_to_airtable = false
  end

  private

  def generate_unique_key(field_name)
    loop do
      key = SecureRandom.urlsafe_base64(9).gsub(/-|_/,('a'..'z').to_a[rand(26)])
      break key unless Subscriber.exists?("#{field_name}": key)
    end
  end
end
