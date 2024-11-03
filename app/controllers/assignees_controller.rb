class AssigneesController < ApplicationController
  before_action :set_assignee, only: %i[ show edit update destroy ]

  # GET /assignees or /assignees.json
  def index
    @assignees = Assignee.all

    respond_to do |format|
      format.html
      format.json { render json: @assignees }
    end
  end

  # GET /assignees/1 or /assignees/1.json
  def show
    @todos = @assignee.todos
  end

  # GET /assignees/new
  def new
    @todo = Todo.new
    @assignee = Assignee.new
  end

  # GET /assignees/1/edit
  def edit
  end

  # POST /assignees or /assignees.json
  def create
    # @todo = Todo.new(todo_params)
    @assignee = Assignee.new(assignee_params)

    respond_to do |format|
      if @assignee.save
        format.html { redirect_to @assignee, notice: "Assignee was successfully created." }
        format.json { render :show, status: :created, location: @assignee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignees/1 or /assignees/1.json
  def update
    respond_to do |format|
      if @assignee.update(assignee_params)
        format.html { redirect_to @assignee, notice: "Assignee was successfully updated." }
        format.json { render :show, status: :ok, location: @assignee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignees/1 or /assignees/1.json
  def destroy
    @assignee.destroy!

    respond_to do |format|
      format.html { redirect_to assignees_path, status: :see_other, notice: "Assignee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignee
      @assignee = Assignee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignee_params
      params.require(:assignee).permit(:name, :email)
    end
end
