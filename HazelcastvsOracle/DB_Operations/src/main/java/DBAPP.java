import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

public class DBAPP {
    public static void main(String[] args) {

        String url = "jdbc:oracle:thin:@//localhost:49161/XE";
        String user = "system";
        String password = "oracle";

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection connection = DriverManager.getConnection(url, user, password);
            Statement statement = connection.createStatement();

            //CreateTable(Statement statement)

            String query = "CREATE TABLE hazelcast " +
                    "(id INTEGER not NULL, " +
                    " value INTEGER, " +
                    " PRIMARY KEY ( id ))";
            statement.executeUpdate(query);

            //oracleInsertTimeTest(Statement statement,int range)
            //query -> insertQuery
            //startTime->procesStartTime
            // 20000 testLimit
            long startTime = System.nanoTime();
            for (int i = 0; i < 20000; i++) {
                query = "INSERT INTO hazelcast VALUES (" + i + "," + i * 2 + ")";
                statement.executeUpdate(query);
            }
            //endTime-> procesEndTime
            long endTime = System.nanoTime();
            long duration = (endTime - startTime);
            //nanosecToSec
            System.out.println("Put Duration = "+duration/1000000000+"s");

            ArrayList<Integer> keyList = new ArrayList<>();
            // RandomKeysGenerator(Arraylist <T> list ,int size)
            Random r = new Random();
            for (int i = 0; i < 20000; i++) {
                keyList.add(r.nextInt(20000));
            }

            //oracleSearchTimeTest(Statement statement,int range)
            //query -> searchQuery
            startTime = System.nanoTime();
            for (int i = 0; i < 20000; i++) {
                query = "SELECT * FROM hazelcast where id = " + i;
                ResultSet rs = statement.executeQuery(query);
            }
            endTime = System.nanoTime();
            duration = (endTime - startTime);
            System.out.println("Get Duration = "+duration/1000000000+"s");
            //DropTable (Statement statement)
            query ="DROP TABLE hazelcast    ";
            statement.executeUpdate(query);
            connection.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
