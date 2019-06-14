package ib.common;


/**
 * @author �ζ�
 * @since 2019-4-15
 *
 */
public class Pageinfo implements Page {

	private static final long serialVersionUID = 6058623216294866584L;

	/**
	 *  �ܼ�¼��
	 */
	private int totalRecords = 0;

	/**
	 * ��ҳ��
	 */
	private int totalPage = 0;

	/**
	 * ��ǰҳ��
	 */
	private int currentPage = 1;

	/**
	 * �ǵ�һҳ��
	 */
	private boolean isFristPage = true;

	/**
	 * �����һҳ��
	 */
	private boolean isLastPage = false;
	
	
	/**
	 * ÿҳ�ļ�¼����
	 */
	private int pageSize = 20;// ��Щ��������HiFreameworkConfig.properties�����úõģ�ֱ�Ӷ�ȡ�������ȡʧ�ܣ�������¶�ȡ

	/**
	 * ��ǰҳ����ʼ��¼��
	 */
	private int startRowPosition = 0;

	/**
	 * ��ǰҳ������¼��
	 */
	private int endRowPosition = 0;

	/**
	 * ����޼�¼��
	 */
	private int maxRecords = 25;
	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getCurrentPage()
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setCurrentPage(int)
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getEndRowPosition()
	 */
	public int getEndRowPosition() {
		return endRowPosition;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setEndRowPosition(int)
	 */
	public void setEndRowPosition(int endRowPosition) {
		this.endRowPosition = endRowPosition;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getIsFristPage()
	 */
	public boolean getIsFristPage() {
		return isFristPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setIsFristPage(boolean)
	 */
	public void setIsFristPage(boolean isFristPage) {
		this.isFristPage = isFristPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getIsLastPage()
	 */
	public boolean getIsLastPage() {
		return isLastPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setIsLastPage(boolean)
	 */
	public void setIsLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getPageSize()
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getStartRowPosition()
	 */
	public int getStartRowPosition() {
		return startRowPosition;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setStartRowPosition(int)
	 */
	public void setStartRowPosition(int startRowPosition) {
		this.startRowPosition = startRowPosition;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getTotalPage()
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setTotalPage(int)
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getTotalRecords()
	 */
	public int getTotalRecords() {
		return totalRecords;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setTotalRecords(int)
	 */
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#getMaxRecords()
	 */
	public int getMaxRecords() {
		return maxRecords;
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.paging.Page#setMaxRecords(int)
	 */
	public void setMaxRecords(int maxRecords) {
		this.maxRecords = maxRecords;
	}

	
	public int getMiddlePageNum(){
		return 20;
	}
}
