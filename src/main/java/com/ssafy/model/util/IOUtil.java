package com.ssafy.model.util;

import java.io.Closeable;
import java.net.ServerSocket;
import java.net.Socket;


public class IOUtil {
	public static void close(Closeable c) {
		if(c != null) {
			try {
				c.close();
			} catch (Exception e) {
			}
		}
	}
	public static void close(Socket c) {
		if(c != null) {
			try {
				c.close();
			} catch (Exception e) {
			}
		}
	}
	public static void close(ServerSocket  c) {
		if(c != null) {
			try {
				c.close();
			} catch (Exception e) {
			}
		}
	}
	
}












