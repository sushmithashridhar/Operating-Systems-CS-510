code Main

  -- Project 3
  --
  -- SUSHMITHA SHRIDHAR
  -- shridhar@pdx.edu
  -- This package contains the following:
  --     SleepingBarber
  --     GamingParlor



-----------------------------  SynchTest  ---------------------------------

  function main ()
      print ("Example Thread-based Programs...\n")

      InitializeScheduler ()

      -----  Uncomment any one of the following to perform the desired test  -----


      -- SleepingBarber ()
      -- GamingParlor()


      ThreadFinish ()

    endFunction


---------------------------------sleeping barber-------------------------------------
-- This code is an implementation of the Sleeping Barber problem.  The barbers and customers are 
-- simulated with a thread.  If there are no customers present , the barber sits down in the barber chair and falls asleep.
-- When the customer arrives , he has to wake up the sleeping barber and if additional customers arrive, they needs to wait by sitting 
-- in the chair , if there are empty chairs available. If the chairs are full, they need to leave the shop. 
-- We need to declare three semaphores , one for customer which counts the waiting customers. 
-- Barbers, the number of barbers (0 or 1) who are idle, waiting for customers, and mutex, which is used for mutual
-- exclusion. We also need a variable, waiting, which also counts the waiting customers.
-- The reason for having waiting is that there is no way to read the current value of a semaphore. In this solution, 
-- a customer entering the shop has to count the number of waiting customers. 
-- When a customer arrives, he executes customer, 
-- starting by acquiring mutex to enter a critical region. If another customer enters shortly thereafter, the second one will no be
-- able to do anything until the first one has released mutex. The customer then checks to
-- see if the number of waiting customers is less than the number of chairs. If not, he releases mutex and leaves without a haircut.
-- If there is an available chair, the customer increments the integer variable, waiting.
-- Then he does an Up on the semaphore customers, thus waking up the barber. At this
-- point, the customer and the barber are both awake. When the customer releases mutex,
-- the barber grabs it, does some housekeeping, and begins the haircut. When the haircut is over, 
-- the customer exits the procedure and leaves the shop.

-- number of chairs available in the barber shop
const 
    CHAIRS=5
var
    S: SleepingBarber1
    thArray1: array [21] of Thread = new array of Thread { 21 of new Thread }


  function SleepingBarber()

      S = new SleepingBarber1

      S.semaphorecustomer = new Semaphore
      S.semaphorebarber = new Semaphore
      S.waiting = 0
      S.sbmutex = new Mutex
      S.sbmutex.Init()

      S.semaphorebarber.Init(0)
      S.semaphorecustomer.Init(0)

      thArray1[0].Init("Barber-1")
      thArray1[0].Fork(Barber,1)

      thArray1[1].Init("Customer-1")
      thArray1[1].Fork(Customer,1)

      thArray1[2].Init("Customer-2")
      thArray1[2].Fork(Customer,2)

      thArray1[3].Init("Customer-3")
      thArray1[3].Fork(Customer,3)

      thArray1[4].Init("Customer-4")
      thArray1[4].Fork(Customer,4)

      thArray1[5].Init("Customer-5")
      thArray1[5].Fork(Customer,5)

      thArray1[6].Init("Customer-6")
      thArray1[6].Fork(Customer,6)

      thArray1[7].Init("Customer-7")
      thArray1[7].Fork(Customer,7)

      thArray1[8].Init("Customer-8")
      thArray1[8].Fork(Customer,8)

      thArray1[9].Init("Customer-9")
      thArray1[9].Fork(Customer,9)

      thArray1[10].Init("Customer-10")
      thArray1[10].Fork(Customer,10)

      thArray1[11].Init("Customer-11")
      thArray1[11].Fork(Customer,11)

      thArray1[12].Init("Customer-12")
      thArray1[12].Fork(Customer,12)

      thArray1[13].Init("Customer-13")
      thArray1[13].Fork(Customer,13)

      thArray1[14].Init("Customer-14")
      thArray1[14].Fork(Customer,14)

      thArray1[15].Init("Customer-15")
      thArray1[15].Fork(Customer,15)

      thArray1[16].Init("Customer-16")
      thArray1[16].Fork(Customer,16)

      thArray1[17].Init("Customer-17")
      thArray1[17].Fork(Customer,17)

      thArray1[18].Init("Customer-18")
      thArray1[18].Fork(Customer,18)

      thArray1[19].Init("Customer-19")
      thArray1[19].Fork(Customer,19)

      thArray1[20].Init("Customer-20")
      thArray1[20].Fork(Customer,20)
      ThreadFinish ()

    endFunction
    
    -- wrapper function to call the method Barber
    function Barber()
    S.Barber()
    endFunction

    -- wrapper function to call the method Customer
    function Customer()
    S.Customer()
    endFunction

    -- wrapper function to call the method printingseats which will display the number of chairs that is available
    function printingseats()
    S.printingseats()
    endFunction

  behavior SleepingBarber1


    method Barber()
    -- var i:int
          while(true)

              -- checks if the number of customers waiting is 0
              -- if the number of waiting customers is 0, the barber will go to sleep
              semaphorecustomer.Down()

              -- acquire lock to access the global variable waiting , which has been used in 
              -- the function printingseats and also used to derement the number of waiting customers
              sbmutex.Lock()

              -- print the number of chairs that is available
              S.printingseats()

              -- prints the current barber thread name who is cutting the hair of one of the customer
              print("\n")
              print("     ")
              print(currentThread.name)
              print (" is cutting hair\n")

              -- since there is a customer who is available to get a hair cut, we need to decrement 
              -- waiting because one customer can get a hair cut.
              waiting = waiting -1

              -- customer wakes up the barber to get a hair cut
              semaphorebarber.Up()
    
              sbmutex.Unlock()

              -- cut_hair tells us that the current thread of barber is cutting the hair of a customer
              S.cut_hair()

          endWhile
    endMethod

    method Customer()
    -- var i: int
      -- The customer thread acquires the lock and enters critical section
      sbmutex.Lock()

      -- print the number of chairs that is available
      S.printingseats()

      -- priting which customer thread has entered the shop
      print("                           ")
      print(currentThread.name)
      print(" has entered\n")

      -- if the number os chairs available is more than the number of customers who are waiting in the chair
      -- the customer waits in the chair, otherwise he will leave the shop
      if waiting < CHAIRS

        -- we need to increment the waiting because the customer has come into the shop
        -- and is currently waiting in the chairs available
          waiting = waiting + 1

          -- print the number of chairs that is available
          S.printingseats()
     
          -- priting which customer thread has sat in the chair, waititng to get a hair cut done
          print("                                                      ")
          print(currentThread.name)
          print(" has sat in chair\n")

          -- another customer is now sitting in the chair
          semaphorecustomer.Up()
     
          -- release the lock before doing a down on barber , because if there are no
          -- barbers available , then the customer thread will go to sleep hodling the lock
          sbmutex.Unlock()

          -- check if the barber is available, if the barber is not available then the customer thread
          -- goes to sleep
          semaphorebarber.Down()

           --for i=1 to waiting
           --  print("X")
           --endFor
           --for i =1 to CHAIRS-waiting
           --  print("_")
           --endFor

          -- If the barber is available then the customer thread gets a hair cut, hence printMutex
          -- the current customer thread which is getting a hair cut
          print("\n")
          print("     ")
          print(currentThread.name)
          print(" is getting hair cut\n")
          S.get_haircut()
     
          --for i=1 to waiting
          --  print("X")
          --endFor
     
          --for i =1 to CHAIRS-waiting
          --  print("_")
          --endFor
     
          -- customer thread leaves the shop once he finishes getting hair cut.
          print("                                                                                 ")
          print(currentThread.name)
          print(" is leaving\n")
         
      else

          -- print the number of chairs that is available
          S.printingseats()

          -- print which customer thread is leaving as there were no chairs available
          -- to sit
          print("                                                                                 ")
          print(currentThread.name)
          print(" is leaving\n")

          -- give up the lock for customer
          sbmutex.Unlock()
      endIf
    endMethod

    method cut_hair()
        var i : int

        -- acquire lock as we are accessing the global variable waiting 
        -- in the function printingseats
        sbmutex.Lock()
    
        -- we need to yield because barber needs to cut hair which needs to last for a while 
        -- instead of ending directly as it starts
        for i=1 to 100
            currentThread.Yield()
        endFor
    
        -- print the number of chairs that is available
        S.printingseats()
    
        -- Print that the barber is done cutting the hair
        print("\n")
        print("     ")
        print(currentThread.name)
        print(" is done cutting\n")

        sbmutex.Unlock()
    endMethod

    method get_haircut()
        var i: int

        -- acquire lock as we are accessing the global variable waiting 
        -- in the function printingseats
        sbmutex.Lock()
    
        -- print the number of chairs that is available
        S.printingseats()
        
        -- we need to yield because customer needs to get a hair cut which needs to last for a while 
        -- instead of ending directly as it starts
        for i=1 to 100
            currentThread.Yield()
        endFor
    
        -- Print that the customer is done cutting the hair
        print("\n")
        print("     ")
        print(currentThread.name)
        print(" is done getting hair cut\n")
        sbmutex.Unlock()
       
    endMethod

    method printingseats()

    -- The value 'X' indicates that the seats are occupied
    -- and the value '_' indicates that a seat is available
    var i:int
        for i=1 to waiting
            print("X")
        endFor
        for i =1 to CHAIRS-waiting
            print("_")
        endFor
    endMethod

  endBehavior

    



----------------------------------------------------GamingParlor------------------------------------------------------
-- The groups of customers come in to a “gaming parlor” to play games. They go
-- to the front desk to obtain one or more dice, which are used by the group while they are playing their
-- game, and then returned to the front desk. The front desk is in charge of lending out the dice and
-- collecting them after each game is finished. The gaming parlor owns only 8 dice, which are available at the front desk 
-- before the first group comes in. We have modeled each group of customers as a thread. 
-- When a group is ready to play, it obtains the necessary
-- number of dice. If the required number of dice is not available, then the group (i.e., the thread) must
-- wait. You might use a condition variable that “more dice have become available.”
-- You should model the following eight different groups. Each group plays one game, as shown below,
-- but each group plays its game 5 times. Each group must return their dice after each game and then reacquire
-- the dice before playing again.
-- A – Backgammon
-- B – Backgammon
-- C – Risk
-- D – Risk
-- E – Monopoly
-- F – Monopoly
-- G – Pictionary
-- H – Pictionary

  var
      fd: FrontDesk
      Customers: array [8] of Thread = new array of Thread {8 of new Thread }
  
  function GamingParlor()
      
      fd = new FrontDesk
      fd.Init()
  
      Customers[0].Init("A")
      Customers[0].Fork(Play,4)
  
      Customers[1].Init("B")
      Customers[1].Fork(Play,4)
  
      Customers[2].Init("C")
      Customers[2].Fork(Play,5)
  
      Customers[3].Init("D")
      Customers[3].Fork(Play,5)
  
      Customers[4].Init("E")
      Customers[4].Fork(Play,2)
  
      Customers[5].Init("F")
      Customers[5].Fork(Play,2)
  
      Customers[6].Init("G")
      Customers[6].Fork(Play,1)
  
      Customers[7].Init("H")
      Customers[7].Fork(Play,1)
  
      ThreadFinish()
  endFunction

  function Play(numberOfDice: int)
  -- The parameter numberOfDice indicates how many dices a particular group is playing with
      var i: int
      for i = 1 to 5

          -- function in order to process the requested number of dice for the game
          fd.Request(numberOfDice)

          --yield for other arriving threads to simulate the game
          currentThread.Yield()

          -- function releasing which will release the dice held by the group
          -- once the group is done playing the game
          fd.Release(numberOfDice)

          
      endFor
  endFunction

  -- wrapper function to call the method Init
  function Init()
    fd.Init()
  endFunction

  -- wrapper function to call the method Request
  function Request(numberOfDice: int)
    fd.Request(numberOfDice)
  endFunction

  -- wrapper function to call the method Release
  function Release(numberOfDice: int)
    fd.Release(numberOfDice)
  endFunction

  -- wrapper function to call the method Print
  function Print(str: String, count: int)
    fd.Print(str,count)
  endFunction

    behavior FrontDesk

      method Init()
        -- Initialize the required montior lock , numberOfDiceAvailable as 8 and 
        --current group playing the same as zero.
        GPmutex = new Mutex
        GPmutex.Init()
        numberOfDiceAvailable = 8
        Group = new Condition
        Group.Init()
        ArrivingGroup = 0
      endMethod

      method Request(numberOfDice: int) 

        -- acquiring the lock in order to obtain the dice is they are available
        GPmutex.Lock()

        -- print the amount of dice required for the current game
        self.Print ("requests", numberOfDice)

        -- increment the group to indicate that the group needs to obatin the dice
        ArrivingGroup = ArrivingGroup + 1

        -- If there are groups already present, then we put the group that has arrived 
        -- into the waiting list
        if ArrivingGroup > 1
          Group.Wait(&GPmutex)
        endIf

        -- check if the number of dices required meets the amount that the group is requesting
        -- if the reuired amount of dice is not available, go to waitlist
        while numberOfDiceAvailable < numberOfDice
          Group.Wait(&GPmutex)
        endWhile

        -- If the dice is available then acquire  the dices and decrement the total number of dice 
        -- which is available
        numberOfDiceAvailable = numberOfDiceAvailable - numberOfDice

        -- Once you get the dice, before leaving , go out of the waiting list and Signal other groups
        -- that they can request the available dice
        ArrivingGroup = ArrivingGroup - 1
        Group.Signal(&GPmutex)

        -- print the number of dice you are leaving with
        self.Print ("proceeds with", numberOfDice)

        -- release the monitor lock
        GPmutex.Unlock()
      endMethod
      
      method Release(numberOfDice: int)  
        -- acquiring the lock in order to release the dice once you are done playing
        GPmutex.Lock()

        -- when we release the dice , we need to increment the total dice which is available
        numberOfDiceAvailable = numberOfDiceAvailable + numberOfDice

        -- prints which group releases the dice and the number of dice which it adds back 
        -- to the total number of dice
        self.Print ("releases and adds back", numberOfDice)

        -- wake up the group from the waiting list to indicate they can try checking
        -- if the required number of dices are available
        Group.Signal(&GPmutex)

        -- release the monitor lock
        GPmutex.Unlock()
      endMethod

      method Print (str: String, count: int)
        --
        -- This method prints the current threads name and the arguments.
        -- It also prints the current number of dice available.
        --
        print (currentThread.name)
        print (" ")
        print (str)
        print (" ")
        printInt (count)
        nl ()
        print ("------------------------------Number of dice now avail = ")
        printInt (numberOfDiceAvailable)
        nl ()
      endMethod
    endBehavior
endCode
