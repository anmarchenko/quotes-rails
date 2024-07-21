class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.order_newest
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
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: t("quotes.created") }
        format.turbo_stream { flash.now[:notice] = t("quotes.created") }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: t("quotes.updated") }
        format.turbo_stream { flash.now[:notice] = t("quotes.updated") }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: t("quotes.destroyed") }
      format.turbo_stream { flash.now[:notice] = t("quotes.destroyed") }
    end
  end

  private

  def set_quote
    @quote = Quote.find(params.fetch(:id))
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
