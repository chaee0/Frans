package com.frans.schedule.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frans.schedule.dao.FacilitiesDAO;

@Service
public class FacilitiesService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired FacilitiesDAO dao;
	
	
	
}
