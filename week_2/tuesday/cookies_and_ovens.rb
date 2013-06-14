# original gist : https://gist.github.com/f6cc51245aee1743a4a5



class Baker

  def initialize(bakers_oven)
    @oven = bakers_oven
    @batch = []
  end

  def make_batch(batch_of_cookies)
    batch_of_cookies.each do |cookie|
      @batch << cookie
    end
  end

  def bake
    @oven.bake(@batch)
  end

  def cookies_ready?
    (@oven.peek_status == :burned || @oven.peek_status == :ready) ? true : false
  end

  def take_from_oven
    @oven.give_back_cookies
  end

  # def to_s
  #   @batch.each do |cookie|
  #     puts "#{cookie.type}: #{cookie.status}"
  #   end
  # end

end


class Cookie
  attr_reader :type, :time
  attr_accessor :status
  def initialize(type, time)
    @type = type
    @status = :doughy
    @time = time
  end

  def give_status
    @status
  end

  def change_status(time_cooked)
    if time_cooked > time
      @status = :burned
    elsif time_cooked < 2
      @status = :doughy
    elsif time_cooked == time
      @status = :ready
    elsif time_cooked < time
      @status = :almost_ready
    end
  end

  def to_s
    "#{self.type}: #{self.status}"
  end
end


class Oven
  def initialize(max_batches = 1)
    @max_batches = max_batches
    @time_cooked = 0
  end

  def bake(batch)
    @batch = batch

    sleep(1)
    @batch.each {|cookie| cookie.change_status(@time_cooked)}
    @time_cooked += rand(0..2)
    p batch[0].status
  end

  def give_back_cookies
    @batch
  end

  def peek_status
    @batch[0].give_status
  end


end

#DRIVER CODE
oven = Oven.new
fred = Baker.new(oven)

fred.make_batch([Cookie.new('chocolate chip', 6), Cookie.new('oatmeal', 6)])

p "Placing cookies in Oven"
fred.bake
until fred.cookies_ready?
  p "cooking"
  fred.bake
end
puts fred.take_from_oven




