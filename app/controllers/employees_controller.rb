class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      #TODO send email confirmation
      flash[:success] = "Please check your email to confirm your account."
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  private
  
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
