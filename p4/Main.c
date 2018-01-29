code Main

  -- <SUSHMITHA SHRIDHAR>
  -- This is code for testing the ThreadManage, ProcessManager and FrameManager

-----------------------------  Main  ---------------------------------

  function main ()

/*

      var th0, th1, th2: ptr to Thread
          proc0, proc1, proc2, proc3: ptr to ProcessControlBlock

*/

      -- Initialization for testing code
      uniqueNumberLock.Init ()

      -- Initialize the Thread Scheduler
      InitializeScheduler ()

      -- Initialize the ProcessManager
      processManager = new ProcessManager
      processManager.Init ()

      -- Initialize the ThreadManager
      threadManager = new ThreadManager
      threadManager.Init ()

      -- Initialize the FrameManager
      frameManager = new FrameManager
      frameManager.Init ()

      -- TestMutex()

-- THE FOLLOWING CODE MAY BE USEFUL DURING TESTING, SO YOU MAY WISH TO
-- UNCOMMENT AND USE ALL OR PART OF IT.  HOWEVER, FOR YOUR FINAL RUN,
-- PLEASE USE THIS FILE EXACTLY AS DISTRIBUTED.

/*

      -- Print the initial state
      print ("\n====================  INITIAL STATE  ====================\n\n")
      threadManager.Print ()
      print ("\n=========================================================\n\n")

      -- Allocate some threads
      print ("\n*****  Allocating some threads  *****\n\n")
      th0 = threadManager.GetANewThread()
      th1 = threadManager.GetANewThread()
      th2 = threadManager.GetANewThread()

      -- Rreturn one of the threads
      print ("*****  Returning one thread  *****\n\n")
      threadManager.FreeThread (th1)

      -- Print the new state
      print ("\n====================  NEW STATE  ====================\n\n")
      threadManager.Print ()
      print ("\n=========================================================\n\n")

      -- Return the other threads
      threadManager.FreeThread (th0)
      threadManager.FreeThread (th2)

      -- Print the initial state
      print ("\n====================  INITIAL STATE  ====================\n\n")
      processManager.Print ()
      print ("\n\n")
      frameManager.Print ()
      print ("\n=========================================================\n\n")

      -- Allocate some processes
      print ("*****  Allocating some processes  *****\n\n")
      proc0 = processManager.GetANewProcess()
      proc1 = processManager.GetANewProcess()
      proc2 = processManager.GetANewProcess()
      proc3 = processManager.GetANewProcess()

      -- Allocate some frames
      print ("*****  Allocating some frames  *****\n\n")
      frameManager.GetNewFrames(&proc2.addrSpace, 3)
      frameManager.GetNewFrames(&proc1.addrSpace, 2)
      frameManager.GetNewFrames(&proc0.addrSpace, 5)
      frameManager.GetNewFrames(&proc3.addrSpace, 1)

      -- Return one of the processes and return its frames
      print ("*****  Returning one process and its frames  *****\n\n")
      frameManager.ReturnAllFrames(&proc1.addrSpace)
      processManager.FreeProcess (proc1)

      -- Rreturn one of the threads
      print ("*****  Returning one thread  *****\n\n")
      threadManager.FreeThread (th1)

      -- Print the new state
      print ("\n====================  NEW STATE  ====================\n\n")
      processManager.Print ()
      print ("\n\n")
      frameManager.Print ()
      print ("\n=========================================================\n\n")

      -- Return the other processes and their frames
      frameManager.ReturnAllFrames(&proc0.addrSpace)
      processManager.FreeProcess (proc0)
      frameManager.ReturnAllFrames(&proc2.addrSpace)
      processManager.FreeProcess (proc2)
      frameManager.ReturnAllFrames(&proc3.addrSpace)
      processManager.FreeProcess (proc3)

*/

      -- Run more thorough tests.
       RunThreadManagerTests ()
       RunProcessManagerTests ()
       RunFrameManagerTests ()
      
      count1()
      RuntimeExit ()

    endFunction

-----------------------------  GetUniqueNumber  ---------------------------------
--
-- This function returns a different number each time it is called.  It is passed
-- the number of unique numbers required, in "count".  Normally, count is 1.
-- If several unique numbers are needed, it can be called with a larger "count";
-- In this case, the numbers
--     ret, ret+1, ret+2, ... ret+count-1
-- will all be unique numbers that can be used.
--
  var uniqueNumberLock: Mutex = new Mutex
      nextUnique: int = 1

  function GetUniqueNumber (count: int) returns int
      var i: int
      uniqueNumberLock.Lock ()
      i = nextUnique
      nextUnique = nextUnique + count
      uniqueNumberLock.Unlock ()
      return i
    endFunction

-----------------------------  Misc  ---------------------------------
--
-- These are used by various testing functions.
--
  const NUM_THREADS = 20
        WAIT_TIME = 10
        NUMBER_ITERATIONS = 20

  var allDone: Semaphore = new Semaphore
      freeze: Semaphore = new Semaphore

-----------------------------  RunThreadManagerTests  ---------------------------------
--
-- This function tests the ThreadManager.  It creates a bunch of threads
-- (NUM_THREADS) and starts each thread running.  Each thread will execute
-- the "TestThreadManager" function.  The main thread will then wait until all
-- the threads complete.  To control this, there is a single Semaphore "allDone".
-- Each TestThreadManager thread signals it and the main thread will wait
-- for NUM-THREAD times, i.e., until all threads have finished.
--
-- Each TestThreadManager does basically this:
--        loop NUMBER_ITERATIONS times
--           call GetANewThread
--           wait
--           call FreeThread
--           wait
--        endLoop
--
  function RunThreadManagerTests ()
      var i: int
          th: ptr to Thread

      allDone.Init (0)
      freeze.Init (0)
      uniqueNumberLock.Init ()
      nextUnique = 1

      print ("\n\n*****  THREAD-MANAGER TEST  *****\n\n")

      for i = 1 to NUM_THREADS
        th = alloc Thread
        th.Init ("TestThreadManager")
        th.Fork (TestThreadManager, i)
      endFor

      -- Wait for all the testing threads to complete.
      -- (Make sure you see the completion message!)
      for i = 1 to NUM_THREADS
        allDone.Down ()
      endFor

      if GetUniqueNumber (1) != NUM_THREADS * NUMBER_ITERATIONS + 1
        FatalError ("Concurrency control failure (1)")
      endIf
      print ("\n\n***** THREAD-MANAGER TEST COMPLETED SUCCESSFULLY *****\n\n")

    endFunction

-----------------------------  TestThreadManager  ---------------------------------
--
-- This function is the main function for a thread which will test the
-- ThreadManager.  It will request and return Thread objects.  First, it
-- grabs a unique number and stuffs it in the Thread.  Later, it makes sure that
-- the number is unchanged.  It could only have changed if some other tester
-- was allowed to access this Thread object before this tester returned it.
--
  function TestThreadManager (myID: int)
      var i, j, e: int
          th: ptr to Thread
      -- printIntVar ("Thread started", myID)
      for i = 1 to NUMBER_ITERATIONS
        printInt (myID)
        e = GetUniqueNumber (1)
        th = threadManager.GetANewThread ()
        th.regs[0] = e
        for j = 1 to WAIT_TIME+i
          currentThread.Yield ()
        endFor
        if e != th.regs[0]
          FatalError ("Concurrency control failure (2)")
        endIf
        printChar ('.')
        threadManager.FreeThread (th)
        for j = 1 to WAIT_TIME-i
          currentThread.Yield ()
        endFor
      endFor
      allDone.Up ()
      freeze.Down ()
    endFunction

-----------------------------  RunProcessManagerTests  ---------------------------------
--
-- This function tests the ProcessManager.  It creates a bunch of tester threads
-- (NUM_THREADS) and starts each thread running.  Each tester thread will execute
-- the "TestProcessManager" function.  The main thread will then wait until all
-- the testers complete.  To control this, there is a single Semaphore "allDone".
-- Each TestProcessManager thread signals it and the main thread will wait
-- for NUM-THREAD times, i.e., until all tester threads have finished.
--
-- Each TestProcessManager does basically this:
--        loop NUMBER_ITERATIONS times
--           call GetANewProcess
--           wait
--           call FreeProcess
--           wait
--        endLoop
--
  function RunProcessManagerTests ()
      var i: int
          th: ptr to Thread

      allDone.Init (0)
      freeze.Init (0)
      uniqueNumberLock.Init ()
      nextUnique = 1

      print ("\n\n*****  PROCESS-MANAGER TEST  *****\n\n")

      for i = 1 to NUM_THREADS
        th = alloc Thread
        th.Init ("TestProcessManager")
        th.Fork (TestProcessManager, i)
      endFor

      -- Wait for all the testing threads to complete.
      -- (Make sure you see the completion message!)
      for i = 1 to NUM_THREADS
        allDone.Down ()
      endFor

      if GetUniqueNumber (1) != NUM_THREADS * NUMBER_ITERATIONS + 1
        FatalError ("Concurrency control failure (1)")
      endIf
      print ("\n\n***** PROCESS-MANAGER TEST COMPLETED SUCCESSFULLY *****\n\n")

    endFunction

-----------------------------  TestProcessManager  ---------------------------------
--
-- This function is the main function for a thread which will test the
-- ProcessManager.  It will request and return ProcessControlBlocks.  First, it
-- grabs a unique number and stuffs it in the PCB.  Later, it makes sure that
-- the number is unchanged.  It could only have changed if some other tester
-- was also allowed to access this ProcessContolBlock  before this tester
-- returned it.
--
  function TestProcessManager (myID: int)
      var i, j, e: int
          pcb: ptr to ProcessControlBlock
      -- printIntVar ("Thread started", myID)
      for i = 1 to NUMBER_ITERATIONS
        printInt (myID)
        e = GetUniqueNumber (1)
        pcb = processManager.GetANewProcess ()
        pcb.exitStatus = e
        for j = 1 to WAIT_TIME+i
          currentThread.Yield ()
        endFor
        if e != pcb.exitStatus
          FatalError ("Concurrency control failure (2)")
        endIf
        printChar ('.')
        processManager.FreeProcess (pcb)
        for j = 1 to WAIT_TIME-i
          currentThread.Yield ()
        endFor
      endFor
      allDone.Up ()
      freeze.Down ()
    endFunction

-----------------------------  RunFrameManagerTests  ---------------------------------
--
-- This function tests the FrameManager.  It creates one thread
-- for each ProcessControlBlock.  Each thread will execute
-- the "TestFrameManager" function.  The main thread will then wait until all
-- the threads complete.  To control this, there is a single Semaphore "allDone2".
-- Each TestFrameManager thread signals it and the main thread will wait
-- for NUM-THREAD times, i.e., until all threads have finished.
-- We also keep track of how many times each frame is used and print this
-- data (as a histogram) after all the threads have finished.
--
  const WAIT_TIME2 = 5
        NUMBER_ITERATIONS_2 = 5

  var allDone2: Semaphore = new Semaphore
      histogram: array [NUMBER_OF_PHYSICAL_PAGE_FRAMES] of int =
                    new array of int {NUMBER_OF_PHYSICAL_PAGE_FRAMES of 0 }

  function RunFrameManagerTests ()
      var i,j : int
          th: ptr to Thread

      allDone2.Init (0)
      freeze.Init (0)

      print ("\n\n*****  FRAME-MANAGER TEST  *****\n\n")
      
      for i = 1 to MAX_NUMBER_OF_PROCESSES
        th = alloc Thread
        th.Init ("TestFrameManager")
        th.Fork (TestFrameManager, i)
      endFor

      -- Wait for all the testing threads to complete.
      -- (Make sure you see the completion message!)
      for i = 1 to MAX_NUMBER_OF_PROCESSES
        allDone2.Down ()
      endFor

      print ("\n\nHere is a histogram showing how many times each frame was used:\n")
      for i = 0 to NUMBER_OF_PHYSICAL_PAGE_FRAMES-1
        print ("  ")
        printInt (i)
        print (":  ")
        for j = 0 to histogram[i]
          printChar ('*')
        endFor
        nl ()
      endFor

      print ("\n\n***** FRAME-MANAGER TEST COMPLETED SUCCESSFULLY *****\n\n")

    endFunction

-----------------------------  TestFrameManager  ---------------------------------
--
-- This function is the main function for a thread which will test the
-- FrameManager.
--
-- Each TestFrameManager does basically this:
--        get a PCB
--        loop NUMBER_ITERATIONS_2 times
--           for sz = 1, 2, 3, ... MAX
--             call GetNewFrames to get "sz" frames
--             check to make sure the pageTable looks good
--                    and store some data in the frames
--             wait
--             check to make sure the data we stored is still
--                    in the frames
--             call ReturnAllFrames
--             wait
--           endFor
--        endLoop
--
  function TestFrameManager (myID: int)
     var i, j, newData, sz: int
         pcb: ptr to ProcessControlBlock
      -- printIntVar ("Thread started", myID)
      pcb = processManager.GetANewProcess ()
      for i = 1 to NUMBER_ITERATIONS_2
        for sz = 1 to MAX_PAGES_PER_VIRT_SPACE-1
          printInt (myID)
          newData = GetUniqueNumber (sz)
          frameManager.GetNewFrames (&pcb.addrSpace, sz)
          CheckAddrSpace (&pcb.addrSpace, sz, newData)
          for j = 1 to WAIT_TIME+i
            currentThread.Yield ()
          endFor
          printChar ('.')
          CheckAddrSpace2 (&pcb.addrSpace, sz, newData)
          frameManager. ReturnAllFrames (&pcb.addrSpace)
          for j = 1 to WAIT_TIME-i
            currentThread.Yield ()
          endFor
        endFor
      endFor
      allDone2.Up ()
      processManager.FreeProcess (pcb)
      freeze.Down ()
    endFunction

-----------------------------  CheckAddrSpace  ---------------------------------
--
-- This function is passed a pointer to an address space.  It checks to make
-- sure that it looks good.  It also stores some data in each of the frames.
--
  function CheckAddrSpace (addrSpace: ptr to AddrSpace, n: int, uniq: int)
      var i, frameAddr, frameNumber: int
      if addrSpace.numberOfPages != n
        FatalError ("addrSpace.numberOfPages is wrong")
      endIf
      for i = 0 to n-1
        frameAddr = addrSpace.ExtractFrameAddr (i)
        frameNumber = (frameAddr - PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME) / PAGE_SIZE
        -- printIntVar ("frameNumber", frameNumber)
        if frameNumber < 0 ||
           frameNumber >= NUMBER_OF_PHYSICAL_PAGE_FRAMES ||
           frameAddr % PAGE_SIZE != 0
          FatalError ("Bad frame number in some addr space")
        endIf
        histogram[frameNumber] = histogram[frameNumber] + 1
        if addrSpace.ExtractUndefinedBits (i) != 0 ||
           addrSpace.IsDirty (i) ||
           addrSpace.IsReferenced (i) ||
           ! addrSpace.IsWritable (i) ||
           ! addrSpace. IsValid (i)
          FatalError ("Problems with bits in some page table entry")
        endIf
        * (frameAddr asPtrTo int) = uniq + i
      endFor
    endFunction

-----------------------------  CheckAddrSpace2  ---------------------------------
--
-- This function is passed a pointer to an address space.  It checks to make
-- sure that the data we stored in the frame earlier is still there.  The only
-- way it might have gotten corrupted is if some other thread also used this
-- frame.
--
  function CheckAddrSpace2 (addrSpace: ptr to AddrSpace, n: int, uniq: int)
      var i, frameAddr, frameNumber: int
      if addrSpace.numberOfPages != n
        FatalError ("addrSpace.numberOfPages is wrong")
      endIf
      for i = 0 to n-1
        frameAddr = addrSpace.ExtractFrameAddr (i)
        frameNumber = (frameAddr - PHYSICAL_ADDRESS_OF_FIRST_PAGE_FRAME) / PAGE_SIZE
        -- printIntVar ("frameNumber", frameNumber)
        if frameNumber < 0 ||
           frameNumber >= NUMBER_OF_PHYSICAL_PAGE_FRAMES ||
           frameAddr % PAGE_SIZE != 0
          FatalError ("Bad frame number in some addr space")
        endIf
        if * (frameAddr asPtrTo int) != uniq + i
          FatalError ("Data corruption, indicating that frame was shared")
        endIf
      endFor
    endFunction



------------------------------ Test Hoare -----------------------------------  
  -- This code implements the Hoare-semantics task.  There are several
  -- "increment", several "decrement", and a single shared value 'n'.
  --
  -- The increments are named 'Increment-1','Increment-2', 'Increment-3'.
  --  For each iteration, the increment thread will add its
  -- value to a shared variable 'n'.  For example, "Increment-1" will add 1  to
  -- the shared variable.
  --
  -- There are several Decrments.  Each decrement is a thread which executes.
  --  During each iteration of its loop, a decrement will subtract
  -- whatever value it has with 'n'. 
  --
  -- This code illustrates the mechanisms of Hoare-semantics where in, when 
  -- a thread-1 signals thread-2 , thread-1 is suspended and thread-2 wakes Up
  -- and runs immediately. (No other threads will run in between Signal() and 
  -- wake up of thread-2). thread-1 handles over the monitor mutex to thread-2 directly.
  -- Now, the thread-1 can run only when thread-2 leaves the monitor or in some other wait.
  -- thread-1 can only run if it is in the head of the waiting mutex list, if not other threads
  -- waiting will run before it.




-- the maximum value of the count variable 'n'
const 
    MAXcount1 = 10


var
    monh: Htest1
    HArr1: array [7] of Thread = new array of Thread {7 of new Thread}


    function count1()

      monh = new Htest1
      monh.Init()
      nl()
      nl()
      print("~~~~~~~~~~~~~~    HOARE TEST   ~~~~~~~~~~~~~~~")
      nl()
      nl()


      HArr1[0].Init("Increment-1")
      HArr1[0].Fork(Increment, 1)

      HArr1[1].Init("Increment-2")
      HArr1[1].Fork(Increment, 1)

      HArr1[2].Init("Increment-3")
      HArr1[2].Fork(Increment, 1)

      HArr1[3].Init("Decrement-4")
      HArr1[3].Fork(Decrement, 1)

      HArr1[4].Init("Decrement-5")
      HArr1[4].Fork(Decrement, 1)

      HArr1[5].Init("Decrement-6")
      HArr1[5].Fork(Decrement, 0)

      HArr1[6].Init("Decrement-7")
      HArr1[6].Fork(Decrement, 1)

      
    

      ThreadFinish()
endFunction

    -- wrapper function to call method Increment
    function Increment(value: int)
      monh.Increment(value)
    endFunction

    -- wrapper function to call method Decrement
    function Decrement(value: int)
      monh.Decrement(value)
    endFunction


    -- defining a class for count1()
    class Htest1
      superclass Object
      fields
        n: int
        countlock: Mutex
        countempty: HCondition
        countFull: HCondition
      methods
        Init()
        Increment(value: int)
        Decrement(value: int)
    endClass



behavior Htest1
  method Init()
  
  -- Initialize the required monitor lock, 'n' as MAXcount1 and 
  -- also two Hoare condition variables
    countlock = new Mutex
    countlock.Init()
    countempty = new HCondition
    countempty.Init()
    countFull = new HCondition
    countFull.Init()
    n = MAXcount1
    -- n = 0

  endMethod

  method Increment(value: int)
 
  -- Acquiring the monitor lock to increment the value of 'n'
    countlock.Lock()

    nl()
    print("                         ****INCREMENTING****")
    nl()
    nl()

    -- Print the current Thread which has entered and wants to increment
    print("Thread before Increment : ")
    print(currentThread.name)

    -- check if the current Thread can increment the value n or has to go
    -- to the waiting list
      if(n == MAXcount1 )
          nl()
          print(currentThread.name)
          print(".....................................WAIT MAXCOUNT REACHED")
          nl()
          nl()
       
        -- Put the thread to wait as the value of 'n' has reached maximum
          countFull.Wait(&countlock)

          nl()
          print("                         ****INCREMENTING****")
          nl()
          nl()

        -- print which thread has woken up from wait
          print(currentThread.name)
          print(".......................WOKE UP")
          nl()
      endIf

      -- Print which thread is about to increment the value of n
      nl()
      print("Thread before Increment : ")
      print(currentThread.name)

      -- increment the value with the value specified during Fork call()
      n = n + value
      nl()

      -- print the value after incrementing it
      nl()
      print("Value After Increment:  ")
      printInt(n)
      print("  ")

      -- Before issuing the signal print which threads holds the lock
      nl()
      print("Thread before Signal : ")
      print (currentThread.name)

      -- issue signal() to pass on the monitor mutex to next Thread
      countempty.Signal(&countlock)
     
    -- release the monitor lock
    countlock.Unlock()
    
  endMethod

  method Decrement(value: int)
    
    -- Acquiring the monitor lock to decrement the value of 'n'
    countlock.Lock()

    nl()
    print("                         ****DECREMENTING****")
    nl()
    print("Thread after Signal : ")
    printIntVar(currentThread.name,value)

    -- Put the thread to wait as the value of 'n' has reached 0
    if(n == 0)
        nl()

        -- print which thread has to be in waitlist because it tried to decrement
        -- the value of 'n' which is already 0
        print(currentThread.name)
        print(".....................................WAIT MAXCOUNT is 0")
        nl()

        -- put the current Thread into waiting list
        countempty.Wait(&countlock)

        -- print which thread has woken up from wait
        print(currentThread.name)
        print(".......................WOKE UP")
        nl()
    endIf

    -- decrement the value with the value specified during Fork call()
    n = n - value

    -- print the value after decrementing it
    nl()
    print("Value After Decrement:  ")
    printInt(n)
    print("  ")

    -- Before issuing the signal print which threads holds the lock
    nl()
    print("Thread before Signal : ")
    print (currentThread.name)

    -- issue signal() to pass on the monitor mutex to next Thread
    countFull.Signal(&countlock)

    -- release the monitor lock
    countlock.Unlock()
    
  endMethod
endBehavior

endCode

      

