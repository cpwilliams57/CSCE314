import java.util.*;
import java.util.concurrent.locks.*;
 
class PostBox implements Runnable {
    static final int MAX_SIZE = 10;
 
    class Message {
        String sender;
        String recipient;
        String msg;
        Message(String sender, String recipient, String msg) {
            this.sender = sender;
            this.recipient = recipient;
            this.msg = msg;
        }
    }
 
    private final LinkedList<Message> messages;
    private LinkedList<Message> myMessages;
    private String myId;
    private boolean stop = false;
	private Lock pBoxLock;
 
    public PostBox(String myId) {
        messages = new LinkedList<Message>();
        this.myId = myId;
        this.myMessages = new LinkedList<Message>();
        new Thread(this).start();
		this.pBoxLock = new ReentrantLock();// I chose this kind of lock because it can be synchronized, without using synchronized(this)
    }										// It's also the only kind of lock I know of.
 
    public PostBox(String myId, PostBox p) {
        this.myId = myId;
        this.messages = p.messages;
        this.myMessages = new LinkedList<Message>();
        new Thread(this).start();
		this.pBoxLock = p.pBoxLock;
    }
 
    public String getId() { return myId; }
 
    public void stop() {
        // make it so that this Runnable will stop
		this.stop = true;
    }
 
    public void send(String recipient, String msg) {
        // add a message to the shared message queue
		pBoxLock.lock();
		
		try
		{
			messages.add(new Message(myId, recipient, msg));
		}
		finally
		{
			pBoxLock.unlock();//unlocks lock
		}
    }
 
    public List<String> retrieve() {
        // return the contents of myMessages
        // and empty myMessages
		
		List<String> contents = new LinkedList<String>();//contents of myMessages
		
		pBoxLock.lock();//locks the class, so this function can work without any interruptions by other threads, that could tamper with what is in the linked lists.
						//no reliance on other locks
						//Example: one thread could be trying to add a new message to myMessages, and could get lost in the shuffle, or prematurely deleted
		
		try
		{
			for(int i = 0; i < myMessages.size(); i++)
			{
				Message m = myMessages.get(i);
				String mesg = "From: " + m.sender + " To: " + m.recipient + ": " + m.msg + "\n";//creates string for output
				contents.add(mesg);
			}
		
			myMessages.clear();	//clears myMessages
		}
		finally
		{
			pBoxLock.unlock();//unlocks lock, allowing access to the class
		}
		
		return contents;
		
    }
 
    public void run() {
        // loop forever
        //   1. approximately once every second move all messages
        //      addressed to this post box from the shared message
        //      queue to the private myMessages queue
        //   2. also approximately once every second, if the message
        //      queue has more than MAX_SIZE messages, delete oldest messages
        //      so that size is at most MAX_SIZE
		
		while(!stop)
		{
			try
			{
				Thread.sleep(1000);
			}
			catch(InterruptedException e){}
			
			pBoxLock.lock();
			
			List<Message> mssgs = new LinkedList<Message>();
			
			try
			{
				for(Message mssg1 : messages)
				{
					if(mssg1.recipient.equals(myId))//if it 
					{
						mssgs.add(mssg1);//adds to list
					}
				}
				
				for(Message mssg2 : mssgs)
				{
					myMessages.add(mssg2);//adds to my messages
					messages.remove(mssg2);//removes from messages
				}
				
				if(messages.size() > MAX_SIZE)
				{
					while(messages.size() > MAX_SIZE)
					{
						messages.remove();//removes excess emails
					}
				}
			}
			finally
			{
				pBoxLock.unlock();//unlocks lock
			}
				
		}
    }
}

