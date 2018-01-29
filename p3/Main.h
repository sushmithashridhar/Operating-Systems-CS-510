-- Project3
-- SUSHMITHA SHRIDHAR
-- shridhar@pdx.edu

header Main

  uses System, Thread, Synch

  functions
    main ()

    class SleepingBarber1
    -- defining the class for SleepingBarber()
    	superclass Object
    	fields
    	-- initialize semaphores and the mutex lock being used
    		semaphorecustomer: Semaphore
    		semaphorebarber: Semaphore
    		waiting: int
    		sbmutex: Mutex
    	methods
    	-- initialize the methods being called
    		Barber()
    		Customer()
    		cut_hair()
    		get_haircut()
    		printingseats()
     endClass

    class FrontDesk
    -- defining the class for GamingParlor()
    superclass Object
    fields
    -- initialize condition variable, number of groups and the monitor lock being used
      GPmutex: Mutex
      numberOfDiceAvailable: int
      ArrivingGroup: int
      Group : Condition
    methods
    -- initialize the methods being called
      Init()
      Request(numberOfDice: int)
      Release(numberOfDice: int)
      Print (str: String, count: int)
    endClass

endHeader
