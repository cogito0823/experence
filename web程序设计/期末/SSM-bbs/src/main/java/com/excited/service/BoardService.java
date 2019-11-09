package com.excited.service;

import com.excited.domain.Board;
import java.util.List;

public interface BoardService {
    //按板块名添加板块
    public void addBoardByBoard(Board board);
    //按板块名删除板块
    public void deleteBoardByBoardName(String boardName);
    //列出所有板块
    public List<Board> listAllBoard();
    //按板块ID列出板块下所有主题
    public Board listAllPostOfBoard(int boardId);
    //按板块Id进入板块
    public Board intoBoardByBoardId(int boardId);
    //按板块名进入版块
    public Board intoBoardByBoardName(String boardName);
    //更新版块Id
    public void updatePostNum(int boardId);
    //更新版块描述
    public void updateBoardInfo(Board board);
    //删除板块
    public void deleteBoard(int boardId);
}
