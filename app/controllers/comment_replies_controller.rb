class CommentRepliesController < ApplicationController
  before_action :authenticate_launcher!
	def new
		@comment_id = params[:id]
		@comment_reply = CommentReply.new
	end
	
	def create
		current_launcher.comment_replies.create(comment_reply_params)
		redirect_to request.referrer
	end

	def like_comment_reply
    @comment_reply_like = current_launcher.comment_reply_likes.find_or_create_by(comment_reply_id: params[:id])
    @comment_reply_like.is_liked = true
    @comment_reply_like.save
    redirect_to request.referrer
  end

  def unlike_comment_reply
    # current_launcher.comment_likes.find_by(likeable_id: params[:id],likeable_type: 'Comment').try(:destroy)
    @comment_reply_like = current_launcher.comment_reply_likes.find_or_create_by(comment_reply_id: params[:id])
    @comment_reply_like.is_liked = false
    @comment_reply_like.save
    redirect_to request.referrer
  end

	private
		# Never trust parameters from the scary internet, only allow the white list through.
    def comment_reply_params
      params.require(:comment_reply).permit(:comment_id, :description)
    end
end
