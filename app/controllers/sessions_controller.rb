class SessionsController < ApplicationController
  def new
  end

  def create
    @employee = Employee.find_by_email params[:email]
    if @employee&.authenticate(params[:password])
      session[:employee_id] = @employee.id
      flash[:success] = "Welcome #{@employee.username}."
      redirect_to @employee
    else
      flash[:danger] = "Email or password is invalid."
      render :new, status: :unauthorized
    end
  end
end
