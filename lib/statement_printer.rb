# StatementPrinter
class StatementPrinter
  def print_statement(entries)
    print_columns
    print_transactions(entries)
    nil
  end

  private

  def print_columns
    puts 'date || credit || debit || balance'
  end

  def reverse_by_chronological_order(entries)
    entries.sort { |a, b| a[:date] <=> b[:date] }.reverse
  end

  def print_transactions(entries)
    sorted = reverse_by_chronological_order(entries)
    sorted.each do |transaction|
      puts transaction[:date] + ' || ' + transaction[:credit].to_s + ' || ' + transaction[:debit].to_s + ' || ' + transaction[:balance].to_s
    end
  end
end
