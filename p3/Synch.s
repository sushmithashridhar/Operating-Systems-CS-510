! Name of package being compiled: Synch
! 
! Symbols from runtime.s
	.import	_putString
	.import	_heapInitialize
	.import	_heapAlloc
	.import	_heapFree
	.import	_IsKindOf
	.import	_RestoreCatchStack
	.import	_PerformThrow
	.import	_runtimeErrorOverflow
	.import	_runtimeErrorZeroDivide
	.import	_runtimeErrorNullPointer
	.import	_runtimeErrorUninitializedObject
	.import	_runtimeErrorWrongObject
	.import	_runtimeErrorWrongObject2
	.import	_runtimeErrorWrongObject3
	.import	_runtimeErrorBadObjectSize
	.import	_runtimeErrorDifferentArraySizes
	.import	_runtimeErrorWrongArraySize
	.import	_runtimeErrorUninitializedArray
	.import	_runtimeErrorBadArrayIndex
	.import	_runtimeErrorNullPointerDuringCall
	.import	_runtimeErrorArrayCountNotPositive
	.import	_runtimeErrorRestoreCatchStackError
	.text
! ErrorDecls
	.import	_Error_P_System_UncaughtThrowError
	.align
! Functions imported from other packages
	.import	print
	.import	printInt
	.import	printHex
	.import	printChar
	.import	printBool
	.import	_P_System_MemoryEqual
	.import	_P_System_StrEqual
	.import	_P_System_StrCopy
	.import	_P_System_StrCmp
	.import	_P_System_Min
	.import	_P_System_Max
	.import	_P_System_printIntVar
	.import	_P_System_printHexVar
	.import	_P_System_printBoolVar
	.import	_P_System_printCharVar
	.import	_P_System_printPtr
	.import	_P_System_nl
	.import	Cleari
	.import	Seti
	.import	Wait
	.import	RuntimeExit
	.import	getCatchStack
	.import	MemoryZero
	.import	MemoryCopy
	.import	_P_System_KPLSystemInitialize
	.import	_P_System_KPLMemoryAlloc
	.import	_P_System_KPLMemoryFree
	.import	_P_System_KPLUncaughtThrow
	.import	_P_System_KPLIsKindOf
	.import	_P_System_KPLSystemError
	.import	_P_Thread_InitializeScheduler
	.import	_P_Thread_Run
	.import	_P_Thread_PrintReadyList
	.import	_P_Thread_ThreadStartMain
	.import	_P_Thread_ThreadFinish
	.import	_P_Thread_FatalError
	.import	_P_Thread_SetInterruptsTo
	.import	_P_Thread_TimerInterruptHandler
	.import	Switch
	.import	ThreadStartUp
! Externally visible functions in this package
! The following class and its methods are from other packages
	.import	_P_System_Object
! The following class and its methods are from other packages
	.import	_P_List_List
! The following class and its methods are from other packages
	.import	_P_List_Listable
! The following class and its methods are from other packages
	.import	_P_Thread_Thread
! The following class and its methods are from this package
	.export	_P_Synch_Semaphore
	.export	_Method_P_Synch_Semaphore_1
	.export	_Method_P_Synch_Semaphore_2
	.export	_Method_P_Synch_Semaphore_3
! The following class and its methods are from this package
	.export	_P_Synch_Mutex
	.export	_Method_P_Synch_Mutex_1
	.export	_Method_P_Synch_Mutex_2
	.export	_Method_P_Synch_Mutex_3
	.export	_Method_P_Synch_Mutex_4
! The following class and its methods are from this package
	.export	_P_Synch_Condition
	.export	_Method_P_Synch_Condition_1
	.export	_Method_P_Synch_Condition_2
	.export	_Method_P_Synch_Condition_3
	.export	_Method_P_Synch_Condition_4
! The following interfaces are from other packages
! The following interfaces are from this package
! Globals imported from other packages
	.import	_P_Thread_readyList
	.import	_P_Thread_currentThread
	.import	_P_Thread_mainThread
	.import	_P_Thread_idleThread
	.import	_P_Thread_threadsToBeDestroyed
	.import	_P_Thread_currentInterruptStatus
! Global variables in this package
	.data
	.align
! String constants
_StringConst_7:
	.word	54			! length
	.ascii	"Attempt to broadcast a condition when lock is not held"
	.align
_StringConst_6:
	.word	52			! length
	.ascii	"Attempt to signal a condition when mutex is not held"
	.align
_StringConst_5:
	.word	51			! length
	.ascii	"Attempt to wait on condition when mutex is not held"
	.align
_StringConst_4:
	.word	39			! length
	.ascii	" Current thread is not holding the lock"
	.align
_StringConst_3:
	.word	51			! length
	.ascii	"Semaphore count underflowed during \'Down\' operation"
	.align
_StringConst_2:
	.word	48			! length
	.ascii	"Semaphore count overflowed during \'Up\' operation"
	.align
_StringConst_1:
	.word	39			! length
	.ascii	"Semaphore created with initialCount < 0"
	.align
	.text
! 
! Source Filename and Package Name
! 
_sourceFileName:
	.ascii	"Synch.c\0"
_packageName:
	.ascii	"Synch\0"
	.align
!
! CheckVersion
!
!     This routine is passed:
!       r2 = ptr to the name of the 'using' package
!       r3 = the expected hashVal for 'used' package (myPackage)
!     It prints an error message if the expected hashVal is not correct
!     It then checks all the packages that 'myPackage' uses.
!
!     This routine returns:
!       r1:  0=No problems, 1=Problems
!
!     Registers modified: r1-r4
!
_CheckVersion_P_Synch_:
	.export	_CheckVersion_P_Synch_
	set	0xe832f335,r4		! myHashVal = -399314123
	cmp	r3,r4
	be	_Label_8
	set	_CVMess1,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess2,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess3,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess4,r1
	call	_putString
	mov	r2,r1			! print using package
	call	_putString
	set	_CVMess5,r1
	call	_putString
	set	_packageName,r1		! print myPackage
	call	_putString
	set	_CVMess6,r1
	call	_putString
	mov	1,r1
	ret	
_Label_8:
	mov	0,r1
! Make sure _P_System_ has hash value 0xfe42cccc (decimal -29176628)
	set	_packageName,r2
	set	0xfe42cccc,r3
	call	_CheckVersion_P_System_
	.import	_CheckVersion_P_System_
	cmp	r1,0
	bne	_Label_9
! Make sure _P_List_ has hash value 0xafebcabb (decimal -1343501637)
	set	_packageName,r2
	set	0xafebcabb,r3
	call	_CheckVersion_P_List_
	.import	_CheckVersion_P_List_
	cmp	r1,0
	bne	_Label_9
! Make sure _P_Thread_ has hash value 0xd98e6cc5 (decimal -644977467)
	set	_packageName,r2
	set	0xd98e6cc5,r3
	call	_CheckVersion_P_Thread_
	.import	_CheckVersion_P_Thread_
	cmp	r1,0
	bne	_Label_9
_Label_9:
	ret
_CVMess1:	.ascii	"\nVERSION CONSISTENCY ERROR: Package '\0"
_CVMess2:	.ascii	"' uses package '\0"
_CVMess3:	.ascii	"'.  Whenever a header file is modified, all packages that use that package (directly or indirectly) must be recompiled.  The header file for '\0"
_CVMess4:	.ascii	"' has been changed since '\0"
_CVMess5:	.ascii	"' was compiled last.  Please recompile all packages that depend on '\0"
_CVMess6:	.ascii	"'.\n\n\0"
	.align
! 
! ===============  CLASS Semaphore  ===============
! 
! Dispatch Table:
! 
_P_Synch_Semaphore:
	.word	_Label_10
	jmp	_Method_P_Synch_Semaphore_1	! 4:	Init
	jmp	_Method_P_Synch_Semaphore_3	! 8:	Down
	jmp	_Method_P_Synch_Semaphore_2	! 12:	Up
	.word	0
! 
! Class descriptor:
! 
_Label_10:
	.word	1129070931		! Magic number 0x434c4153 == 'CLAS'
	.word	_Label_11
	.word	_sourceFileName
	.word	5		! line number
	.word	20		! size of instances, in bytes
	.word	_P_Synch_Semaphore
	.word	_P_System_Object
	.word	0
_Label_11:
	.ascii	"Semaphore\0"
	.align
! 
! ===============  METHOD Init  ===============
! 
_Method_P_Synch_Semaphore_1:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Semaphore_1,r1
	push	r1
	mov	3,r1
_Label_143:
	push	r0
	sub	r1,1,r1
	bne	_Label_143
	mov	33,r13		! source line 33
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	34,r13		! source line 34
	mov	"\0\0IF",r10
!   if initialCount >= 0 then goto _Label_13		(int)
	load	[r14+12],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_13
!	jmp	_Label_12
_Label_12:
! THEN...
	mov	35,r13		! source line 35
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_14 = _StringConst_1
	set	_StringConst_1,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_14  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	35,r13		! source line 35
	mov	"\0\0CA",r10
	call	_P_Thread_FatalError
! END IF...
_Label_13:
! ASSIGNMENT STATEMENT...
	mov	37,r13		! source line 37
	mov	"\0\0AS",r10
!   count = initialCount		(4 bytes)
	load	[r14+12],r1
	load	[r14+8],r2
	store	r1,[r2+4]
! ASSIGNMENT STATEMENT...
	mov	38,r13		! source line 38
	mov	"\0\0AS",r10
!   NEW CLASS Constructor...
!   ZeroMemory: waitingThreads = zeros  (sizeInBytes=12)
	load	[r14+8],r4
	add	r4,8,r4
	store	r0,[r4]
	store	r0,[r4+4]
	store	r0,[r4+8]
!   waitingThreads = _P_List_List
	set	_P_List_List,r1
	load	[r14+8],r2
	store	r1,[r2+8]
! RETURN STATEMENT...
	mov	38,r13		! source line 38
	mov	"\0\0RE",r10
	add	r15,16,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Semaphore_1:
	.word	_sourceFileName
	.word	_Label_16
	.word	8		! total size of parameters
	.word	12		! frame size = 12
	.word	_Label_17
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_18
	.word	12
	.word	4
	.word	_Label_19
	.word	-12
	.word	4
	.word	_Label_20
	.word	-16
	.word	4
	.word	0
_Label_16:
	.ascii	"Semaphore"
	.ascii	"::"
	.ascii	"Init\0"
	.align
_Label_17:
	.ascii	"Pself\0"
	.align
_Label_18:
	.byte	'I'
	.ascii	"initialCount\0"
	.align
_Label_19:
	.byte	'?'
	.ascii	"_temp_15\0"
	.align
_Label_20:
	.byte	'?'
	.ascii	"_temp_14\0"
	.align
! 
! ===============  METHOD Up  ===============
! 
_Method_P_Synch_Semaphore_2:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Semaphore_2,r1
	push	r1
	mov	8,r1
_Label_144:
	push	r0
	sub	r1,1,r1
	bne	_Label_144
	mov	43,r13		! source line 43
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	47,r13		! source line 47
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Call the function
	mov	47,r13		! source line 47
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-28]
! IF STATEMENT...
	mov	48,r13		! source line 48
	mov	"\0\0IF",r10
!   if count != 2147483647 then goto _Label_22		(int)
	load	[r14+8],r1
	load	[r1+4],r1
	set	2147483647,r2
	cmp	r1,r2
	bne	_Label_22
!	jmp	_Label_21
_Label_21:
! THEN...
	mov	49,r13		! source line 49
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_23 = _StringConst_2
	set	_StringConst_2,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_23  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	49,r13		! source line 49
	mov	"\0\0CA",r10
	call	_P_Thread_FatalError
! END IF...
_Label_22:
! ASSIGNMENT STATEMENT...
	mov	51,r13		! source line 51
	mov	"\0\0AS",r10
!   count = count + 1		(int)
	load	[r14+8],r1
	load	[r1+4],r1
	mov	1,r2
	add	r1,r2,r1
	bvs	_runtimeErrorOverflow
	load	[r14+8],r2
	store	r1,[r2+4]
! IF STATEMENT...
	mov	52,r13		! source line 52
	mov	"\0\0IF",r10
!   if count > 0 then goto _Label_25		(int)
	load	[r14+8],r1
	load	[r1+4],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bg	_Label_25
!	jmp	_Label_24
_Label_24:
! THEN...
	mov	53,r13		! source line 53
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	53,r13		! source line 53
	mov	"\0\0AS",r10
	mov	53,r13		! source line 53
	mov	"\0\0SE",r10
!   _temp_26 = &waitingThreads
	load	[r14+8],r1
	add	r1,8,r1
	store	r1,[r14+-20]
!   Send message Remove
	load	[r14+-20],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=t  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-32]
! ASSIGNMENT STATEMENT...
	mov	54,r13		! source line 54
	mov	"\0\0AS",r10
!   if intIsZero (t) then goto _runtimeErrorNullPointer
	load	[r14+-32],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_27 = t + 76
	load	[r14+-32],r1
	add	r1,76,r1
	store	r1,[r14+-16]
!   Data Move: *_temp_27 = 2  (sizeInBytes=4)
	mov	2,r1
	load	[r14+-16],r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	55,r13		! source line 55
	mov	"\0\0SE",r10
!   _temp_28 = &_P_Thread_readyList
	set	_P_Thread_readyList,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=12  value=t  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+4]
!   Send message AddToEnd
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! END IF...
_Label_25:
! ASSIGNMENT STATEMENT...
	mov	57,r13		! source line 57
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=oldIntStat  sizeInBytes=4
	load	[r14+-28],r1
	store	r1,[r15+0]
!   Call the function
	mov	57,r13		! source line 57
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-28]
! RETURN STATEMENT...
	mov	57,r13		! source line 57
	mov	"\0\0RE",r10
	add	r15,36,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Semaphore_2:
	.word	_sourceFileName
	.word	_Label_29
	.word	4		! total size of parameters
	.word	32		! frame size = 32
	.word	_Label_30
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_31
	.word	-12
	.word	4
	.word	_Label_32
	.word	-16
	.word	4
	.word	_Label_33
	.word	-20
	.word	4
	.word	_Label_34
	.word	-24
	.word	4
	.word	_Label_35
	.word	-28
	.word	4
	.word	_Label_36
	.word	-32
	.word	4
	.word	0
_Label_29:
	.ascii	"Semaphore"
	.ascii	"::"
	.ascii	"Up\0"
	.align
_Label_30:
	.ascii	"Pself\0"
	.align
_Label_31:
	.byte	'?'
	.ascii	"_temp_28\0"
	.align
_Label_32:
	.byte	'?'
	.ascii	"_temp_27\0"
	.align
_Label_33:
	.byte	'?'
	.ascii	"_temp_26\0"
	.align
_Label_34:
	.byte	'?'
	.ascii	"_temp_23\0"
	.align
_Label_35:
	.byte	'I'
	.ascii	"oldIntStat\0"
	.align
_Label_36:
	.byte	'P'
	.ascii	"t\0"
	.align
! 
! ===============  METHOD Down  ===============
! 
_Method_P_Synch_Semaphore_3:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Semaphore_3,r1
	push	r1
	mov	5,r1
_Label_145:
	push	r0
	sub	r1,1,r1
	bne	_Label_145
	mov	62,r13		! source line 62
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	65,r13		! source line 65
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Call the function
	mov	65,r13		! source line 65
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-20]
! IF STATEMENT...
	mov	66,r13		! source line 66
	mov	"\0\0IF",r10
!   if count != -2147483648 then goto _Label_38		(int)
	load	[r14+8],r1
	load	[r1+4],r1
	set	0x80000000,r2
	cmp	r1,r2
	bne	_Label_38
!	jmp	_Label_37
_Label_37:
! THEN...
	mov	67,r13		! source line 67
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_39 = _StringConst_3
	set	_StringConst_3,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=8  value=_temp_39  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	67,r13		! source line 67
	mov	"\0\0CA",r10
	call	_P_Thread_FatalError
! END IF...
_Label_38:
! ASSIGNMENT STATEMENT...
	mov	69,r13		! source line 69
	mov	"\0\0AS",r10
!   count = count - 1		(int)
	load	[r14+8],r1
	load	[r1+4],r1
	mov	1,r2
	sub	r1,r2,r1
	bvs	_runtimeErrorOverflow
	load	[r14+8],r2
	store	r1,[r2+4]
! IF STATEMENT...
	mov	70,r13		! source line 70
	mov	"\0\0IF",r10
!   if count >= 0 then goto _Label_41		(int)
	load	[r14+8],r1
	load	[r1+4],r1
	mov	0,r2
	cmp	r1,r2
	bvs	_runtimeErrorOverflow
	bge	_Label_41
!	jmp	_Label_40
_Label_40:
! THEN...
	mov	71,r13		! source line 71
	mov	"\0\0TN",r10
! SEND STATEMENT...
	mov	71,r13		! source line 71
	mov	"\0\0SE",r10
!   _temp_42 = &waitingThreads
	load	[r14+8],r1
	add	r1,8,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=12  value=_P_Thread_currentThread  sizeInBytes=4
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	store	r1,[r15+4]
!   Send message AddToEnd
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! SEND STATEMENT...
	mov	72,r13		! source line 72
	mov	"\0\0SE",r10
!   if intIsZero (_P_Thread_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Sleep
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
! END IF...
_Label_41:
! ASSIGNMENT STATEMENT...
	mov	74,r13		! source line 74
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=oldIntStat  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	74,r13		! source line 74
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-20]
! RETURN STATEMENT...
	mov	74,r13		! source line 74
	mov	"\0\0RE",r10
	add	r15,24,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Semaphore_3:
	.word	_sourceFileName
	.word	_Label_43
	.word	4		! total size of parameters
	.word	20		! frame size = 20
	.word	_Label_44
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_45
	.word	-12
	.word	4
	.word	_Label_46
	.word	-16
	.word	4
	.word	_Label_47
	.word	-20
	.word	4
	.word	0
_Label_43:
	.ascii	"Semaphore"
	.ascii	"::"
	.ascii	"Down\0"
	.align
_Label_44:
	.ascii	"Pself\0"
	.align
_Label_45:
	.byte	'?'
	.ascii	"_temp_42\0"
	.align
_Label_46:
	.byte	'?'
	.ascii	"_temp_39\0"
	.align
_Label_47:
	.byte	'I'
	.ascii	"oldIntStat\0"
	.align
! 
! ===============  CLASS Mutex  ===============
! 
! Dispatch Table:
! 
_P_Synch_Mutex:
	.word	_Label_48
	jmp	_Method_P_Synch_Mutex_1	! 4:	Init
	jmp	_Method_P_Synch_Mutex_2	! 8:	Lock
	jmp	_Method_P_Synch_Mutex_3	! 12:	Unlock
	jmp	_Method_P_Synch_Mutex_4	! 16:	IsHeldByCurrentThread
	.word	0
! 
! Class descriptor:
! 
_Label_48:
	.word	1129070931		! Magic number 0x434c4153 == 'CLAS'
	.word	_Label_49
	.word	_sourceFileName
	.word	16		! line number
	.word	24		! size of instances, in bytes
	.word	_P_Synch_Mutex
	.word	_P_System_Object
	.word	0
_Label_49:
	.ascii	"Mutex\0"
	.align
! 
! ===============  METHOD Init  ===============
! 
_Method_P_Synch_Mutex_1:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Mutex_1,r1
	push	r1
	mov	1,r1
_Label_146:
	push	r0
	sub	r1,1,r1
	bne	_Label_146
	mov	97,r13		! source line 97
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	98,r13		! source line 98
	mov	"\0\0AS",r10
!   hold = 0		(4 bytes)
	mov	0,r1
	load	[r14+8],r2
	store	r1,[r2+8]
! ASSIGNMENT STATEMENT...
	mov	99,r13		! source line 99
	mov	"\0\0AS",r10
!   NEW CLASS Constructor...
!   ZeroMemory: waitingThreads = zeros  (sizeInBytes=12)
	load	[r14+8],r4
	add	r4,12,r4
	store	r0,[r4]
	store	r0,[r4+4]
	store	r0,[r4+8]
!   waitingThreads = _P_List_List
	set	_P_List_List,r1
	load	[r14+8],r2
	store	r1,[r2+12]
! RETURN STATEMENT...
	mov	99,r13		! source line 99
	mov	"\0\0RE",r10
	add	r15,8,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Mutex_1:
	.word	_sourceFileName
	.word	_Label_51
	.word	4		! total size of parameters
	.word	4		! frame size = 4
	.word	_Label_52
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_53
	.word	-12
	.word	4
	.word	0
_Label_51:
	.ascii	"Mutex"
	.ascii	"::"
	.ascii	"Init\0"
	.align
_Label_52:
	.ascii	"Pself\0"
	.align
_Label_53:
	.byte	'?'
	.ascii	"_temp_50\0"
	.align
! 
! ===============  METHOD Lock  ===============
! 
_Method_P_Synch_Mutex_2:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Mutex_2,r1
	push	r1
	mov	4,r1
_Label_147:
	push	r0
	sub	r1,1,r1
	bne	_Label_147
	mov	104,r13		! source line 104
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	106,r13		! source line 106
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Call the function
	mov	106,r13		! source line 106
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=interrupt  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
! IF STATEMENT...
	mov	107,r13		! source line 107
	mov	"\0\0IF",r10
!   if intIsZero (hold) then goto _Label_54
	load	[r14+8],r1
	load	[r1+8],r1
	cmp	r1,r0
	be	_Label_54
	jmp	_Label_55
_Label_54:
! THEN...
	mov	108,r13		! source line 108
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	108,r13		! source line 108
	mov	"\0\0AS",r10
!   hold = _P_Thread_currentThread		(4 bytes)
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	load	[r14+8],r2
	store	r1,[r2+8]
	jmp	_Label_56
_Label_55:
! ELSE...
	mov	110,r13		! source line 110
	mov	"\0\0EL",r10
! SEND STATEMENT...
	mov	110,r13		! source line 110
	mov	"\0\0SE",r10
!   _temp_57 = &waitingThreads
	load	[r14+8],r1
	add	r1,12,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=12  value=_P_Thread_currentThread  sizeInBytes=4
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	store	r1,[r15+4]
!   Send message AddToEnd
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! SEND STATEMENT...
	mov	111,r13		! source line 111
	mov	"\0\0SE",r10
!   if intIsZero (_P_Thread_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Sleep
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
! END IF...
_Label_56:
! ASSIGNMENT STATEMENT...
	mov	113,r13		! source line 113
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=interrupt  sizeInBytes=4
	load	[r14+-16],r1
	store	r1,[r15+0]
!   Call the function
	mov	113,r13		! source line 113
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=interrupt  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-16]
! RETURN STATEMENT...
	mov	113,r13		! source line 113
	mov	"\0\0RE",r10
	add	r15,20,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Mutex_2:
	.word	_sourceFileName
	.word	_Label_58
	.word	4		! total size of parameters
	.word	16		! frame size = 16
	.word	_Label_59
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_60
	.word	-12
	.word	4
	.word	_Label_61
	.word	-16
	.word	4
	.word	0
_Label_58:
	.ascii	"Mutex"
	.ascii	"::"
	.ascii	"Lock\0"
	.align
_Label_59:
	.ascii	"Pself\0"
	.align
_Label_60:
	.byte	'?'
	.ascii	"_temp_57\0"
	.align
_Label_61:
	.byte	'I'
	.ascii	"interrupt\0"
	.align
! 
! ===============  METHOD Unlock  ===============
! 
_Method_P_Synch_Mutex_3:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Mutex_3,r1
	push	r1
	mov	8,r1
_Label_148:
	push	r0
	sub	r1,1,r1
	bne	_Label_148
	mov	118,r13		! source line 118
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	121,r13		! source line 121
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Call the function
	mov	121,r13		! source line 121
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=interrupt  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-28]
! IF STATEMENT...
	mov	122,r13		! source line 122
	mov	"\0\0IF",r10
!   if hold == _P_Thread_currentThread then goto _Label_63		(int)
	load	[r14+8],r1
	load	[r1+8],r1
	set	_P_Thread_currentThread,r2
	load	[r2],r2
	cmp	r1,r2
	be	_Label_63
!	jmp	_Label_62
_Label_62:
! THEN...
	mov	123,r13		! source line 123
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_64 = _StringConst_4
	set	_StringConst_4,r1
	store	r1,[r14+-24]
!   Prepare Argument: offset=8  value=_temp_64  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	123,r13		! source line 123
	mov	"\0\0CA",r10
	call	_P_Thread_FatalError
	jmp	_Label_65
_Label_63:
! ELSE...
	mov	125,r13		! source line 125
	mov	"\0\0EL",r10
! ASSIGNMENT STATEMENT...
	mov	125,r13		! source line 125
	mov	"\0\0AS",r10
	mov	125,r13		! source line 125
	mov	"\0\0SE",r10
!   _temp_66 = &waitingThreads
	load	[r14+8],r1
	add	r1,12,r1
	store	r1,[r14+-20]
!   Send message Remove
	load	[r14+-20],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=threadptr  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-32]
! IF STATEMENT...
	mov	126,r13		! source line 126
	mov	"\0\0IF",r10
!   if threadptr == 0 then goto _Label_68		(int)
	load	[r14+-32],r1
	mov	0,r2
	cmp	r1,r2
	be	_Label_68
!	jmp	_Label_67
_Label_67:
! THEN...
	mov	127,r13		! source line 127
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	127,r13		! source line 127
	mov	"\0\0AS",r10
!   if intIsZero (threadptr) then goto _runtimeErrorNullPointer
	load	[r14+-32],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_69 = threadptr + 76
	load	[r14+-32],r1
	add	r1,76,r1
	store	r1,[r14+-16]
!   Data Move: *_temp_69 = 2  (sizeInBytes=4)
	mov	2,r1
	load	[r14+-16],r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	128,r13		! source line 128
	mov	"\0\0SE",r10
!   _temp_70 = &_P_Thread_readyList
	set	_P_Thread_readyList,r1
	store	r1,[r14+-12]
!   Prepare Argument: offset=12  value=threadptr  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+4]
!   Send message AddToEnd
	load	[r14+-12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	129,r13		! source line 129
	mov	"\0\0AS",r10
!   hold = threadptr		(4 bytes)
	load	[r14+-32],r1
	load	[r14+8],r2
	store	r1,[r2+8]
	jmp	_Label_71
_Label_68:
! ELSE...
	mov	131,r13		! source line 131
	mov	"\0\0EL",r10
! ASSIGNMENT STATEMENT...
	mov	131,r13		! source line 131
	mov	"\0\0AS",r10
!   hold = 0		(4 bytes)
	mov	0,r1
	load	[r14+8],r2
	store	r1,[r2+8]
! END IF...
_Label_71:
! END IF...
_Label_65:
! ASSIGNMENT STATEMENT...
	mov	134,r13		! source line 134
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=interrupt  sizeInBytes=4
	load	[r14+-28],r1
	store	r1,[r15+0]
!   Call the function
	mov	134,r13		! source line 134
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=interrupt  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-28]
! RETURN STATEMENT...
	mov	134,r13		! source line 134
	mov	"\0\0RE",r10
	add	r15,36,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Mutex_3:
	.word	_sourceFileName
	.word	_Label_72
	.word	4		! total size of parameters
	.word	32		! frame size = 32
	.word	_Label_73
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_74
	.word	-12
	.word	4
	.word	_Label_75
	.word	-16
	.word	4
	.word	_Label_76
	.word	-20
	.word	4
	.word	_Label_77
	.word	-24
	.word	4
	.word	_Label_78
	.word	-28
	.word	4
	.word	_Label_79
	.word	-32
	.word	4
	.word	0
_Label_72:
	.ascii	"Mutex"
	.ascii	"::"
	.ascii	"Unlock\0"
	.align
_Label_73:
	.ascii	"Pself\0"
	.align
_Label_74:
	.byte	'?'
	.ascii	"_temp_70\0"
	.align
_Label_75:
	.byte	'?'
	.ascii	"_temp_69\0"
	.align
_Label_76:
	.byte	'?'
	.ascii	"_temp_66\0"
	.align
_Label_77:
	.byte	'?'
	.ascii	"_temp_64\0"
	.align
_Label_78:
	.byte	'I'
	.ascii	"interrupt\0"
	.align
_Label_79:
	.byte	'P'
	.ascii	"threadptr\0"
	.align
! 
! ===============  METHOD IsHeldByCurrentThread  ===============
! 
_Method_P_Synch_Mutex_4:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Mutex_4,r1
	push	r1
	mov	139,r13		! source line 139
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	140,r13		! source line 140
	mov	"\0\0IF",r10
!   if hold != _P_Thread_currentThread then goto _Label_81		(int)
	load	[r14+8],r1
	load	[r1+8],r1
	set	_P_Thread_currentThread,r2
	load	[r2],r2
	cmp	r1,r2
	bne	_Label_81
!	jmp	_Label_80
_Label_80:
! THEN...
	mov	141,r13		! source line 141
	mov	"\0\0TN",r10
! RETURN STATEMENT...
	mov	141,r13		! source line 141
	mov	"\0\0RE",r10
!   ReturnResult: 1  (sizeInBytes=1)
	mov	1,r1
	storeb	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! END IF...
_Label_81:
! RETURN STATEMENT...
	mov	143,r13		! source line 143
	mov	"\0\0RE",r10
!   ReturnResult: 0  (sizeInBytes=1)
	mov	0,r1
	storeb	r1,[r14+8]
	add	r15,4,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Mutex_4:
	.word	_sourceFileName
	.word	_Label_82
	.word	4		! total size of parameters
	.word	0		! frame size = 0
	.word	_Label_83
	.word	4		! size of self
	.word	8		! offset of self
	.word	0
_Label_82:
	.ascii	"Mutex"
	.ascii	"::"
	.ascii	"IsHeldByCurrentThread\0"
	.align
_Label_83:
	.ascii	"Pself\0"
	.align
! 
! ===============  CLASS Condition  ===============
! 
! Dispatch Table:
! 
_P_Synch_Condition:
	.word	_Label_84
	jmp	_Method_P_Synch_Condition_1	! 4:	Init
	jmp	_Method_P_Synch_Condition_2	! 8:	Wait
	jmp	_Method_P_Synch_Condition_3	! 12:	Signal
	jmp	_Method_P_Synch_Condition_4	! 16:	Broadcast
	.word	0
! 
! Class descriptor:
! 
_Label_84:
	.word	1129070931		! Magic number 0x434c4153 == 'CLAS'
	.word	_Label_85
	.word	_sourceFileName
	.word	29		! line number
	.word	16		! size of instances, in bytes
	.word	_P_Synch_Condition
	.word	_P_System_Object
	.word	0
_Label_85:
	.ascii	"Condition\0"
	.align
! 
! ===============  METHOD Init  ===============
! 
_Method_P_Synch_Condition_1:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Condition_1,r1
	push	r1
	mov	1,r1
_Label_149:
	push	r0
	sub	r1,1,r1
	bne	_Label_149
	mov	182,r13		! source line 182
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! ASSIGNMENT STATEMENT...
	mov	183,r13		! source line 183
	mov	"\0\0AS",r10
!   NEW CLASS Constructor...
!   ZeroMemory: waitingThreads = zeros  (sizeInBytes=12)
	load	[r14+8],r4
	add	r4,4,r4
	store	r0,[r4]
	store	r0,[r4+4]
	store	r0,[r4+8]
!   waitingThreads = _P_List_List
	set	_P_List_List,r1
	load	[r14+8],r2
	store	r1,[r2+4]
! RETURN STATEMENT...
	mov	183,r13		! source line 183
	mov	"\0\0RE",r10
	add	r15,8,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Condition_1:
	.word	_sourceFileName
	.word	_Label_87
	.word	4		! total size of parameters
	.word	4		! frame size = 4
	.word	_Label_88
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_89
	.word	-12
	.word	4
	.word	0
_Label_87:
	.ascii	"Condition"
	.ascii	"::"
	.ascii	"Init\0"
	.align
_Label_88:
	.ascii	"Pself\0"
	.align
_Label_89:
	.byte	'?'
	.ascii	"_temp_86\0"
	.align
! 
! ===============  METHOD Wait  ===============
! 
_Method_P_Synch_Condition_2:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Condition_2,r1
	push	r1
	mov	6,r1
_Label_150:
	push	r0
	sub	r1,1,r1
	bne	_Label_150
	mov	188,r13		! source line 188
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	191,r13		! source line 191
	mov	"\0\0IF",r10
	mov	191,r13		! source line 191
	mov	"\0\0SE",r10
!   if intIsZero (mutex) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message IsHeldByCurrentThread
	load	[r14+12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
!   Retrieve Result: targetName=_temp_92  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-9]
!   if _temp_92 then goto _Label_91 else goto _Label_90
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_90
	jmp	_Label_91
_Label_90:
! THEN...
	mov	192,r13		! source line 192
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_93 = _StringConst_5
	set	_StringConst_5,r1
	store	r1,[r14+-20]
!   Prepare Argument: offset=8  value=_temp_93  sizeInBytes=4
	load	[r14+-20],r1
	store	r1,[r15+0]
!   Call the function
	mov	192,r13		! source line 192
	mov	"\0\0CA",r10
	call	_P_Thread_FatalError
! END IF...
_Label_91:
! ASSIGNMENT STATEMENT...
	mov	194,r13		! source line 194
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Call the function
	mov	194,r13		! source line 194
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-24]
! SEND STATEMENT...
	mov	195,r13		! source line 195
	mov	"\0\0SE",r10
!   if intIsZero (mutex) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Unlock
	load	[r14+12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
! SEND STATEMENT...
	mov	196,r13		! source line 196
	mov	"\0\0SE",r10
!   _temp_94 = &waitingThreads
	load	[r14+8],r1
	add	r1,4,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=12  value=_P_Thread_currentThread  sizeInBytes=4
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	store	r1,[r15+4]
!   Send message AddToEnd
	load	[r14+-16],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! SEND STATEMENT...
	mov	197,r13		! source line 197
	mov	"\0\0SE",r10
!   if intIsZero (_P_Thread_currentThread) then goto _runtimeErrorNullPointer
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Sleep
	set	_P_Thread_currentThread,r1
	load	[r1],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
! SEND STATEMENT...
	mov	198,r13		! source line 198
	mov	"\0\0SE",r10
!   if intIsZero (mutex) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message Lock
	load	[r14+12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! ASSIGNMENT STATEMENT...
	mov	199,r13		! source line 199
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=oldIntStat  sizeInBytes=4
	load	[r14+-24],r1
	store	r1,[r15+0]
!   Call the function
	mov	199,r13		! source line 199
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-24]
! RETURN STATEMENT...
	mov	199,r13		! source line 199
	mov	"\0\0RE",r10
	add	r15,28,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Condition_2:
	.word	_sourceFileName
	.word	_Label_95
	.word	8		! total size of parameters
	.word	24		! frame size = 24
	.word	_Label_96
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_97
	.word	12
	.word	4
	.word	_Label_98
	.word	-16
	.word	4
	.word	_Label_99
	.word	-20
	.word	4
	.word	_Label_100
	.word	-9
	.word	1
	.word	_Label_101
	.word	-24
	.word	4
	.word	0
_Label_95:
	.ascii	"Condition"
	.ascii	"::"
	.ascii	"Wait\0"
	.align
_Label_96:
	.ascii	"Pself\0"
	.align
_Label_97:
	.byte	'P'
	.ascii	"mutex\0"
	.align
_Label_98:
	.byte	'?'
	.ascii	"_temp_94\0"
	.align
_Label_99:
	.byte	'?'
	.ascii	"_temp_93\0"
	.align
_Label_100:
	.byte	'C'
	.ascii	"_temp_92\0"
	.align
_Label_101:
	.byte	'I'
	.ascii	"oldIntStat\0"
	.align
! 
! ===============  METHOD Signal  ===============
! 
_Method_P_Synch_Condition_3:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Condition_3,r1
	push	r1
	mov	9,r1
_Label_151:
	push	r0
	sub	r1,1,r1
	bne	_Label_151
	mov	204,r13		! source line 204
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	208,r13		! source line 208
	mov	"\0\0IF",r10
	mov	208,r13		! source line 208
	mov	"\0\0SE",r10
!   if intIsZero (mutex) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message IsHeldByCurrentThread
	load	[r14+12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
!   Retrieve Result: targetName=_temp_104  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-9]
!   if _temp_104 then goto _Label_103 else goto _Label_102
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_102
	jmp	_Label_103
_Label_102:
! THEN...
	mov	209,r13		! source line 209
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_105 = _StringConst_6
	set	_StringConst_6,r1
	store	r1,[r14+-28]
!   Prepare Argument: offset=8  value=_temp_105  sizeInBytes=4
	load	[r14+-28],r1
	store	r1,[r15+0]
!   Call the function
	mov	209,r13		! source line 209
	mov	"\0\0CA",r10
	call	_P_Thread_FatalError
! END IF...
_Label_103:
! ASSIGNMENT STATEMENT...
	mov	211,r13		! source line 211
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Call the function
	mov	211,r13		! source line 211
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-32]
! ASSIGNMENT STATEMENT...
	mov	212,r13		! source line 212
	mov	"\0\0AS",r10
	mov	212,r13		! source line 212
	mov	"\0\0SE",r10
!   _temp_106 = &waitingThreads
	load	[r14+8],r1
	add	r1,4,r1
	store	r1,[r14+-24]
!   Send message Remove
	load	[r14+-24],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=t  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-36]
! IF STATEMENT...
	mov	213,r13		! source line 213
	mov	"\0\0IF",r10
!   if t == 0 then goto _Label_108		(int)
	load	[r14+-36],r1
	mov	0,r2
	cmp	r1,r2
	be	_Label_108
!	jmp	_Label_107
_Label_107:
! THEN...
	mov	214,r13		! source line 214
	mov	"\0\0TN",r10
! ASSIGNMENT STATEMENT...
	mov	214,r13		! source line 214
	mov	"\0\0AS",r10
!   if intIsZero (t) then goto _runtimeErrorNullPointer
	load	[r14+-36],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_109 = t + 76
	load	[r14+-36],r1
	add	r1,76,r1
	store	r1,[r14+-20]
!   Data Move: *_temp_109 = 2  (sizeInBytes=4)
	mov	2,r1
	load	[r14+-20],r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	215,r13		! source line 215
	mov	"\0\0SE",r10
!   _temp_110 = &_P_Thread_readyList
	set	_P_Thread_readyList,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=12  value=t  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+4]
!   Send message AddToEnd
	load	[r14+-16],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! END IF...
_Label_108:
! ASSIGNMENT STATEMENT...
	mov	217,r13		! source line 217
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=oldIntStat  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	217,r13		! source line 217
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-32]
! RETURN STATEMENT...
	mov	217,r13		! source line 217
	mov	"\0\0RE",r10
	add	r15,40,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Condition_3:
	.word	_sourceFileName
	.word	_Label_111
	.word	8		! total size of parameters
	.word	36		! frame size = 36
	.word	_Label_112
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_113
	.word	12
	.word	4
	.word	_Label_114
	.word	-16
	.word	4
	.word	_Label_115
	.word	-20
	.word	4
	.word	_Label_116
	.word	-24
	.word	4
	.word	_Label_117
	.word	-28
	.word	4
	.word	_Label_118
	.word	-9
	.word	1
	.word	_Label_119
	.word	-32
	.word	4
	.word	_Label_120
	.word	-36
	.word	4
	.word	0
_Label_111:
	.ascii	"Condition"
	.ascii	"::"
	.ascii	"Signal\0"
	.align
_Label_112:
	.ascii	"Pself\0"
	.align
_Label_113:
	.byte	'P'
	.ascii	"mutex\0"
	.align
_Label_114:
	.byte	'?'
	.ascii	"_temp_110\0"
	.align
_Label_115:
	.byte	'?'
	.ascii	"_temp_109\0"
	.align
_Label_116:
	.byte	'?'
	.ascii	"_temp_106\0"
	.align
_Label_117:
	.byte	'?'
	.ascii	"_temp_105\0"
	.align
_Label_118:
	.byte	'C'
	.ascii	"_temp_104\0"
	.align
_Label_119:
	.byte	'I'
	.ascii	"oldIntStat\0"
	.align
_Label_120:
	.byte	'P'
	.ascii	"t\0"
	.align
! 
! ===============  METHOD Broadcast  ===============
! 
_Method_P_Synch_Condition_4:
	push	r14
	mov	r15,r14
	push	r13
	set	_RoutineDescriptor__Method_P_Synch_Condition_4,r1
	push	r1
	mov	9,r1
_Label_152:
	push	r0
	sub	r1,1,r1
	bne	_Label_152
	mov	222,r13		! source line 222
	mov	"\0\0ME",r10
! VARIABLE INITIALIZATION...
! IF STATEMENT...
	mov	226,r13		! source line 226
	mov	"\0\0IF",r10
	mov	226,r13		! source line 226
	mov	"\0\0SE",r10
!   if intIsZero (mutex) then goto _runtimeErrorNullPointer
	load	[r14+12],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   Send message IsHeldByCurrentThread
	load	[r14+12],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,16,r2
	call	r2
!   Retrieve Result: targetName=_temp_123  sizeInBytes=1
	loadb	[r15],r1
	storeb	r1,[r14+-9]
!   if _temp_123 then goto _Label_122 else goto _Label_121
	loadb	[r14+-9],r1
	cmp	r1,0
	be	_Label_121
	jmp	_Label_122
_Label_121:
! THEN...
	mov	227,r13		! source line 227
	mov	"\0\0TN",r10
! CALL STATEMENT...
!   _temp_124 = _StringConst_7
	set	_StringConst_7,r1
	store	r1,[r14+-28]
!   Prepare Argument: offset=8  value=_temp_124  sizeInBytes=4
	load	[r14+-28],r1
	store	r1,[r15+0]
!   Call the function
	mov	227,r13		! source line 227
	mov	"\0\0CA",r10
	call	_P_Thread_FatalError
! END IF...
_Label_122:
! ASSIGNMENT STATEMENT...
	mov	229,r13		! source line 229
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=2  sizeInBytes=4
	mov	2,r1
	store	r1,[r15+0]
!   Call the function
	mov	229,r13		! source line 229
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-32]
! WHILE STATEMENT...
	mov	230,r13		! source line 230
	mov	"\0\0WH",r10
_Label_125:
!	jmp	_Label_126
_Label_126:
	mov	230,r13		! source line 230
	mov	"\0\0WB",r10
! ASSIGNMENT STATEMENT...
	mov	231,r13		! source line 231
	mov	"\0\0AS",r10
	mov	231,r13		! source line 231
	mov	"\0\0SE",r10
!   _temp_128 = &waitingThreads
	load	[r14+8],r1
	add	r1,4,r1
	store	r1,[r14+-24]
!   Send message Remove
	load	[r14+-24],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,12,r2
	call	r2
!   Retrieve Result: targetName=t  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-36]
! IF STATEMENT...
	mov	232,r13		! source line 232
	mov	"\0\0IF",r10
!   if intIsZero (t) then goto _Label_129
	load	[r14+-36],r1
	cmp	r1,r0
	be	_Label_129
	jmp	_Label_130
_Label_129:
! THEN...
	mov	233,r13		! source line 233
	mov	"\0\0TN",r10
! BREAK STATEMENT...
	mov	233,r13		! source line 233
	mov	"\0\0BR",r10
	jmp	_Label_127
! END IF...
_Label_130:
! ASSIGNMENT STATEMENT...
	mov	235,r13		! source line 235
	mov	"\0\0AS",r10
!   if intIsZero (t) then goto _runtimeErrorNullPointer
	load	[r14+-36],r1
	cmp	r1,r0
	be	_runtimeErrorNullPointer
!   _temp_131 = t + 76
	load	[r14+-36],r1
	add	r1,76,r1
	store	r1,[r14+-20]
!   Data Move: *_temp_131 = 2  (sizeInBytes=4)
	mov	2,r1
	load	[r14+-20],r2
	store	r1,[r2]
! SEND STATEMENT...
	mov	236,r13		! source line 236
	mov	"\0\0SE",r10
!   _temp_132 = &_P_Thread_readyList
	set	_P_Thread_readyList,r1
	store	r1,[r14+-16]
!   Prepare Argument: offset=12  value=t  sizeInBytes=4
	load	[r14+-36],r1
	store	r1,[r15+4]
!   Send message AddToEnd
	load	[r14+-16],r1
	load	[r1],r2
	cmp	r2,0
	be	 _runtimeErrorUninitializedObject
	store	r1,[r15]
	add	r2,8,r2
	call	r2
! END WHILE...
	jmp	_Label_125
_Label_127:
! ASSIGNMENT STATEMENT...
	mov	238,r13		! source line 238
	mov	"\0\0AS",r10
!   Prepare Argument: offset=8  value=oldIntStat  sizeInBytes=4
	load	[r14+-32],r1
	store	r1,[r15+0]
!   Call the function
	mov	238,r13		! source line 238
	mov	"\0\0CA",r10
	call	_P_Thread_SetInterruptsTo
!   Retrieve Result: targetName=oldIntStat  sizeInBytes=4
	load	[r15],r1
	store	r1,[r14+-32]
! RETURN STATEMENT...
	mov	238,r13		! source line 238
	mov	"\0\0RE",r10
	add	r15,40,r15
	pop	r13
	pop	r14
	ret
! 
! Routine Descriptor
! 
_RoutineDescriptor__Method_P_Synch_Condition_4:
	.word	_sourceFileName
	.word	_Label_133
	.word	8		! total size of parameters
	.word	36		! frame size = 36
	.word	_Label_134
	.word	4		! size of self
	.word	8		! offset of self
	.word	_Label_135
	.word	12
	.word	4
	.word	_Label_136
	.word	-16
	.word	4
	.word	_Label_137
	.word	-20
	.word	4
	.word	_Label_138
	.word	-24
	.word	4
	.word	_Label_139
	.word	-28
	.word	4
	.word	_Label_140
	.word	-9
	.word	1
	.word	_Label_141
	.word	-32
	.word	4
	.word	_Label_142
	.word	-36
	.word	4
	.word	0
_Label_133:
	.ascii	"Condition"
	.ascii	"::"
	.ascii	"Broadcast\0"
	.align
_Label_134:
	.ascii	"Pself\0"
	.align
_Label_135:
	.byte	'P'
	.ascii	"mutex\0"
	.align
_Label_136:
	.byte	'?'
	.ascii	"_temp_132\0"
	.align
_Label_137:
	.byte	'?'
	.ascii	"_temp_131\0"
	.align
_Label_138:
	.byte	'?'
	.ascii	"_temp_128\0"
	.align
_Label_139:
	.byte	'?'
	.ascii	"_temp_124\0"
	.align
_Label_140:
	.byte	'C'
	.ascii	"_temp_123\0"
	.align
_Label_141:
	.byte	'I'
	.ascii	"oldIntStat\0"
	.align
_Label_142:
	.byte	'P'
	.ascii	"t\0"
	.align
