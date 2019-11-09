package com.excited.service.Impl;

import com.excited.dao.BoardDao;
import com.excited.dao.PostDao;
import com.excited.domain.Board;
import com.excited.domain.Post;
import com.excited.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    PostDao postDao;

    @Autowired
    BoardDao boardDao;

    @Override
    public void addPostByPost(Post post) {
        postDao.addPost(post);
    }

    @Override
    public Post listPostContent(int postId) {
        return postDao.findPostByPostId(postId);
    }

    @Override
    public List<Post> listAllPost() {
        return postDao.listAllPostInfo();
    }

    @Override
    public void deletePost(int postId) {
        // 更新Board数据
        int boardId = postDao.findPostByPostId(postId).getPostBoardId();
        Board board = boardDao.findBoardByBoardId(boardId);
        board.setBoardPostNum(board.getBoardPostNum() - 1);
        boardDao.updateBoardByBoard(board);

        // 删除post
        postDao.deletePostById(postId);
    }
    @Override
    public void doLike(int postId){
        Post post = postDao.findPostByPostId(postId);
        post.setPostGoodCount(post.getPostGoodCount()+1);
        postDao.updatePostByPost(post);
    }
    @Override
    public void doHate(int postId){
        Post post = postDao.findPostByPostId(postId);
        post.setPostBadCount(post.getPostBadCount()+1);
        postDao.updatePostByPost(post);
    }
    @Override
    public void view(int postId){
        Post post = postDao.findPostByPostId(postId);
        post.setPostViewCount(post.getPostViewCount()+1);
        postDao.updatePostByPost(post);
    }

    @Override
    public void doBest(int postId){
        Post post = postDao.findPostByPostId(postId);
        post.setPostIfBest(1);
        postDao.updatePostByPost(post);
    }

    @Override
    public void deBest(int postId){
        Post post = postDao.findPostByPostId(postId);
        post.setPostIfBest(0);
        postDao.updatePostByPost(post);
    }

    @Override
    public void doTop(int postId){
        Post post = postDao.findPostByPostId(postId);
        post.setPostIfTop(1);
        postDao.updatePostByPost(post);
    }

    @Override
    public void deTop(int postId){
        Post post = postDao.findPostByPostId(postId);
        post.setPostIfTop(0);
        postDao.updatePostByPost(post);
    }
}
