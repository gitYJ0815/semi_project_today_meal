package product.model.vo;

public class OptionType {
	private int optionTypeNo;
	private String optionType;
	private int pNo;
	/* 	OPTION_TYPE_NO	NUMBER
		OPTION_TYPE	VARCHAR2(30 BYTE)
		PRODUCT_NO	NUMBER */
	
	public OptionType() {}
	
	public OptionType(int optionTypeNo, String optionType, int pNo) {
		super();
		this.optionTypeNo = optionTypeNo;
		this.optionType = optionType;
		this.pNo = pNo;
	}

	public int getOptionTypeNo() {
		return optionTypeNo;
	}

	public void setOptionTypeNo(int optionTypeNo) {
		this.optionTypeNo = optionTypeNo;
	}

	public String getOptionType() {
		return optionType;
	}

	public void setOptionType(String optionType) {
		this.optionType = optionType;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "OptionType [optionTypeNo=" + optionTypeNo + ", optionType=" + optionType + ", pNo=" + pNo + "]";
	}
	
}
