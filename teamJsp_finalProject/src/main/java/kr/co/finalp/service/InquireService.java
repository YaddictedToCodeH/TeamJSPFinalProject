package kr.co.finalp.service;

import java.util.List;

import kr.co.finalp.dto.InquireDTO;

public interface InquireService {
	public List<InquireDTO> readAll(int startNo, int endNo);
	public void write(InquireDTO dto);
	public InquireDTO readOne(int bno);
	public void modify(InquireDTO dto);
	public void remove(int bno);
	public int getTotal();
}
