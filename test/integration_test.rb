require_relative "test_helper"

# For capybara DSL info:
# https://github.com/jnicklas/capybara#the-dsl

module Bootstrap

  describe Application do
    it "shows a home page" do
      visit "/"
      page.must_have_content "Bootstrap"
    end
  end

end