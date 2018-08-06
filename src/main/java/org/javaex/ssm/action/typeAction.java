package org.javaex.ssm.action;

import org.javaex.ssm.service.ArticleService;
import org.javaex.ssm.service.TypeService;
import org.javaex.ssm.view.Article;
import org.javaex.ssm.view.Result;
import org.javaex.ssm.view.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("type")
public class typeAction {
    @Autowired
    private TypeService typeService;
    @Autowired
    private ArticleService articleService;

    /*查看所有的分类*/
    @RequestMapping("allType.action")
    public String selectAllType(ModelMap map){
        List<Type> list = typeService.selectAllType();
        map.put("list",list);
        return "admin/type/type";

    }
    /*查看所有的分类 用于ajax请求在页面加载时显示分类数据*/
    @RequestMapping("allTypeAjax.json")
    @ResponseBody
    public List<Type> selectAllTypeAjax(){
        List<Type> list = typeService.selectAllType();
        return list;

    }
    /*批量保存分类*/
    @RequestMapping("save.json")
    @ResponseBody
    public Result save(
            @RequestParam(value = "idArr")String[] idArr,
            @RequestParam(value = "sortArr")String[] sortArr,
            @RequestParam(value = "nameArr")String[] nameArr){
        typeService.save(idArr,sortArr,nameArr);
        return Result.success("保存成功");
    }
    @ResponseBody
    @RequestMapping("manyDelete.json")
    public Result manyDelete(@RequestParam(value = "idArr")String[] idArr){

        //首先判断所选择的所有分类是否有文章
        //只要一个分类有,则直接返回一个异常信息 不允许删除
        for (int x = 0;x<idArr.length;x++){

            List<Article> list = articleService.selectArticleByType(idArr[x]);
            //不为空说明有文章
            if (!list.isEmpty()){
                return Result.error("所选的分类中有文章,不允许删除");
            }
        }
        //遍历完说明所有的分类都为空 开始删除
        for (int i =0 ;i<idArr.length;i++){
                //把回收站中属于该分类的文章先删除
                articleService.deleteByTypeInRecycle(idArr[i]);
                //再删除分类
                typeService.deleteMany(idArr[i]);
        }
        return Result.success("删除成功");

    }
}
