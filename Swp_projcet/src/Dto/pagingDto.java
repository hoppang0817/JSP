package Dto;

public class pagingDto {

	private int nowPage =1;
	private int contentNumberPerPage=5; //�������� ������ �������� ��
	private int pageNumberPerPageGroup=4;//������ �׷� �� ������ ��
	private int totalContents; //�� �������� ��
	
	public pagingDto() {
		
	}

   // * �ѰԽù����� �Ҵ�

   public pagingDto(int totalContents) {

       this.totalContents = totalContents;

   }




    //* �ѰԽù����� ���� ������ ������ �Ҵ�

   public pagingDto(int totalContents, int nowPage) {

       this.totalContents = totalContents;

       this.nowPage = nowPage;

   }




   // * ���� ������ ����

   public int getNowPage() {

       return nowPage;

   }




    //* �� ���������� ������ ��(row) �� ���۹�ȣ

   public int getStartRowNumber() {

       return ((nowPage - 1) * contentNumberPerPage) + 1;

   }




    //* �� ���������� ������ ��(row)�� ������ ��ȣ

   public int getEndRowNumber() {

       int endRowNumber = nowPage * contentNumberPerPage;

       if (totalContents < endRowNumber)

           endRowNumber = totalContents;

       return endRowNumber;

   }




    //* �� ������ ���� return�Ѵ�.

   public int getTotalPage() {

       int totalPage = 0;


       if(totalContents % contentNumberPerPage == 0){

           totalPage = totalContents / contentNumberPerPage;

       }


       if(totalContents % contentNumberPerPage > 0){

           totalPage = (totalContents / contentNumberPerPage) + 1;

       }


       return totalPage;

   }




    //* �� ������ �׷��� ���� return�Ѵ�.


   public int getTotalPageGroup() {

       int totalPageGroup = 0;


       if(getTotalPage() % pageNumberPerPageGroup == 0){

           totalPageGroup = getTotalPage() / pageNumberPerPageGroup;

       }

       if(getTotalPage() % pageNumberPerPageGroup > 0){

           totalPageGroup = (getTotalPage() / pageNumberPerPageGroup) + 1;

       }


       return totalPageGroup;

   }




   // * ���� �������� ���� ������ �׷� ��ȣ(�� ��° ������ �׷�����) �� return �ϴ� �޼ҵ�


   public int getNowPageGroup() {

       int nowPageGroup = 0;


       if(getNowPage() % pageNumberPerPageGroup == 0){

           nowPageGroup = getNowPage() / pageNumberPerPageGroup;

       }


       if(getNowPage() % pageNumberPerPageGroup > 0){

           nowPageGroup = (getNowPage() / pageNumberPerPageGroup) + 1 ;

       }

       return nowPageGroup;

   }




    //* ���� �������� ���� ������ �׷��� ���� ������ ��ȣ�� return �Ѵ�.


   public int getStartPageOfPageGroup() {

       int startPageOfPageGroup;


       startPageOfPageGroup = (pageNumberPerPageGroup * (getNowPageGroup() -1)) + 1;


       return startPageOfPageGroup;

   }




    //* ���� �������� ���� ������ �׷��� ������ ������ ��ȣ�� return �Ѵ�.


   public int getEndPageOfPageGroup() {

       int endPageOfPageGroup = pageNumberPerPageGroup * getNowPageGroup();


       if(endPageOfPageGroup > getTotalPage()){

           endPageOfPageGroup = getTotalPage();

       }

       return endPageOfPageGroup;

   }




   // * ���� ������ �׷��� �ִ��� üũ�ϴ� �޼���


   public boolean isPreviousPageGroup() {

       boolean flag = false;


       if(getNowPageGroup() > 1){

           flag = true;

       }

       return flag;

   }


   // * ���� ������ �׷��� �ִ��� üũ�ϴ� �޼���


   public boolean isNextPageGroup() {


       boolean flag = false;


       if(getNowPageGroup() < getTotalPageGroup()){

           flag = true;

       }

       return flag;

   }
}
