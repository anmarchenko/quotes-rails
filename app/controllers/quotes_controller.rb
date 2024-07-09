class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: t("quotes.created")
    else
      p @quote.errors.any?
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: t("quotes.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: t("quotes.destroyed")
  end

  private

  def set_quote
    @quote = Quote.find(params.fetch(:id))
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
