require 'statement_printer'

describe StatementPrinter do
  subject = described_class.new

  it 'should print out the statement prettily' do
    test_array = [{ date: '12/06/2017', credit: 100, debit: nil, balance: 500 }, { date: '13/06/2017', credit: nil, debit: 200, balance: 300 }]
    expect do
      subject.print_statement(test_array)
    end.to output("date || credit || debit || balance\n13/06/2017 ||  || 200 || 300\n12/06/2017 || 100 ||  || 500\n").to_stdout
  end
end
