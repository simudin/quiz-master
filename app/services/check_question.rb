class CheckQuestion
  def initialize(params)
    @question = params[:card]
    @amount = params[:amount]
    @email = params[:email]
  end
end
