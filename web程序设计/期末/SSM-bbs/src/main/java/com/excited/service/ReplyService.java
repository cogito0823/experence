package com.excited.service;

import com.excited.domain.Reply;

import java.util.List;

public interface ReplyService {
    //添加回复
    public void addReply(Reply reply);
    //按回复Id列出回复
    public List<Reply> listReplyByPostId(int postId);
    //删除回复
    public void deleteReply(int replyId);

    public void doLike(int replyId);

    public void doHate(int replyId);
}
