package com.eyfast.vipclub.vo;

import java.util.List;

/**
 * Created by Administrator on 2017-02-21.
 */
public class Page<K>{
    private  int pageSize;
    private  int startIndex;
    private  int count;
    private List<K> page;


    public void setPage(List<K> page) {
        this.page = page;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public List<K> getPage() {
        return page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

}
