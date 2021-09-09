
package uml;

import Modelo.Database;

public class main {

    
    public static void main(String[] args) {
        Database con = new Database();
        System.out.println(con.getConnection());
    }
    
}
