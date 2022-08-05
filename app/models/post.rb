class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validate :fiction_or_nonfiction
    validate :clickbait

    def fiction_or_nonfiction
        unless self.category == "Fiction" || self.category == "Non-Fiction"
            errors.add(:category, "is not included in the list")
        end
    end

    def clickbait
        if title == "True Facts"
            errors.add(:title, "must be clickbait")
        end
    end
end
