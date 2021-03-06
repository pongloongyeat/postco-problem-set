class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_branch!, except: [:new, :create, :summary]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    # Since form submits a string, in format 
    # {branch_id} - {branch_name} i.e. ^[0-9] - [a-zA-Z0-9]*$
    # Let's strip the " - {branch_name}" part.
    # Note this is a workaround and will give a
    # warning since we're parsing a string into
    # an integer field.
    @customer.branch_id = customer_params["branch_id"].to_i
    @customer.save

    respond_to do |format|
      if @customer.save
        redirect_url = "/customers/summary?full_name=" + @customer.full_name + "&nric_num=" + @customer.nric_num + "&temperature=" + @customer.temperature.to_s + "&branch_id=" + @customer.branch_id.to_s
        format.html { redirect_to redirect_url, notice: 'Your response has been recorded! Thank you for shopping with Tapir Grocer.' }
        format.json { render :summary, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def summary
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      if request.env['PATH_INFO'] != "/customers/summary" || request.env['PATH_INFO'] != "/customers/qrcode" 
        @customer = Customer.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:full_name, :nric_num, :temperature, :branch_id)
    end
end
