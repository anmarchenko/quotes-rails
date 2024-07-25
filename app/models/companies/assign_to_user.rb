module Companies
  class AssignToUser
    def initialize(user)
      @user = user
    end

    def call
      # always assign to KPMG
      @user.company = Company.find_by(name: "KPMG")
    end
  end
end
