package org.javaex.ssm.service;

import org.javaex.ssm.dao.ITypeDao;
import org.javaex.ssm.view.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class TypeService {
    @Autowired
    private ITypeDao iTypeDao;

    public List<Type> selectAllType(){
       return iTypeDao.selectAllType();
    }

    public void save(String[] idArr, String[] sortArr, String[] nameArr) {

        for (int i = 0;i<idArr.length;i++){
            if (StringUtils.isEmpty(idArr[i])|| idArr.equals("")){
                iTypeDao.insertType(sortArr[i],nameArr[i]);
            }else {
                iTypeDao.updateType(sortArr[i],nameArr[i],idArr[i]);
            }
        }
    }
    public void  deleteMany(String id){

            iTypeDao.deleteMany(id);

    }

}
