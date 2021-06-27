class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) } 
  validate :my_method

  def my_method
    if title.present?
      tester = title.split
      if tester.include?("Won't") && tester.include?("Believe")
      else
        errors.add(:title, "Clickbait Please")
      end
    end
  end
end
