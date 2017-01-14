module ArticlesHelper
  def persisted_comments(comments)
    comments.reject do |comment|
      comment.new_record?
    end
  end
end
