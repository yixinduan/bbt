package ib.common;

import java.util.ArrayList;
import java.util.List;

public class BaseService {

	public  List getOnePageList(List list, int pageNo, int pageSize) {
		int startIndex = (pageNo-1) * pageSize;
		List pageList = new ArrayList();
		for(int i=startIndex, j=0; i<list.size() && j<pageSize; i++,j++) {
			pageList.add(list.get(i));
		}
		return pageList;
	}
}
