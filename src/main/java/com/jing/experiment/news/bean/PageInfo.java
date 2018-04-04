package com.jing.experiment.news.bean;

/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014-2017 abel533@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */



import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import com.github.pagehelper.Page;

/**
 * ��Page<E>������а�װ
 * <p/>
 * ������ҳ�Ķ������ԣ���Ҫ�ο�:http://bbs.csdn.net/topics/360010907
 *
 * @author liuzh/abel533/isea533
 * @version 3.3.0
 * @since 3.2.2
 * ��Ŀ��ַ : http://git.oschina.net/free/Mybatis_PageHelper
 */
@SuppressWarnings({"rawtypes", "unchecked"})
public class PageInfo<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    //��ǰҳ
    private int pageNum;
    //ÿҳ������
    private int pageSize;
    //��ǰҳ������
    private int size;

    //����startRow��endRow�����ã�����˵��������÷�
    //������ҳ����"��ʾstartRow��endRow ��size������"

    //��ǰҳ���һ��Ԫ�������ݿ��е��к�
    private int startRow;
    //��ǰҳ�����һ��Ԫ�������ݿ��е��к�
    private int endRow;
    //�ܼ�¼��
    private long total;
    //��ҳ��
    private int pages;
    //�����
    private List<T> rows;

    //ǰһҳ
    private int prePage;
    //��һҳ
    private int nextPage;

    //�Ƿ�Ϊ��һҳ
    private boolean isFirstPage = false;
    //�Ƿ�Ϊ���һҳ
    private boolean isLastPage = false;
    //�Ƿ���ǰһҳ
    private boolean hasPreviousPage = false;
    //�Ƿ�����һҳ
    private boolean hasNextPage = false;
    //����ҳ����
    private int navigatePages;
    //���е���ҳ��
    private int[] navigatepageNums;
    //�������ϵĵ�һҳ
    private int navigateFirstPage;
    //�������ϵ����һҳ
    private int navigateLastPage;

    public PageInfo() {
    }

    /**
     * ��װPage����
     *
     * @param rows
     */
    public PageInfo(List<T> rows) {
        this(rows, 8);
    }

    /**
     * ��װPage����
     *
     * @param rows          page���
     * @param navigatePages ҳ������
     */
    public PageInfo(List<T> rows, int navigatePages) {
        if (rows instanceof Page) {
            Page page = (Page) rows;
            this.pageNum = page.getPageNum();
            this.pageSize = page.getPageSize();

            this.pages = page.getPages();
            this.rows = page;
            this.size = page.size();
            this.total = page.getTotal();
            //���ڽ����>startRow�ģ�����ʵ�ʵ���Ҫ+1
            if (this.size == 0) {
                this.startRow = 0;
                this.endRow = 0;
            } else {
                this.startRow = page.getStartRow() + 1;
                //����ʵ�ʵ�endRow�����һҳ��ʱ�����⣩
                this.endRow = this.startRow - 1 + this.size;
            }
        } else if (rows instanceof Collection) {
            this.pageNum = 1;
            this.pageSize = rows.size();

            this.pages = this.pageSize > 0 ? 1 : 0;
            this.rows = rows;
            this.size = rows.size();
            this.total = rows.size();
            this.startRow = 0;
            this.endRow = rows.size() > 0 ? rows.size() - 1 : 0;
        }
        if (rows instanceof Collection) {
            this.navigatePages = navigatePages;
            //���㵼��ҳ
            calcNavigatepageNums();
            //����ǰ��ҳ����һҳ�����һҳ
            calcPage();
            //�ж�ҳ��߽�
            judgePageBoudary();
        }
    }

    /**
     * ���㵼��ҳ
     */
    private void calcNavigatepageNums() {
        //����ҳ��С�ڻ���ڵ���ҳ����ʱ
        if (pages <= navigatePages) {
            navigatepageNums = new int[pages];
            for (int i = 0; i < pages; i++) {
                navigatepageNums[i] = i + 1;
            }
        } else { //����ҳ�����ڵ���ҳ����ʱ
            navigatepageNums = new int[navigatePages];
            int startNum = pageNum - navigatePages / 2;
            int endNum = pageNum + navigatePages / 2;

            if (startNum < 1) {
                startNum = 1;
                //(��ǰnavigatePagesҳ
                for (int i = 0; i < navigatePages; i++) {
                    navigatepageNums[i] = startNum++;
                }
            } else if (endNum > pages) {
                endNum = pages;
                //���navigatePagesҳ
                for (int i = navigatePages - 1; i >= 0; i--) {
                    navigatepageNums[i] = endNum--;
                }
            } else {
                //�����м�ҳ
                for (int i = 0; i < navigatePages; i++) {
                    navigatepageNums[i] = startNum++;
                }
            }
        }
    }

    /**
     * ����ǰ��ҳ����һҳ�����һҳ
     */
    private void calcPage() {
        if (navigatepageNums != null && navigatepageNums.length > 0) {
            navigateFirstPage = navigatepageNums[0];
            navigateLastPage = navigatepageNums[navigatepageNums.length - 1];
            if (pageNum > 1) {
                prePage = pageNum - 1;
            }
            if (pageNum < pages) {
                nextPage = pageNum + 1;
            }
        }
    }

    /**
     * �ж�ҳ��߽�
     */
    private void judgePageBoudary() {
        isFirstPage = pageNum == 1;
        isLastPage = pageNum == pages || pages == 0;;
        hasPreviousPage = pageNum > 1;
        hasNextPage = pageNum < pages;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public int getEndRow() {
        return endRow;
    }

    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    @Deprecated
    // firstPage����1, �˺�����ȡ���ǵ������ϵĵ�һҳ, ���ײ�������
    public int getFirstPage() {
        return navigateFirstPage;
    }

    @Deprecated
    public void setFirstPage(int firstPage) {
        this.navigateFirstPage = firstPage;
    }

    public int getPrePage() {
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    @Deprecated
    // ����getPages()����ȡ���һҳ, �˺�����ȡ���ǵ������ϵ����һҳ, ���ײ�������.
    public int getLastPage() {
        return navigateLastPage;
    }

    @Deprecated
    public void setLastPage(int lastPage) {
        this.navigateLastPage = lastPage;
    }

    public boolean isIsFirstPage() {
        return isFirstPage;
    }

    public void setIsFirstPage(boolean isFirstPage) {
        this.isFirstPage = isFirstPage;
    }

    public boolean isIsLastPage() {
        return isLastPage;
    }

    public void setIsLastPage(boolean isLastPage) {
        this.isLastPage = isLastPage;
    }

    public boolean isHasPreviousPage() {
        return hasPreviousPage;
    }

    public void setHasPreviousPage(boolean hasPreviousPage) {
        this.hasPreviousPage = hasPreviousPage;
    }

    public boolean isHasNextPage() {
        return hasNextPage;
    }

    public void setHasNextPage(boolean hasNextPage) {
        this.hasNextPage = hasNextPage;
    }

    public int getNavigatePages() {
        return navigatePages;
    }

    public void setNavigatePages(int navigatePages) {
        this.navigatePages = navigatePages;
    }

    public int[] getNavigatepageNums() {
        return navigatepageNums;
    }

    public void setNavigatepageNums(int[] navigatepageNums) {
        this.navigatepageNums = navigatepageNums;
    }

    public int getNavigateFirstPage() {
        return navigateFirstPage;
    }

    public int getNavigateLastPage() {
        return navigateLastPage;
    }

    public void setNavigateFirstPage(int navigateFirstPage) {
        this.navigateFirstPage = navigateFirstPage;
    }

    public void setNavigateLastPage(int navigateLastPage) {
        this.navigateLastPage = navigateLastPage;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("PageInfo{");
        sb.append("pageNum=").append(pageNum);
        sb.append(", pageSize=").append(pageSize);
        sb.append(", size=").append(size);
        sb.append(", startRow=").append(startRow);
        sb.append(", endRow=").append(endRow);
        sb.append(", total=").append(total);
        sb.append(", pages=").append(pages);
        sb.append(", rows=").append(rows);
        sb.append(", prePage=").append(prePage);
        sb.append(", nextPage=").append(nextPage);
        sb.append(", isFirstPage=").append(isFirstPage);
        sb.append(", isLastPage=").append(isLastPage);
        sb.append(", hasPreviousPage=").append(hasPreviousPage);
        sb.append(", hasNextPage=").append(hasNextPage);
        sb.append(", navigatePages=").append(navigatePages);
        sb.append(", navigateFirstPage=").append(navigateFirstPage);
        sb.append(", navigateLastPage=").append(navigateLastPage);
        sb.append(", navigatepageNums=");
        if (navigatepageNums == null) sb.append("null");
        else {
            sb.append('[');
            for (int i = 0; i < navigatepageNums.length; ++i)
                sb.append(i == 0 ? "" : ", ").append(navigatepageNums[i]);
            sb.append(']');
        }
        sb.append('}');
        return sb.toString();
    }
}
