import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

import static java.lang.System.currentTimeMillis;


class TrSocket {

    static final int TARGET_BITS_PER_SECOND = 1 * 1024 * 1024;         // 1 M bit

    final static int TARGET_BYTES_PER_MILLISECOND = (TARGET_BITS_PER_SECOND / 8) / 1000;


    final static int BYTES_BETWEEN_DELAY_CHECKS = TARGET_BYTES_PER_MILLISECOND * 100;

    static DatagramSocket socket;
    static long start = 0;
    static long bytesSentThisPeriod = 0;
    static boolean shouldStallEachPacket = true;

    public TrSocket(DatagramSocket socket) {
        this.socket = socket;
    }

    TrSocket(int port) throws SocketException {
        this.socket = new DatagramSocket(port);
    }

    void send(byte[] bytes, InetAddress addr, int port) throws IOException, InterruptedException {
        DatagramPacket packet = new DatagramPacket(bytes, bytes.length, addr, port);
        send(packet);
    }


    static void send(DatagramPacket packet) throws IOException, InterruptedException {

        if (start == 0) {
            start = currentTimeMillis();
        }
        if (shouldStallEachPacket) {
            Thread.sleep(1);
        }

        socket.send(packet);
        bytesSentThisPeriod += packet.getLength();

        if (bytesSentThisPeriod >= BYTES_BETWEEN_DELAY_CHECKS) {
            long end = currentTimeMillis();
            long thisPeriodMs = end - start;
            if (thisPeriodMs == 0) {
                thisPeriodMs++;
            }


            long sleepTime = (bytesSentThisPeriod / TARGET_BYTES_PER_MILLISECOND) - thisPeriodMs;

            shouldStallEachPacket = (sleepTime > thisPeriodMs);

            if (sleepTime > 0) {
                Thread.sleep(sleepTime);
            }

            long periodEnd = currentTimeMillis();
            long periodBandwidth = ((bytesSentThisPeriod * 8) / (periodEnd - start)); // kilobits per second
            start = periodEnd;
            bytesSentThisPeriod = 0;
        }

    }


}
