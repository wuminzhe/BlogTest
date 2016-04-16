module PostsHelper
  # 缓存key
  def cache_key_for_top3_comments(post_id)
    max_updated_at = Post.maximum(:created_at).try(:utc).try(:to_s, :number)
    "posts/top3-comments-#{max_updated_at}"
  end
end
