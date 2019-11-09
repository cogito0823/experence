package com.excited.dao;

import com.excited.domain.Reply;
import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReplyDao {
    public void addReply(Reply reply);

    public List<Reply> listReplyByPostId(int postId);

    public void deleteReplyById(int postId);

    public Reply findReplyByReplyId(int replyId);

    @Delete("update t_reply set reply_good_count = #{replyGoodCount}, reply_bad_count = #{replyBadCount} WHERE t_reply.reply_id = #{replyId}")
    public void updateReplyByReply(Reply reply);
}
