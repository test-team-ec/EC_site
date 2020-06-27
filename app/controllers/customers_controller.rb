class CustomersController < ApplicationController
  def show
  	@customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def edit_password
    @customer = current_customer
  end

  def update
  	@customer = current_customer
  	@customer.update(customer_params)
  	redirect_to customers_path
  end

  def delete
  	@customer = current_customer
  end

  def destroy
  	@customer = current_customer
    # 論理削除に合わせて、会員ステータスを退会済に変更させる
   	@customer.update(is_active: "退会済")
  	@customer.destroy
  	redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_phonetic,
      :first_name_phonetic, :tel, :postcode, :address, :email, :password, :is_active)
  end
end
