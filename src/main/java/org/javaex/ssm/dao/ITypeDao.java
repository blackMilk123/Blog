package org.javaex.ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.javaex.ssm.view.Type;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ITypeDao {
    /*查询所有分类*/

    public List<Type> selectAllType();

    //插入数据
    public int insertType(@Param("sort")String sort,
                      @Param("typeName")String typeName);
    //更新数据
    public int updateType(@Param("sort")String sort,
                      @Param("typeName")String typeName, @Param("id")String id);
    //删除数据
    public  int deleteMany(@Param("id")String id);
}
