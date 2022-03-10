class BookAuthorsController < ApplicationController
  before_action :set_book_author, only: %i[ show edit update destroy ]

  # GET /book_authors or /book_authors.json
  def index
    @book_authors = BookAuthor.all
  end

  # GET /book_authors/1 or /book_authors/1.json
  def show
  end

  # GET /book_authors/new
  def new
    @book_author = BookAuthor.new
  end

  # GET /book_authors/1/edit
  def edit
  end

  # POST /book_authors or /book_authors.json
  def create
    @book_author = BookAuthor.new(book_author_params)

    respond_to do |format|
      if @book_author.save
        format.html { redirect_to book_author_url(@book_author), notice: "Book author was successfully created." }
        format.json { render :show, status: :created, location: @book_author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_authors/1 or /book_authors/1.json
  def update
    respond_to do |format|
      if @book_author.update(book_author_params)
        format.html { redirect_to book_author_url(@book_author), notice: "Book author was successfully updated." }
        format.json { render :show, status: :ok, location: @book_author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_authors/1 or /book_authors/1.json
  def destroy
    @book_author.destroy

    respond_to do |format|
      format.html { redirect_to book_authors_url, notice: "Book author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_author
      @book_author = BookAuthor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_author_params
      params.require(:book_author).permit(:book_id, :author_id)
    end
end
