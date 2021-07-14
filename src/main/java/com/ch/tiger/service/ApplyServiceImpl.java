package com.ch.tiger.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.tiger.dao.ApplyDao;
import com.ch.tiger.model.Apply;
@Service
public class ApplyServiceImpl implements ApplyService {
	@Autowired
	private ApplyDao ad;
	@Override
	public int getApplyTotal(Apply apply) {
		return ad.getApplyTotal(apply);
	}
	@Override
	public List<Apply> applyList(Apply apply) {
		return ad.applyList(apply);
	}
}
