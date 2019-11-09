package com.excited.service;

import com.excited.domain.Post;

import java.util.List;

public interface PostService {
    //按主题添加主题
    public void addPostByPost(Post post);
    //列出主题下的内容
    public Post listPostContent(int postId);
    //列出所有主题
    public List<Post> listAllPost();
    //删除主题
    public void deletePost(int postId);
    //点赞
    public void doLike(int postId);
    //踩
    public void doHate(int postId);
    //点击量加一
    public void view(int postId);

    public void doBest(int postId);

    public void deBest(int postId);

    public void doTop(int postId);

    public void deTop(int postId);

}
