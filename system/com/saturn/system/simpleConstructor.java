package com.saturn.system;

class Rock{
	Rock(){
		System.out.println("this new rock");
	}
}
public class simpleConstructor {
	public static void main(String[] args){
		for(int i=0; i<10; i++){
			new Rock();
		}
	}
}
