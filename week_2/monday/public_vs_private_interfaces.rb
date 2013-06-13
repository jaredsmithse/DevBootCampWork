# no original gist

class BankAccount
  attr_reader :customer_name, :type

  def initialize(name, account_type, account_number)
    @customer_name = name
    @type = account_type
    @acct_number = account_number
  end

  def to_s
    "#{@customer_name}: #{@type.capitalize}# *****#{@acct_number.gsub("-","")[-4..-1]}"
  end

  def acct_number
    obfuscated = "*****#{@acct_number.gsub('-', '')[-4..-1]}"
  end

end

my_acct = BankAccount.new("Junipero Serra", "Checking", "347-923-239")
p my_acct.to_s
p my_acct.customer_name
p my_acct.type
p my_acct.acct_number