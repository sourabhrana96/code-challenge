class Company < ApplicationRecord
  has_rich_text :description
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/,
                  message: "addresses for a Company should only be a @getmainstreet.com domain", allow_blank: true }

end
