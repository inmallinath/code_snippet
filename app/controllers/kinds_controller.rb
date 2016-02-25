class KindsController < ApplicationController
  before_action :set_kind, only: [:show, :library_show]
  before_action :authenticate_user, except: [:index, :show]

  def index
    @kinds = Kind.all
    @snippets = Snippet.where("priv_snippet=?", false)
  end

  def show
    @snippets = Snippet.where("kind_id=? AND priv_snippet=?", params[:id], false)
  end

  def new # A way for the user to add new languages
    @kind = Kind.new
  end

  def create # Action to create new languages
    @kind = Kind.new kind_params
    if @kind.save
      redirect_to root_path, notice: "New language added"
    else
      render :new
    end
  end

  def library_index
    @kinds = Kind.all
  end

  def library_show
    @snippets = Snippet.where("kind_id=? AND user_id=?", params[:id], current_user)
  end

  private

  def set_kind
    @kind = Kind.find(params[:id])
  end

  def kind_params
    params.require(:kind).permit(:language)
  end

end
