class PrototypesController < ApplicationController
before_action :prototype_find_id, only: [:edit, :show, :update]
before_action :authenticate_user!, only: [:new, :edit, :destroy]
before_action :move_to_root, only: :edit

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.all
  end

  private
  def prototype_find_id
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_root
    unless user_signed_in? && current_user == @prototype.user
      redirect_to action: :index
    end
  end
end
