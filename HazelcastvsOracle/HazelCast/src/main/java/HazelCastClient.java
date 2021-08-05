
import com.hazelcast.client.HazelcastClient;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;

import java.util.ArrayList;
import java.util.Random;

public class HazelCastClient {
    public static void main(String[] args) {
        HazelcastInstance hz = HazelcastClient.newHazelcastClient();
        IMap<Object, Object> map = hz.getMap("test-map");

        long startTime = System.nanoTime();//startTime->procesStartTime
        // r -> random
        // void hazelcastPutTimeTest(int range)
        Random r = new Random();
        // 20000 testLimit
        //i -> key
        for (int i = 0; i < 20000; i++) {
            map.put(i, r.nextInt());
        }
        //endTime-> procesEndTime
        long endTime = System.nanoTime();
        long duration = (endTime - startTime);
        //nanosecToSec
        System.out.println("Put Duration = " + duration / 1000000000 + "s");

        // RandomKeysGenerator(Arraylist <T> list ,int size)
        ArrayList<Integer> keyList = new ArrayList<>();
        for (int i = 0; i < 20000; i++) {
            keyList.add(r.nextInt(20000));
        }

        // hazelcastGetTimeTest(int range)
        startTime = System.nanoTime();
        for (int i = 0; i < 20000; i++) {
            map.get(keyList.get(i));
        }
        endTime = System.nanoTime();
        duration = (endTime - startTime);
        //nanosecToSec
        System.out.println("Get Duration = " + duration / 1000000000 + "s");
        hz.shutdown();
    }
}