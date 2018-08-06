package org.javaex.ssm.action;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.javaex.ssm.service.ArticleService;
import org.javaex.ssm.service.TypeService;
import org.javaex.ssm.view.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("portal")
public class PortalAction {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private TypeService typeService;

    @RequestMapping("about.action")
    public String about(){
        return "portal/about";
    }
    /*文章检索*/
    @RequestMapping("search.action")
    public String search(ModelMap map,
                         @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                         @RequestParam(value="pageSize", defaultValue="10") int pageSize,
                         @RequestParam(required = false,value = "typeId")String typeId,
                         @RequestParam(required = false,value = "keyWord")String keyWord){
        // pageHelper分页插件
        // 只需要在查询之前调用，传入当前页码，以及每一页显示多少条
        PageHelper.startPage(pageNum,pageSize);
        //查询出的list
        List<Article> list = articleService.selectByKeyWord(keyWord, typeId);
        //把这个list放入分页插件中
        PageInfo<Article> pageInfo = new PageInfo<>(list);
        //再把分页后的放到map中 在前台以pageInfo.list.属性  这种方式取值
        map.put("typeList",typeService.selectAllType());
        map.put("pageInfo",pageInfo);
        return "portal/search";
    }

    /*显示文章到首页*/
    @RequestMapping("index.action")
    public String index(ModelMap map,
                        @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                        @RequestParam(value="pageSize", defaultValue="10") int pageSize){
        // pageHelper分页插件
        // 只需要在查询之前调用，传入当前页码，以及每一页显示多少条
        PageHelper.startPage(pageNum,pageSize);
        List<Article> list = articleService.selectArticle();
        PageInfo<Article> pageInfo = new PageInfo<>(list);
        //再把分页后的放到map中 在前台以pageInfo.list.属性  这种方式取值
        map.put("pageInfo",pageInfo);
        return "portal/index";
    }
    /*打开文章详情页
    * 通过文章的id*/
    @RequestMapping("article.action")
    public String articleList(ModelMap map,
                               @RequestParam(required = false,value = "id")String id){
        Article article = articleService.selectByIdArticle(id);
        map.put("articleInfo",article);
        return "portal/article";
    }
    /*查询该分类下的所有文章*/
    @RequestMapping("type.action")
    public String typeArticle(ModelMap map,
                              @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                              @RequestParam(value="pageSize", defaultValue="10") int pageSize,
                              @RequestParam(value = "typeId")String typeId){
        // pageHelper分页插件
        // 只需要在查询之前调用，传入当前页码，以及每一页显示多少条
        PageHelper.startPage(pageNum,pageSize);
        List<Article> list = articleService.selectArticleByType(typeId);
        PageInfo<Article> pageInfo = new PageInfo<>(list);
        //再把分页后的放到map中 在前台以pageInfo.list.属性  这种方式取值
        map.put("pageInfo",pageInfo);
        return "portal/type";
    }

}
