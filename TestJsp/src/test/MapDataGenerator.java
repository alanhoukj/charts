package test;

public class MapDataGenerator {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int i,j;
		int max=16;
		
		for(i=0;i<max;i++){
			for(j=0;j<max;j++){
				if (i!=j&&(j==10||j==8))
					System.out.println("["+i+","+j+","+(int)(Math.random()*10)+"],");
			}
		}
		
	}

}
