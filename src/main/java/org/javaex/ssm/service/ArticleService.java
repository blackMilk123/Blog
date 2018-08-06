package org.javaex.ssm.service;

import org.javaex.ssm.dao.IArticleDao;
import org.javaex.ssm.view.Article;
import org.javaex.ssm.view.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service
public class ArticleService {
    @Autowired
    private IArticleDao articleDao;
    //查询所有正常的文章
    public List<Article> selectArticle(){
        return articleDao.selectArticle();
    }
    //查询所有回收站的文章
    public List<Article> selectRecycleArticle(){
        return articleDao.selectRecycleArticle();
    }
    //通过关键字查询文章
    public  List<Article> selectByKeyWord(String keyWord ,String typeId){
        keyWord = keyWord.trim();
        keyWord = "%"+keyWord+"%";
        return articleDao.selectByKeyWord(keyWord,typeId);
    }
    //添加或更新文章
    public Result save(Article article){
        //判断是否id为空

        if (StringUtils.isEmpty(article.getId())){
            article.setCreateTime(new Date());
            article.setStatus("1");
            System.out.println("图片路径"+article.getImagePath());
            articleDao.addArticle(article);
            //新增文章
        }else{
            //更新文章
            System.out.println("测试id"+article.getId());
            article.setUpdateTime(new Date());
            articleDao.updateArticle(article);
        }
        return Result.success("成功");

    }
    //通过id查询特定文章内容
    public Article selectByIdArticle(String id){
        return articleDao.selectByIdArticle(id);

    }
    //批量移动文章所属分类
    public void moveArticleSort(String[] idArr,String typeId){
        for (int i = 0;i<idArr.length;i++){
            articleDao.moveArticleSort(idArr[i], typeId);
        }

    }
    //删除文章到回收站
    public  void deleteManyArticleToRecycle(String[] idArr,String status){
        for (int i = 0;i<idArr.length;i++){
            articleDao.deleteManyArticleToRecycle(idArr[i],status);
        }
    }
    public void  deleteArticle(String[] idArr){
        for (int i = 0;i<idArr.length;i++){
            articleDao.deleteArticle(idArr[i]);
        }

    }
    //查询某一分类下的所有文章
    public List<Article> selectArticleByType(String typeId){
        List<Article> list = articleDao.selectArticleByType(typeId);
        return list;
    }
    //删除某一分类下回收站的文章
    public void deleteByTypeInRecycle(String typeId){

        articleDao.deleteByTypeInRecycle(typeId);

    }
}
