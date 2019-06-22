package com.jiangxinsoft.scorpio.knowledge.model;

/**
 * ExcelKnow
 * @author Administrator
 *
 */
public class KnowExcel {
	
	private String modeName;
	
	private String modeReason;
	
	

	private String modeConsequence;
	
	private String prevention;
	
	public KnowExcel(String modeName, String modeReason,
			String modeConsequence, String prevention) {
		super();
		this.modeName = modeName;
		this.modeReason = modeReason;
		this.modeConsequence = modeConsequence;
		this.prevention = prevention;
	}
	
	public KnowExcel() {
		super();
	}

	public String getModeName() {
		return modeName;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
	}

	public String getModeReason() {
		return modeReason;
	}

	public void setModeReason(String modeReason) {
		this.modeReason = modeReason;
	}

	public String getModeConsequence() {
		return modeConsequence;
	}

	public void setModeConsequence(String modeConsequence) {
		this.modeConsequence = modeConsequence;
	}

	public String getPrevention() {
		return prevention;
	}

	public void setPrevention(String prevention) {
		this.prevention = prevention;
	}

	@Override
	public String toString() {
		return "KnowExcel [modeName=" + modeName + ", modeReason=" + modeReason
				+ ", modeConsequence=" + modeConsequence + ", prevention="
				+ prevention + "]";
	}
	
	
}
