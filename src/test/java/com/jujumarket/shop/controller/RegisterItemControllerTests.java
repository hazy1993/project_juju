package com.jujumarket.shop.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class RegisterItemControllerTests {

	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
	public void testList() throws Exception {
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/shop/list"))
			.andReturn()
			.getModelAndView()
			.getModelMap()
		);
	}
	
//	@Test
	public void testRegister() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/shop/register")
				.param("itemCode", "test11")
				.param("itemName", "�뀒�뒪�듃 item ")
				.param("itemContent", "�뀒�뒪�듃 �뀋�씠�뀥 留쏆쥕�븘�슂~")
				.param("price", "1233")
				.param("normPrice", "123444")
				.param("stock", "123")
				.param("dispStat", "n")
				.param("saleStat", "user00")
				.param("itemChr", "user00")
				.param("itemImg", "user00")
				.param("classCode", "user00")
				.param("IDno", "user00")
				.param("writer", "user00")
			).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
//	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/shop/get")
				.param("itemCode", "1"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
//	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/shop/modify")
						.param("itemCode", "7")
						.param("itemName", "臾댁슦 �닔�젙 ")
						.param("itemContent", "臾댁슦 �닔�젙�릺�뿀�쓬")
						.param("price", "1233")
						.param("normPrice", "1234")
						.param("stock", "230")
						.param("dispStat", "n")
						.param("saleStat", "user11")
						.param("itemChr", "user11")
						.param("itemImg", "user11")
						.param("classCode", "user11")
						.param("IDno", "user11"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
//	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/shop/remove")
				.param("itemCode", "5")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testListPaging() throws Exception {
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/shop/list")
				.param("pageNum", "2")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testFullPath() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/shop/get")
				.param("itemCode", "item000041"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
}
