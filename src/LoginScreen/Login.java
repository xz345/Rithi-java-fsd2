package LoginScreen;

import java.util.Scanner;

import Exception.LoginException;



public class Login {

		public static void main(String[] args) throws LoginException {
		// TODO Auto-generated method stub

	    System.out.println("*********************************");
		System.out.println("| Welcome to Camera Rental Shop |");
		System.out.println();
		System.out.println("|    Please Login to continue   |");
		System.out.println("*********************************");
		Scanner sc=new Scanner(System.in);

		System.out.println("Enter your username: ");
		String username=sc.next();

		System.out.println("Enter your Password: ");
		String password=sc.next();
		
		if(username.equals("Rithika") && password.equals("Rithi@04")) {
            CameraOperations.InitializeList();
            
            System.out.println("Created by enolaur");
			mainMenu();
		}
		else {
		    System.out.println("- - - - - - - - - - - - - - -");
			System.out.println("| Invalid login credentials |");
			System.out.println("- - - - - - - - - - - - - - -");
			//throw new LoginException();
		}
	
		}
		
		public static void subMenu() {
			System.out.println(" ############## ");
			System.out.println("\n  1.ADD  \n  2.REMOVE  \n  3.VIEW MY CAMERA  \n  4.GO TO PREVIOUS MENU ");
			System.out.println(" ############## ");

			Scanner sc=new Scanner(System.in);
		
			int choice=sc.nextInt();
			//nested switch
			switch(choice) {
				case 1://add

					CameraOperations.addCamera();
					subMenu();
					break;
					
					
				case 2: //remove
					CameraOperations.displayAllCameras();
					System.out.println("Enter Camera id to delete");
				    int id=sc.nextInt();
				    CameraOperations.remove(id);	
				    subMenu();
				    break;
				    
				    case 3://view my camera
				    	CameraOperations.displayAllCameras();
						subMenu();
			    	
				    	break;
				    case 4://go back to previous menu
				    	 mainMenu();
				    	break;
				    	 }
			

			
			
		}
		
		
		
		
		public static void mainMenu() {
			System.out.println("- - - - - - - - - - - - - - ");
			System.out.println("\n 1.MY CAMERA \n 2.RENT A CAMERA \n 3.VIEW ALL CAMERA \n 4.MY WALLET \n 5.EXIT");
			System.out.println("Enter your option from 1-5:");
			System.out.println("- - - - - - - - - - - - - -");
			Scanner sc=new Scanner(System.in);
			int option=sc.nextInt();

			switch(option) {

			case 1: 
				
				subMenu();
				break;
				
			
			case 2:
				CameraOperations.rentCamera();
		    	 mainMenu();

				break;
				
			case 3:
				
				ViewAllCameras.view();
		    	 mainMenu();

				break;
			
				
			case 4:
				Wallet.manageWallet();
		    	 mainMenu();

				break;
				
			case 5:
				System.exit(0);
			
            default:
            	System.out.println("Invalid option choosen");
            	System.out.println("choose a range between 1-5");
            	mainMenu();
	
			}
		
	}




}
