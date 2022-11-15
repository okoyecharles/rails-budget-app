class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @payments = @category.recent_payments
  end

  def new
    @payment = Payment.new
    @all_categories = current_user.categories
    @category_payment = @payment.category_payments.build
  end

  def create
    payment = Payment.new(payment_params.except(:category_payments))
    payment.author_id = current_user.id

    if payment.save
      payment_params[:category_payments][:category_ids].each do |id|
        payment.category_payments.create(category_id: id) unless id == ''
      end
      redirect_to categories_path, notice: 'Payment successfully created.'
    else
      render :new, error: 'There was a problem creating the payment.'
    end
  end

  private

  def payment_params
    params.require(:new_payment).permit(:name, :amount, category_payments: [category_ids: []])
  end
end
