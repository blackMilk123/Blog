package org.javaex.ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.javaex.ssm.view.Article;
import org.javaex.ssm.view.Type;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IArticleDao {
    //查询所有正常的文章
     List<Article> selectArticle();
     //查询回收站的文章
    List<Article> selectRecycleArticle();
     //更新文章
     int updateArticle(Article article);

     //新增文章
    int addArticle(Article article);
    //通过id查询文章的内容
    Article selectByIdArticle(String id);
    //通过关键字和分类查询文章
    List<Article>selectByKeyWord(@Param("keyWord") String keyWord,
                                 @Param("typeId")String typeId);
    /*批量移动文章所属分类*/
    int moveArticleSort(@Param("id") String id,
                        @Param("typeId")String typeId);
    //删除文章到回收站
    int deleteManyArticleToRecycle(@Param("id") String id,
                                   @Param("status")String status);
    //彻底删除文章
    int deleteArticle(String id);
    //查询某一分类的所有文章
    List<Article> selectArticleByType(String typeId);

    //删除某一分类下回收站的文章
    int deleteByTypeInRecycle(@Param("typeId") String typeId);

}
