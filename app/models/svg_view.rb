class SvgView
  def initlaize
    Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
  end
end
