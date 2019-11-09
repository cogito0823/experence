

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

import static java.lang.System.currentTimeMillis;


/**
 * 套接字包装器强制实现最大带宽限制。我们的一般策略是测量
 * 在某个（小）时间内发送的实际字节数，然后在该速率超过我
 * 们的目标值时通过sleep（）引入人为延迟。有一对试图平滑
 * 发送速率的试探法，防止它在完全停止之前的一小段时间内出
 * 现尖峰。
 */
class ThrottleSocket {

    /**
     * 所需的带宽利用率，以每秒位数为单位
     */
    static final int TARGET_BITS_PER_SECOND = 1 * 1024 * 1024;         // 1 Mebibit

    /**
     * 内部计算的便捷常量，使用每毫秒字节数。
     */
    final static int TARGET_BYTES_PER_MILLISECOND = (TARGET_BITS_PER_SECOND / 8) / 1000;

    /**
     * 检查带宽利用率之前将发送的字节数。当我们使分配的带宽饱和时，这被选择为~10次/秒。
     */
    final static int BYTES_BETWEEN_DELAY_CHECKS = TARGET_BYTES_PER_MILLISECOND * 100;

    private DatagramSocket socket;
    private long start = 0;
    private long bytesSentThisPeriod = 0;
    private boolean shouldStallEachPacket = true;

    public ThrottleSocket(DatagramSocket socket) {
        this.socket = socket;
    }

    ThrottleSocket(int port) throws SocketException {
        this.socket = new DatagramSocket(port);
    }

    void send(byte[] bytes, InetAddress addr, int port) throws IOException, InterruptedException {
        DatagramPacket packet = new DatagramPacket(bytes, bytes.length, addr, port);
        send(packet);
    }

    /**
     * 通过网络发送数据报，必要时阻止以强制执行带宽限制。
     * <p>
     * Bandwidth limits are enforced by periodically checking the
     */
    private void send(DatagramPacket packet) throws IOException, InterruptedException {

        if (start == 0) {
            start = currentTimeMillis();
        }

        //在正常情况下，我们能够以比我们的带宽限制
        // 允许的更快的速率向网络发送数据突发。如
        // 果这是真的，我们会在每个数据包之前引入
        // 一个延迟，以平滑利用率并避免过度突发。
        if (shouldStallEachPacket) {
            Thread.sleep(1);
        }

        socket.send(packet);
        bytesSentThisPeriod += packet.getLength();

        if (bytesSentThisPeriod >= BYTES_BETWEEN_DELAY_CHECKS) {
            long end = currentTimeMillis();
            long thisPeriodMs = end - start;
            System.out.println("Elapsed time: " + thisPeriodMs + "ms");

            //时钟分辨率可能差至10毫秒，因此（end-start）可能为零。在这种情况下增加以避免因零除的不愉快
            if (thisPeriodMs == 0) {
                thisPeriodMs++;
            }

            // 确定我们应该睡多久才能让我们回到目标带
            // 宽。这个公式来源于：Bandwidth =（发送的
            // 字节数）/ time =（发送的字节数）/（发送时间+休眠时间）

            long sleepTime = (bytesSentThisPeriod / TARGET_BYTES_PER_MILLISECOND) - thisPeriodMs;

//            启发式：如果我们的运行速度超
//            过我们应该的两倍，则开始在每个数据包
//            之间引入延迟（除了睡眠以弥补我们过快的事实）。我们这
//            样做是因为我们的计时器分辨率是这样的，我们只能经常测量。
            shouldStallEachPacket = (sleepTime > thisPeriodMs);

            if (sleepTime > 0) {
                System.out.println("Server: sleeping for " + sleepTime + " ms");
                Thread.sleep(sleepTime);
            }

            long periodEnd = currentTimeMillis();
            long periodBandwidth = ((bytesSentThisPeriod * 8) / (periodEnd - start)); // kilobits per second
            System.out.println("Server: b/w used this period: " + periodBandwidth + " kbps");
            start = periodEnd;
            bytesSentThisPeriod = 0;
        }

    }


}
