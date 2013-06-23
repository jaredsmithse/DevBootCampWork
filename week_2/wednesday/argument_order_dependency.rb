# original gist : https://gist.github.com/dbc-challenges/493eb0b0eedbd32d8a39


class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(options = {})
    #address, square_feet, num_bedrooms = 3, num_baths = 2, 
    # cost = 320_000, down_payment = 0.20, sold = false, has_tenants = false)
    @address = options.fetch(:address)
    @square_feet = options.fetch(:square_feet)
    @num_bedrooms = options.fetch(:num_bedrooms, 3)
    @num_baths = options.fetch(:num_baths, 2)
    @cost = options.fetch(:cost, 320_000)
    @down_payment = options.fetch(:down_payment, 0.20)
    @sold = options.fetch(:sold, false)
    @short_sale = options.fetch(:short_sale)
    @has_tenants = options.fetch(:has_tenants, false)
  end



  def obscure_address 
    @address.sub(/\A\d*/, '****')
  end

  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end
