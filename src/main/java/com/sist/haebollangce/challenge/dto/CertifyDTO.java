package com.sist.haebollangce.challenge.dto;

public class CertifyDTO {

	private String certify_no;			// 인증일련번호
	private String fk_userid;			// 회원 아이디
	private String fk_challenge_code;	// 챌린지 일련번호
	private String certify_time; 		// 인증시각
	private String certify_img; 		// 인증사진 파일명
	
	
	
	public String getCertify_no() {
		return certify_no;
	}
	public void setCertify_no(String certify_no) {
		this.certify_no = certify_no;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getFk_challenge_code() {
		return fk_challenge_code;
	}
	public void setFk_challenge_code(String fk_challenge_code) {
		this.fk_challenge_code = fk_challenge_code;
	}
	public String getCertify_time() {
		return certify_time;
	}
	public void setCertify_time(String certify_time) {
		this.certify_time = certify_time;
	}
	public String getCertify_img() {
		return certify_img;
	}
	public void setCertify_img(String certify_img) {
		this.certify_img = certify_img;
	}
	
	
	
	
}
