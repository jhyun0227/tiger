package com.ch.tiger.service;
import java.util.List;

import com.ch.tiger.model.Apply;
public interface ApplyService {
	int getApplyTotal(Apply apply);
	List<Apply> applyList(Apply apply);

}
