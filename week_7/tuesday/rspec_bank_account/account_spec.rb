require "rspec"

require_relative "account"

describe Account do
  let(:valid_account_number) { '1234567890' }
  let(:account) { Account.new(valid_account_number) }

  describe "#initialize" do
    it "should not allow a negative starting balance" do
      expect {Account.new('1234567890', -10)}.to raise_error InvalidStartingBalanceError
      expect {Account.new('123456789011', 10)}.to_not raise_error InvalidStartingBalanceError
    end

    it "should have a ten digit account number" do
      expect {Account.new('123456789', 10)}.to raise_error InvalidAccountNumberError
      expect {Account.new('123456789011', 10)}.to raise_error InvalidAccountNumberError
      expect {Account.new('1234567890', 10)}.to_not raise_error InvalidAccountNumberError
    end

    it "should accept an integer for the account number" do
      expect {Account.new(1234567890, 10)}.to_not raise_error      
    end
  end

  describe "#transactions" do
    it "should have only starting balance on initialization" do
      account = Account.new(valid_account_number,10)
      expect(account.transactions.size).to eq 1
      expect(account.transactions.last).to eql 10
    end

    it "should correctly log a deposit" do
      account.deposit!(100)
      expect(account.transactions.size).to eql 2
      expect(account.transactions.last).to eql 100
    end

    it "should correctly log a withdrawal" do 
      account = Account.new('1234567890', 100)
      account.withdraw!(100)
      expect(account.transactions.size).to eql 2
      expect(account.transactions.last).to eql -100
    end
  end

  describe "#balance" do

    it "should accurately keep the balance for deposits" do
      account.deposit!(100)
      expect(account.balance).to eql 100
    end

    it "should accurately keep the balance for withdrawals" do
      account = Account.new(1234567890, 100)
      account.withdraw!(100)
      expect(account.balance).to eql 0
    end

    it "should accurately keep the balance for withdrawals and deposits" do
      account = Account.new(1234567890, 1000)
      account.deposit!(100)
      account.withdraw!(900)
      expect(account.balance).to eql 200
    end

    it "should keep decimal precision" do
      account.deposit!(100.50)
      expect(account.balance).to eql 100.50
      account.withdraw!(0.25)
      expect(account.balance).to eql 100.25
    end

  end

  describe "#account_number" do

    it "should not reveal the entire account number" do 
      expect(account.acct_number).to eql "******7890"
    end

  end

  describe "#deposit!" do

    it "should not accept negative amounts" do
      expect {account.deposit!(-100)}.to raise_error NegativeDepositError
    end

  end

  describe "#withdraw!" do

    it "should protect against overdraft" do
      expect {account.withdraw!(100)}.to raise_error OverdraftError
    end
  end
end