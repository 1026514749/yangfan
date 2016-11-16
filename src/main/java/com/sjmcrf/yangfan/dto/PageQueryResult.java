package com.sjmcrf.yangfan.dto;

public class PageQueryResult extends ActionResult {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4024874154177188065L;
    private int totalCount;
    private Object dataList;


    public PageQueryResult() {
    }

    public PageQueryResult(boolean success) {
        super(success);
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public Object getDataList() {
        return dataList;
    }

    public void setDataList(Object dataList) {
        this.dataList = dataList;
    }

}
