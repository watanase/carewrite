class UsersController < ApplicationController
  before_action :company_check, only: %i[new create edit update]
  before_action :set_user, only: %i[show edit update move_out, archives]
  before_action :select_company, only: %i[new create edit update show]
  before_action :move_to_index, only: %i[show]

  def new
    @user = User.new
    @group = Group.new
    @users = User.where(company_id: current_company.id)
  end

  def create
    # binding.pry
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # binding.pry
    @family = Family.new
    @families = @user.families.all
  end

  def edit
    @users = User.where(company_id: current_company.id)
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def move_out
    @user.update_attributes(status: 2, group_id: nil)
    redirect_to user_path(@user)
  end


  def archives
    @company = Company.find(current_company.id)
    @group = Group.new
    @archives = @user.devide_monthly
    @yyyymm = params[:yyyymm]
    @posts = @user.posts.group_by {|post| post.datetime.strftime('%Y%m')[@yyyymm] \
      .sort_by! {|post| post[:datetime]}}.reverse
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def select_company
    if logged_in_company?
      @company = Company.find_by(id: current_company.id)
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :hurigana,
      :gender,
      :birthday,
      :zipcode,
      :street_address,
      :image,
      :care_required,
      :status,
      :occupancy,
      :room_number,
      :password,
      :password_confirmation,
      :group_id,
    ).merge(company_id: current_company.id)
  end

  def company_check
    redirect_to login_company_path unless logged_in_company?
  end
end
