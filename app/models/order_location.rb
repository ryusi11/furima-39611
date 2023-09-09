class OrderLocation
  include ActiveModel::Model
  attr_accessor :code, :place_id, :city, :street, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :code, format: { with: /\A\d{3}-\d{4}\z/, message: "should be in the format of '3 digits - 4 digits'" }
    validates :place_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :city
    validates :street
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits" }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Location.create(code: code, place_id: place_id, city: city, street: street, building: building, phone: phone)
  end

end