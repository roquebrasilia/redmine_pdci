class TbPollsController < ApplicationController
  unloadable
  
  respond_to :html, :json
  respond_to :js, only: [:show, :new, :create, :edit, :update, :destroy, :vote]

  before_filter :find_project_by_project_id
  before_filter :find_tb_poll, only: [:show, :edit, :update, :destroy, :vote]
  before_filter :authorize

  include SortHelper
  helper :sort

  def index
    sort_init "updated_at"
    sort_update %w(question yes no created_at updated_at)
    @tb_poll_pages, @tb_polls = paginate TbPoll.where(project_id: @project).order(sort_clause)
    respond_with @tb_polls
  end

  def show
    respond_with @tb_poll
  end

  def new
    @tb_poll = TbPoll.new
    respond_with @tb_poll
  end

  def edit
    respond_with @tb_poll
  end

  def create
    @tb_poll = TbPoll.new(params[:tb_poll])
    @tb_poll.project = @project
    @tb_poll.author = User.current
    if @tb_poll.save && !request.xhr?
      flash[:notice] = l(:label_tb_poll_created)
    end
    respond_with @tb_poll
  end

  def update
    if @tb_poll.update_attributes(params[:tb_poll]) && !request.xhr?
      flash[:notice] = l(:label_tb_poll_updated)
    end
    respond_with @tb_poll
  end

  def destroy
    @tb_poll.destroy
    flash[:notice] = l(:label_tb_poll_deleted) unless request.xhr?
    respond_with @tb_poll, location: tb_polls_path
  end

  # Override url/path convenience methods options to include project
  def url_options
    super.reverse_merge project_id: @project
  end

  
  def vote
  @tb_poll.vote params[:answer]
  flash[:notice] = "Voted #{params[:answer]}" if @tb_poll.save && !request.xhr?
    respond_with(@tb_poll) do |format|
      format.js { render action: :show }
    end
  end

  private
  def find_tb_poll
    @tb_poll = TbPoll.find(params[:id])
    render_404 unless @tb_poll.project_id == @project.id
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
