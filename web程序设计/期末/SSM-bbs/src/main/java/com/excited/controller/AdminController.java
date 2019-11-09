package com.excited.controller;

import com.excited.domain.Board;
import com.excited.domain.Post;
import com.excited.domain.User;
import com.excited.service.BoardService;
import com.excited.service.PostService;
import com.excited.service.ReplyService;
import com.excited.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    BoardService boardService;

    @Autowired
    UserService userService;

    @Autowired
    PostService postService;

    @Autowired
    ReplyService replyService;

    // 论坛管理中心
    @RequestMapping(value = "/manageCenter")
    public String manageCenter(HttpServletRequest request) {
        if (request.getSession().getAttribute("username").equals("admin")) {
            return "admin/manageCenter";
        }
        return "redirect:/error";
    }

    // 论坛版块管理中心
    @RequestMapping(value = "/manageBoard")
    public String manageBoard(HttpServletRequest request) {
        if (request.getSession().getAttribute("username").equals("admin")) {
            List<Board> boards = boardService.listAllBoard();
            request.setAttribute("boards", boards);
            return "admin/manageBoard";
        }
        return "redirect:/error";
    }

    // 添加论坛板块
    @RequestMapping(value = "addBoard", method = RequestMethod.POST)
    public String addBoard(Board board, HttpServletRequest request) {
        if (board != null) {
            boardService.addBoardByBoard(board);
            return "redirect:/admin/manageBoard";
        }

        request.getSession().setAttribute("Msg", "添加板块出错！");
        return "admin/error";
    }

    // 修改板块信息
    @RequestMapping(value = "updateBoard", method = RequestMethod.POST)
    public String updateBoard(Board board, HttpServletRequest request) {
        if (board != null) {
            boardService.updateBoardInfo(board);
            // 成功更新数据后跳转页面
            return "redirect:/admin/manageBoard";
        }

        // 更新数据失败跳转到错误页面
        return "redirect:/error";
    }

    // 管理用户信息
    @RequestMapping(value = "manageUser")
    public String manageUser(HttpServletRequest request) {
        List<User> users = userService.getAllUser();
        if (users != null) {
            request.setAttribute("users", users);
            return "/admin/allUserInfo";
        }

        return "redirect:/error";
    }

    // 删除用户
    @RequestMapping(value = "deleteUser")
    public String deleteUser(String userName) {
        userService.deleteUserByUserName(userName);
        return "redirect:/admin/manageUser";
    }

    // 冻结用户
    @RequestMapping(value = "coldUser")
    public String coldUser(String userName){
        User user = userService.getUserByUserName(userName);
        user.setUserState(1);
        userService.updateUserByUserName(user);
        return "redirect:/admin/manageUser";
    }

    //解冻用户
    @RequestMapping(value = "deColdUser")
    public String deColdUser(String userName){
        User user = userService.getUserByUserName(userName);
        user.setUserState(0);
        userService.updateUserByUserName(user);
        return "redirect:/admin/manageUser";
    }

    // 管理发表的主题
    @RequestMapping(value = "managePost")
    public String managePost(HttpServletRequest request) {
        List<Post> posts = postService.listAllPost();
        if (posts != null) {
            request.setAttribute("posts", posts);
            return "/admin/allPostInfo";
        }

        return "redirect:/error";
    }

    // 删除已经发表的主题
    @RequestMapping(value = "deletePost")
    public String deletePost(int postId, int postBoardId) {
        postService.deletePost(postId);
        return "redirect:/board/listPosts-" + postBoardId;
    }

    //加精主题
    @RequestMapping(value = "/doBest")
    public String doBest(int postId){
        postService.doBest(postId);
        return "redirect:/admin/managePost";
    }

    //不加精主题
    @RequestMapping(value = "/deBest")
    public String deBest(int postId){
        postService.deBest(postId);
        return "redirect:/admin/managePost";
    }

    //置顶主题
    @RequestMapping(value = "/doTop")
    public String doTop(int postId){
        postService.doTop(postId);
        return "redirect:/admin/managePost";
    }

    //不置顶主题
    @RequestMapping(value = "/deTop")
    public String deTop(int postId){
        postService.deTop(postId);
        return "redirect:/admin/managePost";
    }

    // 删除回复
    @RequestMapping(value = "deleteReply")
    public String deleteReply(int replyId, int replyPostId) {
        replyService.deleteReply(replyId);
        return "redirect:/post/postContent-" + replyPostId;
    }

    // 删除板块
    @RequestMapping(value = "deleteBoard")
    public String deleteBoard(int boardId) {
        boardService.deleteBoard(boardId);
        return "redirect:manageBoard";
    }
}
