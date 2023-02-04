class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit update destroy]

  def index
    @invoices = Invoice.all
  end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to invoices_path, notice: 'Invoice was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @invoice.update(invoice_params)
      redirect_to invoices_path, notice: 'Invoice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path, notice: 'Invoice was successfully destroyed.'
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params; end
end
