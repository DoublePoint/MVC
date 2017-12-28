package cn.doublepoint.generate.domain.model.helper;
//package cn.doublepoint.helper;
//
//import org.junit.Test;
//
//
//public class TestPV {
//
//	@Test
//	public void test1(){
//		final int 一年交钱数额=20000;
//		final int 每年返钱数额=6000;
//		final float 年利率=0.035F;
//		int 交钱年数=1;
//		double 总交钱数额=0;
//		double 总返钱数额=0;//总返钱数额 本息
//		double 本息=0;
//		while(交钱年数<50){
//			if(交钱年数==1){
//				总交钱数额=一年交钱数额;
//				本息=每年返钱数额;
//				System.out.println("第1年  第0次返钱本加息共0");
//				System.out.println("");
//				System.out.println("总交钱："+String.valueOf(总交钱数额));
//				System.out.println("===========================");
//				System.out.println("");
//			}
//			else if(交钱年数>1){
//				总返钱数额=0;
//				if(交钱年数>10)
//					总交钱数额=200000;
//				else
//					总交钱数额=一年交钱数额*交钱年数;
//				for(int i=1;i<交钱年数;i++){
//					double 本息倍数=(double)(1+年利率);
//					double 第i次返钱n年后总额=本息*(Math.pow(本息倍数, i-1));
//					总返钱数额+=第i次返钱n年后总额;
//					
//					System.out.println("第"+交钱年数+"年  第"+(交钱年数-i)+"次返钱本加息共："+第i次返钱n年后总额);
//					
//				}
//				System.out.println("");
//				System.out.println("总共返钱："+String.valueOf(总返钱数额));
//				System.out.println("返钱-成本："+String.valueOf(总返钱数额-总交钱数额));
//				System.out.println("总交钱："+String.valueOf(总交钱数额));
//				System.out.println("===========================");
//				System.out.println("");
//				
//			}
//			交钱年数++;
//		}
//	}
//	
//	@Test
//	public void test2(){
//		final int 一年交钱数额=20000;
//		final int 每年返钱数额=20000;
//		final float 年利率=0.04F;
//		int 交钱年数=1;
//		double 总交钱数额=0;
//		double 总返钱数额=0;//总返钱数额 本息
//		double 本息=0;
//		while(交钱年数<88){
//			if(交钱年数==1){
//				总交钱数额=一年交钱数额;
//				本息=每年返钱数额;
//				System.out.println("第1年  第0次返钱本加息共0");
//				System.out.println("");
//				System.out.println("总交钱："+String.valueOf(总交钱数额));
//				System.out.println("===========================");
//				System.out.println("");
//			}
//			else if(交钱年数>1){
//				总返钱数额=0;
//				if(交钱年数>10)
//					总交钱数额=200000;
//				else
//					总交钱数额=一年交钱数额*交钱年数;
//				if(交钱年数<=10){
//					for(int i=0;i<交钱年数;i++){
//						double 本息倍数=(double)(1+年利率);
//						double 第i次返钱n年后总额=本息*(Math.pow(本息倍数, i));
//						总返钱数额+=第i次返钱n年后总额;
//						System.out.println("第"+交钱年数+"年  第"+(交钱年数-i)+"次返钱本加息共："+第i次返钱n年后总额);
//					}
//					System.out.println("");
//					System.out.println("总共返钱："+String.valueOf(总返钱数额));
//					System.out.println("总交钱："+String.valueOf(总交钱数额));
//					System.out.println("===========================");
//					System.out.println("");
//				}
//				else{
//					for(int i=0;i<10;i++){
//						double 本息倍数=(double)(1+年利率);
//						double 第i次返钱n年后总额=本息*(Math.pow(本息倍数, i));
//						总返钱数额+=第i次返钱n年后总额;
//					}
//						double 本息倍数=(double)(1+年利率);
//						总返钱数额=总返钱数额*(Math.pow(本息倍数, 交钱年数-10));
//						System.out.println("第"+交钱年数+"年  利息"+总返钱数额*(本息倍数-1));
//						System.out.println("");
//						System.out.println("总共返钱："+String.valueOf(总返钱数额));
//						System.out.println("总交钱："+String.valueOf(总交钱数额));
//						System.out.println("===========================");
//						System.out.println("");
//				}
//				}
//			交钱年数++;
//		}
//	}
//}
//
