require_relative '../../lib/main.rb'

feature 'User interaction' do
  scenario 'Standard account usage' do
    allow(STDOUT).to receive(:puts)
    set_up_account
    make_a_couple_of_deposits
    make_a_withdrawal
    print_bank_statement
  end

  def set_up_account
    @test = Main.new
    expect(@test).to be_truthy
  end

  def make_a_couple_of_deposits
    @test.deposit(100, '21/01/2017')
    @test.deposit(150, '22/01/2017')
    expect(@test.transaction_record.history[-1][:balance]).to eq('250.00')
  end

  def make_a_withdrawal
    @test.withdraw(50, '23/01/2017')
    expect(@test.transaction_record.history[-1][:balance]).to eq('200.00')
  end

  def print_bank_statement
    column_titles = "date || credit || debit || balance\n"
    first_entry = "23/01/2017 ||  || 50.00 || 200.00\n"
    second_entry = "22/01/2017 || 150.00 ||  || 250.00\n"
    third_entry = "21/01/2017 || 100.00 ||  || 100.00\n"
    expected_print_out = column_titles + first_entry + second_entry + third_entry
    expect do
      @test.print_bank_statement
    end.to output(expected_print_out).to_stdout
  end
end
