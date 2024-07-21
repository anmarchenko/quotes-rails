module Companies
  class AssignToQuote
    def initialize(quote:, user:)
      raise "User must be present" unless user
      raise "User must have a company" unless user.company

      @quote = quote
      @user = user
    end

    def call
      @quote.company = @user.company
    end
  end
end
