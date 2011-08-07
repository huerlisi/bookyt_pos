# Point of Sale
# =============

current_assets  = AccountType.find_by_name('current_assets')
outside_capital = AccountType.find_by_name('outside_capital')

# Accounts
Account.create!([
  {:code => "1010", :title => "Kasse Laden", :account_type => current_assets},
  {:code => "1021", :title => "EFT Kontokorrent", :account_type => current_assets},
  {:code => "2001", :title => "Ausstehende Gutscheine", :account_type => outside_capital},
])

# Booking Templates
BookingTemplate.create!([
  {:code => "day:cash", :title => "Bareinnahmen", :debit_account => Account.find_by_code("3200"), :credit_account => Account.find_by_code("1010")},
  {:code => "day:card turnover", :title => "Kreditkarten Einnahmen", :debit_account => Account.find_by_code("3200"), :credit_account => Account.find_by_code("1021")},
  {:code => "day:expenses", :title => "Barausgabe", :debit_account => Account.find_by_code("1010"), :credit_account => Account.find_by_code("1000")},
  {:code => "day:credit turnover", :title => "Kredit", :debit_account => Account.find_by_code("3200"), :credit_account => Account.find_by_code("1100")},
  {:code => "day:voucher sold", :title => "Gutschein ausgestellt", :debit_account => Account.find_by_code("2001"), :credit_account => Account.find_by_code("1010")},
  {:code => "day:voucher cashed", :title => "Gutschein eingelöst", :debit_account => Account.find_by_code("3200"), :credit_account => Account.find_by_code("2001")},
])
