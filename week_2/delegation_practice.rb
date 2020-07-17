class CEO

  def initialize(coo = Coo.new) #called dependency injection
    @coo = coo
  end

  def make_company_efficient(coo: COO)
    # coo = Coo.new
    @coo.find_company_savings
  end

end

class Coo

  def find_company_savings
    sell_old_equipment
    reduce_entertainment_budget
    hr_savings
  end

  def sell_old_equipment;  end

  def reduce_entertainment_budget;  end

  def hr_savings(hr: HR_Manager)
    @hr = hr.new
    @hr.reduce_payroll
  end
end

class HR_Manager

  def initialize
    @employees = { ryan: 7,
                  jess: 8,
                  brian: 4,
                  daniel: 10,
                  tim: 6
  }
  end

  def reduce_payroll
    @employees.delete_if { |name, value| value <= 7 }
  end
end
