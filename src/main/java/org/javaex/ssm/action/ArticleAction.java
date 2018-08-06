package org.javaex.ssm.action;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.javaex.ssm.service.ArticleService;
import org.javaex.ssm.service.TypeService;
import org.javaex.ssm.view.Article;
import org.javaex.ssm.view.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("article")
public class ArticleAction {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private TypeService typeService;

    /*查询回收站的文章*/
    @RequestMapping("list_recycle.action")
    public String selectRecycle(ModelMap map,
                                @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                                @RequestParam(value="pageSize", defaultValue="10") int pageSize){
        // pageHelper分页插件
        // 只需要在查询之前调用，传入当前页码，以及每一页显示多少条
        PageHelper.startPage(pageNum,pageSize);
        //查询出的list
        List<Article> list = articleService.selectRecycleArticle();
        //把这个list放入分页插件中
        PageInfo<Article> pageInfo = new PageInfo<>(list);
        //再把分页后的放到map中 在前台以pageInfo.list.属性  这种方式取值
        map.put("typeList",typeService.selectAllType());
        map.put("pageInfo",pageInfo);
        return "admin/article/list_recycle";

    }

    /*查询所有正常的文章*/
    @RequestMapping("list_normal.action")
    public String selectArticle(ModelMap map,
                                @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                                @RequestParam(value="pageSize", defaultValue="10") int pageSize){

        // pageHelper分页插件
        // 只需要在查询之前调用，传入当前页码，以及每一页显示多少条
        PageHelper.startPage(pageNum,pageSize);
        //查询出的list
        List<Article> list = articleService.selectArticle();
        //把这个list放入分页插件中
        PageInfo<Article> pageInfo = new PageInfo<>(list);
        //再把分页后的放到map中 在前台以pageInfo.list.属性  这种方式取值
        map.put("typeList",typeService.selectAllType());
        map.put("pageInfo",pageInfo);
        return "admin/article/list_normal";
    }
    /*编辑文章或新增文章*/
    @RequestMapping("edit.action")
    public String edit(ModelMap map, @RequestParam(required = false ,value = "id")String id){
        //如果不为空 就把选择的文章信息传到页面
        if (!StringUtils.isEmpty(id)){
            Article article = articleService.selectByIdArticle(id);
            map.put("article",article);
        }
        map.put("id",id);
        //如果为空,说明是新增的文章,所有把文章分类传到页面
        map.put("typeList",typeService.selectAllType());
        return "admin/article/edit";
    }
    //保存新增或编辑的文章
    @RequestMapping("save.json")
    @ResponseBody
    public Result saveArticle(Article article){
        articleService.save(article);
        return Result.success("成功");

    }
    /**
     * 上传文件到七牛云
     * @throws IOException
     */
    @RequestMapping("upload.json")
    @ResponseBody
    public Result upload(MultipartFile file) throws IOException {

        /**
         * 构造一个带指定Zone对象的配置类
         * 华东 : Zone.zone0()
         * 华北 : Zone.zone1()
         * 华南 : Zone.zone2()
         * 北美 : Zone.zoneNa0()
         */
        Configuration cfg = new Configuration(Zone.zone0());
        // ...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);
        // ...生成上传凭证，然后准备上传
        String accessKey = "XXXXXXXXXX";
        String secretKey = "XXXXXXXXXXXXXXXXXXXXX";
        String bucket = "XXXXX";
        // 默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;

        String imgUrl = "";
        try {
            // 数据流上传
            InputStream byteInputStream = file.getInputStream();
            Auth auth = Auth.create(accessKey, secretKey);
            String upToken = auth.uploadToken(bucket);
            try {
                Response response = uploadManager.put(byteInputStream, key, upToken, null, null);
                // 解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                System.out.println(putRet.key);
                System.out.println(putRet.hash);
                imgUrl = putRet.hash;
            } catch (QiniuException ex) {
                Response r = ex.response;
                System.err.println(r.toString());
                try {
                    System.err.println(r.bodyString());
                } catch (QiniuException ex2) {
                    // ignore
                }
            }
        } catch (UnsupportedEncodingException ex) {
            // ignore
        }

        return Result.success("成功").add("imgUrl","http://pcvisishu.bkt.clouddn.com/"+ imgUrl);
    }

    //通过关键字和分类搜索文章
    @RequestMapping("search.action")
    public String selectByKeyWord(ModelMap map,
                                  @RequestParam(value="pageNum", defaultValue="1") int pageNum,
                                  @RequestParam(required = false,value = "typeId")String typeId,
                                  @RequestParam(required = false,value = "keyWord")String keyWord ){
        //一页放多少项
        int pageSize = 10;
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
        return "admin/article/list_normal";
    }
    //移动文章所属分类
    @RequestMapping("move.json")
    @ResponseBody
    public Result moveArticleSort( @RequestParam(value = "idArr")String[] idArr,
                                   @RequestParam(value = "typeId")String typeId){
        articleService.moveArticleSort(idArr,typeId);

        return Result.success("批量移动成功");
    }
    //批量删除文章到回收站
    @RequestMapping("deleteManyArticleToRecycle.json")
    @ResponseBody
    public Result deleteManyArticleToRecycle(@RequestParam(value = "idArr")String[] idArr,
                                             @RequestParam(value = "status")String status){
        articleService.deleteManyArticleToRecycle(idArr,status);
        return Result.success("操作成功");
    }
    //彻底删除文章
    @RequestMapping("delete.json")
    @ResponseBody
    public Result deleteArticle(@RequestParam(value = "idArr")String[] idArr){
        articleService.deleteArticle(idArr);
        return Result.success("删除成功");
    }

}
