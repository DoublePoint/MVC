package TestP;

import org.junit.Test;


public class TestPV {

	@Test
	public void test1(){
		final int һ�꽻Ǯ����=20000;
		final int ÿ�귵Ǯ����=6000;
		final float ������=0.035F;
		int ��Ǯ����=1;
		double �ܽ�Ǯ����=0;
		double �ܷ�Ǯ����=0;//�ܷ�Ǯ���� ��Ϣ
		double ��Ϣ=0;
		while(��Ǯ����<50){
			if(��Ǯ����==1){
				�ܽ�Ǯ����=һ�꽻Ǯ����;
				��Ϣ=ÿ�귵Ǯ����;
				System.out.println("��1��  ��0�η�Ǯ����Ϣ��0");
				System.out.println("");
				System.out.println("�ܽ�Ǯ��"+String.valueOf(�ܽ�Ǯ����));
				System.out.println("===========================");
				System.out.println("");
			}
			else if(��Ǯ����>1){
				�ܷ�Ǯ����=0;
				if(��Ǯ����>10)
					�ܽ�Ǯ����=200000;
				else
					�ܽ�Ǯ����=һ�꽻Ǯ����*��Ǯ����;
				for(int i=1;i<��Ǯ����;i++){
					double ��Ϣ����=(double)(1+������);
					double ��i�η�Ǯn����ܶ�=��Ϣ*(Math.pow(��Ϣ����, i-1));
					�ܷ�Ǯ����+=��i�η�Ǯn����ܶ�;
					
					System.out.println("��"+��Ǯ����+"��  ��"+(��Ǯ����-i)+"�η�Ǯ����Ϣ����"+��i�η�Ǯn����ܶ�);
					
				}
				System.out.println("");
				System.out.println("�ܹ���Ǯ��"+String.valueOf(�ܷ�Ǯ����));
				System.out.println("��Ǯ-�ɱ���"+String.valueOf(�ܷ�Ǯ����-�ܽ�Ǯ����));
				System.out.println("�ܽ�Ǯ��"+String.valueOf(�ܽ�Ǯ����));
				System.out.println("===========================");
				System.out.println("");
				
			}
			��Ǯ����++;
		}
	}
	
	@Test
	public void test2(){
		final int һ�꽻Ǯ����=20000;
		final int ÿ�귵Ǯ����=20000;
		final float ������=0.04F;
		int ��Ǯ����=1;
		double �ܽ�Ǯ����=0;
		double �ܷ�Ǯ����=0;//�ܷ�Ǯ���� ��Ϣ
		double ��Ϣ=0;
		while(��Ǯ����<88){
			if(��Ǯ����==1){
				�ܽ�Ǯ����=һ�꽻Ǯ����;
				��Ϣ=ÿ�귵Ǯ����;
				System.out.println("��1��  ��0�η�Ǯ����Ϣ��0");
				System.out.println("");
				System.out.println("�ܽ�Ǯ��"+String.valueOf(�ܽ�Ǯ����));
				System.out.println("===========================");
				System.out.println("");
			}
			else if(��Ǯ����>1){
				�ܷ�Ǯ����=0;
				if(��Ǯ����>10)
					�ܽ�Ǯ����=200000;
				else
					�ܽ�Ǯ����=һ�꽻Ǯ����*��Ǯ����;
				if(��Ǯ����<=10){
					for(int i=0;i<��Ǯ����;i++){
						double ��Ϣ����=(double)(1+������);
						double ��i�η�Ǯn����ܶ�=��Ϣ*(Math.pow(��Ϣ����, i));
						�ܷ�Ǯ����+=��i�η�Ǯn����ܶ�;
						System.out.println("��"+��Ǯ����+"��  ��"+(��Ǯ����-i)+"�η�Ǯ����Ϣ����"+��i�η�Ǯn����ܶ�);
					}
					System.out.println("");
					System.out.println("�ܹ���Ǯ��"+String.valueOf(�ܷ�Ǯ����));
					System.out.println("�ܽ�Ǯ��"+String.valueOf(�ܽ�Ǯ����));
					System.out.println("===========================");
					System.out.println("");
				}
				else{
					for(int i=0;i<10;i++){
						double ��Ϣ����=(double)(1+������);
						double ��i�η�Ǯn����ܶ�=��Ϣ*(Math.pow(��Ϣ����, i));
						�ܷ�Ǯ����+=��i�η�Ǯn����ܶ�;
					}
						double ��Ϣ����=(double)(1+������);
						�ܷ�Ǯ����=�ܷ�Ǯ����*(Math.pow(��Ϣ����, ��Ǯ����-10));
						System.out.println("��"+��Ǯ����+"��  ��Ϣ"+�ܷ�Ǯ����*(��Ϣ����-1));
						System.out.println("");
						System.out.println("�ܹ���Ǯ��"+String.valueOf(�ܷ�Ǯ����));
						System.out.println("�ܽ�Ǯ��"+String.valueOf(�ܽ�Ǯ����));
						System.out.println("===========================");
						System.out.println("");
				}
				}
			��Ǯ����++;
		}
	}
}

