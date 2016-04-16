class CommentsController < ApplicationController
  delegate "time_ago_in_words", :to => "ActionController::Base.helpers"

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        json_h = @comment.attributes
        json_h[:created_at] = time_ago_in_words(@comment.created_at)
        format.json { render json: json_h }
      else
        format.html { render :new }
        format.json { render json: @comment.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user, :body, :publication_id, :publication_type)
    end
end
