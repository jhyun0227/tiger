package com.ch.tiger.dao;
import java.util.List;

import com.ch.tiger.model.Apply;
public interface ApplyDao {
	int getApplyTotal(Apply apply);
	List<Apply> applyList(Apply apply);

}
