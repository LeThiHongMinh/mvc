module DiscussionsHelper
    def discussion_author(discussion)
        user_signed_in? && current_user.id == discussion.user_id
    end
    def comment_author(comment)
        user_signed_in? && current_user.id == comment.user_id
    end
end