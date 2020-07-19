class Company < ApplicationRecord
  has_rich_text :description
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@getmainstreet\.com\z/,
                  message: "addresses for a Company should only be a @getmainstreet.com domain", allow_blank: true }

  validates_length_of :zip_code, minimum: 5, maximum: 5, allow_blank: false, message: "is not valid!"

  before_save :set_or_update_city_and_state

  def set_or_update_city_and_state
   return {} unless self.zip_code.present?
   zip_data = ZipCodes.identify(self.zip_code)
    if zip_data
      self.city = zip_data[:city]
      self.state = zip_data[:state_code]
   end
  end
end
