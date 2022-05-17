package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.domain.Criteria;
import com.product.domain.PayInfoVO;
import com.product.domain.ProductDtlVO;
import com.product.domain.ProductVO;
import com.product.domain.SellStatusVO;
import com.product.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public ProductVO get(int prod_no) {
			ProductVO product=productMapper.read(prod_no);
				return product;
	}
	@Override
	public List<ProductVO> getList(Criteria cri) {
		System.out.println(cri);
		return productMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return productMapper.getTotalCount(cri);
	}

	@Override
	public List<ProductVO> getCate(Criteria cri) {
		System.out.println(cri);
		return productMapper.getListWithCate(cri);
	}


	@Override
	public boolean sellProd(List<ProductVO> prod_no) {
		
		return productMapper.sellProd(prod_no) == 1;
	}


	@Override
	public List<ProductVO> getArtistProdList(Criteria cri) {
		
		return productMapper.getListWithArtist(cri);
	}


	@Override
	public String getOwner(int prod_no) {
		
		return productMapper.getOwner(prod_no);
	}


	@Override
	public String getIdUser(String id) {
		
		return productMapper.getIdUser(id);
	}


	@Override
	public List<ProductVO> getOwnList(Criteria cri) {
		return productMapper.getListWithOwn(cri);
	}


	@Override
	public List<SellStatusVO> getSellList(SellStatusVO vo) {
				
				List<SellStatusVO> list = productMapper.getSellList(vo);
		return  list;
	}


	@Override
	public SellStatusVO getBidPrice(SellStatusVO vo) {

		vo = productMapper.getBidPrice(vo);	
		
		return vo;
	}


	@Override
	public SellStatusVO getProd_dtl(SellStatusVO vo) {
		
			vo = productMapper.getProd_dtl(vo);
		return vo;
	}


	@Override
	public int changeBid(SellStatusVO vo) {
			int result = productMapper.changeBid(vo);
		return result;
	}


	@Override
	public int getBalance(SellStatusVO vo) {
		int balance = productMapper.getBalance(vo);
				return balance;
	}


	@Override
	public int deduct(int leftover,String id) {
		int result = productMapper.deduct(leftover,id);
		return result;
	}


	@Override
	public void changeOwner(SellStatusVO vo) {

		int result = productMapper.changeOwner(vo);
		
		
	}


	@Override
	public String findSeller(int buyer_tel) {
		String seller = productMapper.findSeller(buyer_tel);
		return seller;
	}


	@Override
	public int updateOwner(PayInfoVO info) {
		int result = productMapper.updateOwner(info);
		return result;
	}


	@Override
	public int InsHistory(PayInfoVO info) {
	int result=	productMapper.insHistory(info);
		return result;
	}


	@Override
	public List<String> getOwners(ProductVO product) {
		
		List<String> owners = productMapper.getOwners(product);
		
		return owners;
	}
	@Override
	public ProductVO getProd_info(String prod_name, String prod_artist) {
		ProductVO product = productMapper.getProd_info(prod_name,prod_artist);
		return product;
	}





	

}
