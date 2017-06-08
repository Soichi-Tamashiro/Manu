;Template=3AXMILL=Generic ISO Adaptive Mill

;CGXVARIANT^DEFAULT^Default

*** Start of include file CWT Notes Mill ISO.cgi ***
*			*************************
*			*	ISO Template Note	*
*			*************************

*** End of include file A:\Pams\cam\machdef\template\CWT Notes Mill ISO.cgi ***
*** Start of include file CWT Notes Mill General.cgi ***

;*************************************************************************
; Machine independant Code Generator include file
; Technical notes for user customisation of Code Generator and CGE files
;*************************************************************************

* Within Code Generator the use of macro numbers is restricted as follows:
*    1 - 3999 Reserved for cam system Use
* 4000 - 4999 Reserved for Code Wizard Template use
* 5000 - 5999 Reserved for PDI customisation
* 6000 - 9999 Reserved for user defined customisation
*
* Customisation of Code Generator files, both direct and
* through CGEs must be limited to  the 6000-9999 range
*
* UARRAY1 is used within the template logic
*   Array pointers above 1000 are used in subroutine control
*   Array pointers above 2000 are used for datum setting
*   Use in customisation should be restricted to pointers below 999
*
*
;*************************************************************************
; End technical notes
;*************************************************************************

*			*******************************
*			* General template Notes Area *
*			*******************************
* Notes must be defined outside of all procedures using the following syntax
* Text is displayed in the machine NOTES area of the CGD but does not show in CG source


**************************************************************************
*   Machine independant Code Generator include file
*   Filename:	CG Technical notes.cgi.cgi
*	Author:		RHA
*   Date:       16 February 2011
**************************************************************************
*   Change History - At end of file
* Version 2011.2
*          FIRST ISSUE
* 16/02/11 RHA W42941 Document user macro ranges
*
**************************************************************************
*** End of include file A:\Pams\cam\machdef\template\CWT Notes Mill General.cgi ***
*** Start of include file mill-initialise.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	mill-initialise.cgi
*	Author:		RHA
*   Date:       11 November 2005
*
* New file for adaptive milling templates derived from earlier multiplane template                                *
**************************************************************************
*   Change History
* Version 10.5
*          FIRST ISSUE
* 20/02/06 RHA DEV00016344 Implement IJK vector for 5 axis cycle
* 27/02/06 RHA DEV00016236 Spindle control fixes
* 10/03/06 RHA DEV00016621 Add TNC movement code token
* 16/03/06 RHA DEV00016660 Change to IF tokens for TNC Datum Shifting
* Version 10.75
* 11/05/06 RHA DEV00017093 Variables in user tokens USER11 onwards
* 16/05/06 RHA DEV00017213 Correct index handling for no rotation cases
* Version 11.0
* 01/08/06 RHA DEV00017818 Hole cycle clearance and level options IF token
* 01/08/06 RHA DEV00017490 Make spindle start warning optional
* 04/08/06 RHA DEV00017771 Number of turns token for ISO
* Version 11.5
* 20/09/06 RHA DEV00017909 Expand trace options
* 26/10/06 RHA DEV00018471 HPCC improvements
* 24/11/06 RHA DEV00017338 Move CPLNAME to a template variable
* 08/01/07 RHA DEV00018930 Make ZSAFE value available as a token for hole cycles
* Version 11.75
* 30/04/07 RHA DEV00019883 Tokens etc for Euler angles in Index output
* 14/05/07 RHA DEV00019985 Tokens for XINC etc., improve XABSORIGIN Description
* 21/05/07 RHA DEV00020096 Implement Maintain Index Option at ToolChange
* 24/05/07 RHA DEV00019981 Orthogonal plane cycle controls
* Version 12.00
* 10/08/07 RHA DEV00020285 Add new ISO Datum Shift Tokens
* 25/09/07 RHA DEV00021119 Add setvars and tokens for pivot mode control
* 27/09/07 RHA DEV00021119 Give pivot code its own format entry
* Version 12.25
* 18/10/07 RHA DEV00021382 Correct use of #TMP - #COMPTEMP
* 04/12/07 RHA DEV00021534 Enable longhand tapping
* Version 12.50
* 17/01/08 RHA DEV00022021 Incremental option for Z Clear
* 18/01/08 RHA DEV00021841, DEV00021908 New optional warnings
* 22/01/08 RHA DEV00022142 Clearance options applied to all clearance tokens
* 19/03/08 RHA DEV00022891 Allow concecutive coincident indexes to CPL
* Version 2009.1
* 14/04/08 RHA DEV00018979 Correct BNUM reset
* 07/07/08 RHA DEV00023548 Implement NC Code Suppression
* 06/08/08 RHA DEV00024310 Back bore and face in milling
* 06/08/08 RHA DEV00023786 Add tool group and ID tokens
* 11/08/08 RHA DEV00024364 Implement helical hole cycles
* 21/08/08 RHA DEV00024504 Probing tokens for ISO machines
* 28/08/08 RHA DEV00023797 Add tool token and remove chamfer angle restriction
* 10/09/08 RHA DEV00024504 Probe token corrections
* 24/09/08 RHA DEV00024855 Correct spindle direction in back bore longhand
* 07/10/08 RHA DEV00025129 Longhand back bore cutting in M5 spindle stop mode
* Version 2009.2
* 24/10/08 RHA DEV00025000 Allow Rapid after tool change with null move
* 05/11/08 RHA DEV00024851 Cycle DEf 204 for TNC
* 05/11/08 RHA DEV00023525 Fix CYCL DEF numbers and descriptions as tokens
* 07/11/08 RHA DEV00025098 Make tool angle available in setup & core tool change
* 12/11/08 RHA DEV00024851 CYCLE DEF 204 fixes
* 14/11/08 RHA DEV00024851 Counter bore depth token corrections
* 21/11/08 RHA DEV00025098 Use new system variable for Included tool angle
* 07/01/09 RHA DEV00025831 Add token for holdertype
* 09/01/09 RHA DEV00024568 Make Tool Unit available in toolchange. Set variable on token
* 06/03/09 RHA DEV00026198 Use Job data instead of ASK questions
* Version 2010.1
* 05/06/09 RHA WI32294 Create Siemens adaptive mill template
* 05/06/09 RHA WI32294 Siemens datum set tokens
* 16/06/09 RHA WI32294 Siemens Subroutine End tokens and Cycle return feed factor
* 18/06/09 RHA WI31681 Siemens Thread Mill tokens
* 19/06/09 RHA WI31681 Siemens Angle tokens for toolchange and index
* 22/06/09 RHA WI31681 Tokens and variables for Siemens Hermle variant
* 25/06/09 RHA WI34681 Correction to Home and ToolChange tokens
* 07/07/09 RHA WI32294 Initial feedback from GST
* 09/07/09 RHA WI34873 New Thread Mill - Add new code options
* 15/07/09 RHA WI34873 Fix Thread Mill Cycle Level
* 27/07/09 RHA WI31681 Tokens and logic for thread ID & OD settings
* 05/08/09 RHA WI35305 Add Probing mode control tokens etc
* 06/08/09 RHA WI35307 Add code con and option for manual toolchange
* 19/08/09 RHA W35537 Add Lead and Starts tokens for thread mill
* 20/08/09 RHA W35450 Add tokens for coordinate rotation to sub call
* 09/09/09 RHA W35307 Manual toolchange and tokens for angled head
* 15/09/09 RHA W35307 Set values for tool angle (angled head) tokens etc
* 17/09/09 RHA W35307 System variables renamed HEADANGLE MOUNTANGLE
* 23/09/09 RHA W35563 Thread mill bottom to top formatting & suppress points call
* Version 2010.2
* 13/11/09 RHA W36665 Correct action of planar rotate on rotary angles
* 11/12/09 RHA W36903 Add "Ask Once" to the NC Stlyes > Interactive Startup options
* 04/01/10 RHA W37181 Templates Mill TNC - add token for Q355 (threads per step)
* 04/01/10 RHA W32567 Implement G28 Moves to Home etc. ISO Template
* 15/01/10 RHA W37297 Add Single Shot option for Exact Stop
* 25/01/10 RHA W37441 Hole locations for angled head - direction token
* 26/01/10 RHA W37441 Make new hole depth variable modal
* 13/04/10 RHA W38640 Hole parameters adjusted for TLO and Angled Head
* Version 2011.1
* 02/07/10 RHA W38284 Add Reset_Spindle token to toolchange
* 13/07/10 RHA W39785 Implement tap type setting at toolchange
* 24/08/10 RHA W39967 THISZMOVE Token for Siemens Rapid after TC
* Version 2011.2
* 25/10/10 RHA W32074 Restructure Datum Shift and Index handling, #XTSUB etc.
* 28/10/10 RHA W32074 Fix #XSHIFT etc. remove redundant variables
* 28/10/10 RHA W37422 Siemens datum shift tokens
* 29/10/10 RHA W38135 Alternative incremental datum base for TNC
* 15/12/10 RHA W38043 Feed mode code for TNC
* 16/12/10 RHA W41997 Implement peck tapping
* 11/01/11 RHA W42393 New Option - Control for negative radius when angle>180
* 28/01/11 RHA W42399 Add tapping type code for Siemens
* 24/02/11 RHA W42352 Separate clamping for secondary rotary axis
* 28/02/11 RHA W43151 Tapping reverse with combined coolant codes
* 29/03/11 RHA W31156 Correct undefined variable fault on 3 axis
* Version 2012.1
* 06/06/11 RHA W43692 Fix direction setting, backbore with spindle blocks
* 06/07/11 RHA W44708 Add Thread Mill tokens
* 21/06/11 RHA W42241 Selective threadmill canned cycles
* 18/08/11 RHA W45704 TNC Allow use of Modify Cycle for  tapping and thread mill
* 21/12/11 RHA W47111 Force GCode after Dwell
* Version 2012.2
* 17/01/12 RHA W45710 Force Index token on first toolchange
* 31/01/12 RHA W47500 Implement auxiliary Z axes
* 14/03/12 RHA W49403 Implement Quill Retract function
* 14/03/12 RHA W49476 Call QUILL_BLOCK only when needed
* 15/03/12 RHA W49072 add QUILLZDEPTH token for drilling code constructors
* 20/03/12 RHA W49476 Call AUXZ_BLOCK only when needed
* 20/03/12 RHA W49072 More Quill tokens for drilling code constructors
* 27/03/12 RHA W49627 Quills - add clamp / unclamp codes
* Version 2013.1
* 31/05/12 RHA W48878 Phantom warnings from Subroutines, #MASKKEEP
* 30/08/12 RHA W43286 Support peck tapping via cycle point calls
* Version 2013.2
* 14/03/13 GST W39645 Add options to handle retract for bottom-up canned thread
* 15/03/13 GST W52689 Fix THISZMOVE output for canned holes
* 20/03/13 GST W31039 Implement new coolant system - fase 1
* 20/03/13 GST W55128 Implement Rotary Axial interpolation
* 20/03/12 GST W54195 Create tokens for NEXT tool parameters
* 20/03/13 GST W55128 Implement Rotary Axial interpolation - second batch
* 21/03/13 GST W54191 Force feed for tapping - floating and rigid choice
* 27/03/13 GST W55128 Implement Rotary Axial interpolation - fourth batch
* 10/04/13 GST W56644 Fix spindle stopped warnings
* 23/04/13 GST W57296 Move to Toolchange Home in rotary axial
* 21/05/13 GST W56952 Add Dwell Time to allow spindle to change speed
* Version 2014.1
* 18/07/13 GST W58113 Force rotary update after IJK_5-axis
* 22/07/13 GST W55730 Implement rotary precision
* 23/07/13 GST W58567 Fix rotary direction calculation for rationalised angles
* 23/07/13 GST W43623 BackBore/Face cycle points option
* 07/08/13 GST W49799 Allow output of datum override in Set Work Datums
* 07/08/13 GST W52636 Fix Z output after ZINITIAL
* 16/08/13 GST W59433 Add support for 3D compensation
* 03/09/13 GST W59852 Add support for Dynamic Offset
* 19/09/13 GST W60303 Create Move Code for 3D_CRC on TNC
* 14/10/13 GST W60594 Allow CRC off on rapid retracts
* Version 2014.2
* 11/02/14 GST W63124 Improve array output for debug trace
* 24/02/14 GST W62726 Implement Turning on milling
* 06/03/14 GST W62726 Various corrections and new tokens
* 11/03/14 GST W63762 Add macro breakout
* 11/03/14 GST W62726 Create Cancel-CSS token
* Version 2015.1
* 07/07/14 GST W61121 Implement Maximum Linear Separation
* 18/07/14 GST W64177 Use system angular direction when available
* 30/07/14 GST W32318 Implement -+360 angular range
* 04/08/14 GST W65629 Fix direction assignment
* 05/08/14 GST W64177 New codes for angular direction
* 08/08/14 GST W62726 Index token for Turn RAT
* 20/08/14 GST W65032 Fix RAT to respect clearance - exclude null move
* 03/09/14 GST W67146 Assign correct modes at MtTc
* Version 2015.2
* 07/01/15 GST W80110 Implement M&H Probing
* 09/01/15 GST W79526 Add TNC support for ToM
* 21/01/15 GST W80110 Separate M&H & Renishaw at tokens/formats levels
* 05/02/15 GST W80347 Implement support for Simultaneous indexing
* 10/02/15 GST W81600 Implement Program Stop on Move to Home/TC
* 10/02/15 GST W32377 Printing function for Renishaw
* Version 2016.1
* 18/06/15 GST ECAM-1158 Fix lift move on rotary axial holes
* 23/06/15 GST ECAM-1548 Implement Probing NC-Gage
* 06/07/15 GST ECAM-113 Implement MTM Siemens
* 28/07/15 GST ECAM-2343 Implement Angle at Toolchange
*
*******************************************************

%DECLARE=#RADIALTURN,#AXIALTURN,#ODDTURN,$TURNSTR
%DECLARE=#TURNPLANE,#TURNXY,#MACHGCODE,#DATAMODE,#DATAMODEM,#CSSGCODE,#ORTHTURN,#PASSCNT
%DECLARE=#PTCYPECKTAP,#TAPLOOP,#TAPDEPTH,#TAPCOUNT,#TAPCOUNT2,#ZMOVEA,#CYCLEPOINTSHOLD
%DECLARE=#MASKKEEP,#MASKHOLD
%DECLARE=#AUXZCLEAR,#AUXZPECK,#AUXZRPLANE,#AUXZCLAMP,#AUXZCLAMPON,#AUXZCLAMPOFF
%DECLARE=#AUXZREVERSE,#AUXZACTIVE,#AUXZMOVE,#AUXZINCR,#AUXZKEEP,#ABSAUXZ,#AUXZRETRACT,#AUXZDEPTH
%DECLARE=#AUXZON,#AUXZOFF,#AUXZCODE
%DECLARE=#FULLARCNOW
%DECLARE=#LOOKAHEAD,#FEEDWARN
%DECLARE=#TIMESFPR,#TIMESFPM
%DECLARE=#THRDTEMP
%DECLARE=#LHPECKTAP
%DECLARE=#ROTROTFLAG,#CALLHELD,#MULTICALL,#THISDEPTH
%DECLARE=#USECYCLEMODTAP,#USECYCLEMODTHRD
%DECLARE=#CYCLNUM1,#CYCLNUM2,#CYCLNUM3,#CYCLNUM4,#CYCLNUM5,#CYCLNUM6
%DECLARE=#CYCLNUM7,#CYCLNUM8,#CYCLNUM9,#CYCLNUM10,#CYCLNUM11,#CYCLNUM12
%DECLARE=$CYCLDESC1,$CYCLDESC2,$CYCLDESC3,$CYCLDESC4,$CYCLDESC5,$CYCLDESC6,$CYCLDESC7
%DECLARE=$CYCLDESC8,$CYCLDESC9,$CYCLDESC10,$CYCLDESC11,$CYCLDESC12,$CYCLDESC13
%DECLARE=#MAXSUBNUMBER
%DECLARE=#SPEEDHOLD2,#TOOLCHANGE2
%DECLARE=$TNCMOVE
%DECLARE=#FTYPEMILL,#FTYPEDRILL,#FTYPETAP,#FTYPEBORE,#CONVERTEDMOVE,#FTYPETHRD,#FTYPETAPRIG
%DECLARE=#USEMAXFEED
%DECLARE=#TEMPDIR
%DECLARE=#LINEARMOVE
%DECLARE=#PREVIOUSHEIGHT
%DECLARE=#HECHAMFER
%DECLARE=#TEMPROUND,#TEMPSIGN
%DECLARE=#SPINWARNSAVE
%DECLARE=#ZAPP
%DECLARE=#COORDROT
%DECLARE=#TOOLFEEDTYPE
%DECLARE=#ZPLUNGE
%DECLARE=#3DAFTERTC
%DECLARE=#ZRABSINCR2
%DECLARE=#INCSAVE,#IXSAVE,#IYSAVE,#IZSAVE,#HELIXZHOLD
%DECLARE=#CENTRETOL,#BADRAD,#DIST,#RADERROR,#ABSRADIUS,#CENTREFIX
%DECLARE=#RADIUS2
%DECLARE=#COMPSTATE
%DECLARE=#XAPP,#YAPP
%DECLARE=#FORCEAFTERDWELL,#INDEXOK
%DECLARE=#TEMPCOUNT
%DECLARE=#ALLOWSTANG,#ALLOWTAPER,#ALLOWMSTART
%DECLARE=#ROT1DIRHOLD,#ROT2DIRHOLD
%DECLARE=#TMPROT,#TMPROTHOLD,#TMPROTDIR,#SKIPDIR
%DECLARE=#TEMPROT1HOLD,#TEMPROT2HOLD
%DECLARE=#TMPRH1,#TMPRH2,#TMPFIRST,#TMPSECOND
%DECLARE=#TAPONE,#TAPCHIP,#TAPBREAK
%DECLARE=#NEGRAD180
%DECLARE=#XTSUB,#YTSUB,#ZTSUB,#BASETYPE
%DECLARE=#TAPWARN,#TAPTYPE
%DECLARE=#HOLEOFFSET
%DECLARE=#ZDEPTHOUT
%DECLARE=#EXACTMODE
%DECLARE=#XZERO,#YZERO,#ZZERO,#CODETC,#CODEHOME,#ABSINCSTORE
%DECLARE=#THRDSTEP
%DECLARE=#GOTPV,#GOTPR,#GOTDE,#GOTID
%DECLARE=#TMILLUPWARD,#TKEEPLEVEL,#TKEEPDEPTH,#KEEPPOINTS,#MILLPOINTS
%DECLARE=#ANGHEAD,#TOOLR1,#TOOLR2,#MOUNTANG,#HEADANG,#CURRENTMANUAL
%DECLARE=#ANGLE2
%DECLARE=#THRDPITCH
%DECLARE=#MANUAL
%DECLARE=#TAPPITCHMODE
%DECLARE=#FIRSTDEPTH,#FIRSTDWELL
%DECLARE=#AX5INVTIME,#AX5FEED,#FEEDMODEHOLD
%DECLARE=#THRDLEVEL,#THREADMIN
%DECLARE=$SHIFTSTR,$INDEXSTR,$DATUMTYPE,$DYNAMICSTR
%DECLARE=#RFACTOR
%DECLARE=#QUESTION
%DECLARE=$CYCDEF,#BOTTOMBORE
%DECLARE=#SPINANG,#DIRNXPOS,#DIRNXNEG,#DIRNYPOS,#DIRNYNEG,#RELIEFDIR,#PREFEED
%DECLARE=#FORCEAFTERTC
%DECLARE=#BBCYCLE,#BFCYCLE,#HECYCLE,#TOOLDIAM,#EDGEHEIGHT,#THICK
%DECLARE=#BBGCODE,#BFGCODE,#HEGCODE
%DECLARE=#NCSUPPRESS
%DECLARE=#CHECKCPLS
%DECLARE=#TAPERWARN,#SUBWARN,#TMPCLEAR
%DECLARE=#CLEARTYPE
%DECLARE=#SKIPTAP
%DECLARE=#COMPTEMP
%DECLARE=#PIVOTCODE,#PIVOTTIP,#PIVOTAXIS
%DECLARE=#XSHIFT,#YSHIFT,#ZSHIFT,#XBASE,#YBASE,#ZBASE
%DECLARE=#TOOLCALLWAIT,#ORTHCYCLES,#ORTHMILLCYCLES
; DECLARE=#CPLHOLD
%DECLARE=#WPLANECODE,#WPLANEON,#WPLANEOFF
%DECLARE=$CPLNAME,#PECKSAFE
%DECLARE=#TRPLANE,#TRDEPTH,#TRTHREAD,#TRHOLE,#TRENDS,#TRMACHINE,#TRMODE,#TRSTARTS,#TRX,#TRY,#TRZ,#TRA,#TRB,#TRC
%DECLARE=#TRRADIUS,#TRANGLE
%DECLARE=#THREADDEPTH
%DECLARE=#RTYPE,#SPINWARN,#LISTCODE
%DECLARE=#WORKGCODEHOLD,#XSUBHOLD,#YSUBHOLD,#ZSUBHOLD
%DECLARE=#ROT1INC,#ROT2INC
%DECLARE=#BEFORECYCLE
%DECLARE=#USERADSKEEP
%DECLARE=#OUTPUTMOVE  ; Thread mill linear move flag
%DECLARE=#RESET360    ; Reset 0 angles to 360
%DECLARE=#THROHOLD    ; Hold through tool coolant setting
%DECLARE=#COMINED     ; Allow Combined Coolant Spindle
%DECLARE=#MOVE5,#IKEEP,#JKEEP,#KKEEP ; Five axis vectors

%DECLARE=$TNCLINEAR,$LINEAR5,$LINEAR3,$LINEAR3D
; #AX5FORCE for S840
%DECLARE=#AX5MODE,#FIVEAXISKEEP,#AX5USEIJK,#AX5IJK,#AX5ON,#AX5OFF,#AX5FORCE,#FIVEAXISKEEP2
%DECLARE=#TMPROT2,#THISROT,#NEGCODE
%DECLARE=#FIRSTANGLE,#SECONDANGLE,#AXISTYPE1,#AXISTYPE2
%DECLARE=#HORIZ,$HEADPLANE,#CUBIC
%DECLARE=#AUTOCOOL
%DECLARE=#POINTER,#INDEXTLO,#RIGIDTAP,#RIGIDTAPLEFT,#THREADCANNED
%DECLARE=#XKEEP,#YKEEP,#ZKEEP
%DECLARE=#RKEEP
%DECLARE=#DATUMSTART,#DATUMINCR,#DATUMMAX,#DYNAMIC
%DECLARE=$ABSDATUM,$DYNAMIC
%DECLARE=#THROUGHTOOL1,#THROUGHTOOL1OFF,#THROUGHTOOL1ON,#THROUGHTOOL1HIGH
%DECLARE=#MACHINEMAXRPM,#MACHINEMINRPM
%DECLARE=#REVANGDIR,#MACHTYPE,#ROTTYPEHOLD2,#INCRXYZHOLD2
%DECLARE=#COUNT
%DECLARE=$MOVETYPE,#COMPCYCLE
%DECLARE=#SPEEDHOLD,#SPEED99
%DECLARE=#HOLECYCLE2,#HOLECYCLE3
%DECLARE=#NOPITCH,#TURNS
%DECLARE=#THRDCOMPCODE,#HELIXCOUNT
%DECLARE=#CYCOUT
%DECLARE=#XTOOLREF,#YTOOLREF,#ZTOOLREF
%DECLARE=#ZLINEAR
%DECLARE=#OUTPUTCYCLE,#OUTPUTPOINT
%DECLARE=#XSTART,#YSTART,#ZSTART
%DECLARE=#MAXMOVE,#XMOVEW,#YMOVEW,#ZMOVEW,#PARAMETER,#XP1,#YP1,#ZP1,#NMOVES,#COUNTB,#MLENGTH,#XHOLDW,#YHOLDW,#ZHOLDW,#4002ACTIVE
*
***************************************************************************
%DECLARE=#XROUNDCENTRE,#YROUNDCENTRE,#LEN,#ANG1,#XDIST2,#YDIST2
%DECLARE=#XCENTREERROR,#YCENTREERROR,#TEMPXCENTRE,#TEMPYCENTRE
%DECLARE=#XTEMP1,#XTEMP2,#YTEMP1,#YTEMP2,#XDIST,#YDIST,#CHORD
***************************************************************************

*   SPLINE OUTPUT
%DECLARE=#KNOT,#WEIGHT,#ORDER
%DECLARE=#K1VALUE,#K2VALUE,#K3VALUE,#K1EXP,#K2EXP,#K3EXP,$AXIS,$CONTINUE
*
* For Polynomial Interpolation  End points EX,EY,EZ  Coeffs AX,BX etc
%DECLARE=$XBRAK,$YBRAK,$ZBRAK
%DECLARE=#EX,#BX,#AX,#EY,#BY,#AY,#EZ,#BZ,#AZ
***************************************************************************
*
* 3D Compensation output
%DECLARE=$3DCOMP,$3DCOMPON,$3DCOMPOFF
%DECLARE=#3DCCR,#3DTR,#3DCRCKEEP,#3DCRCGCODE
*
%DECLARE=#MCODEMC,#MCODECPL
%DECLARE=#MAXTMP
%DECLARE=#MVRETRACT
%DECLARE=#SHIFTWARN
%DECLARE=#RWORD360
%DECLARE=#TCLAMPON,#TCLAMPOFF,#TCLAMP
%DECLARE=#T2CLAMPON,#T2CLAMPOFF,#T2CLAMP,#USET2CLAMP,#THISCLAMP
%DECLARE=#SPEEDUP,#FULLARCXYZ
%DECLARE=#XTEMPREF,#YTEMPREF,#ZTEMPREF,#REFSHIFT
%DECLARE=#WARNCOUNT
%DECLARE=#TEMPREVERSE,#COMPMODE
%DECLARE=#FORCEFEED,#AUTOTLO
%DECLARE=#CURRENTCPL
%DECLARE=#SETUPHEAD
%DECLARE=#TOOLRAPWARN,#TOOLZWARN
%DECLARE=#ZLEVELHOLD,#ZCLEARINC
%DECLARE=$CONDEBUG,#PROCTRACE,#PROCTRACE2,$SPC,$PROCEDURE
%DECLARE=#LEADER,#PROGID,#USEDTOKEN
%DECLARE=#INCHINCR,#MMINCR,$MODEL,#ANGINCR,#ANGPRECISION
%DECLARE=#TMP1,#TMP2,#TMP3,#TMP4,$MACHINE,$TOOLDESCRIPTION,$PROGVER,$MANREADABLE,
%DECLARE=#EXECMACRO,#MACRO
*   NC Output control for PCIs (ECS2700)
%DECLARE=#NCPROCESS
*	Block Numbering
%DECLARE=#BNUM,#BNUMSTART,#BNUMINC,#USEBNUM,#BNUMVAR,#SBNUM,#ONLYSBNUM,#RESTARTSUBSBNUM,#BNUMHOLD
%DECLARE=#SBNUMPOSITION
*	G (preparatory) codes
%DECLARE=#PLANEGCODE,#GCODE,#UNITSGCODE,#FEEDMODEGCODE
*		Circular Interpolation
%DECLARE=#JVALUE,#KVALUE,#BEARING1,#BEARING2,#OUTPUTRADS,#INCR,#IVALUE,#RADIUS,#CONARC
%DECLARE=#ADJARCFEED,#XCENTRE,#YCENTRE,#ZCENTRE,#STARTRAD,#ENDRAD,#ARCTYPE,#USERADS
%DECLARE=#BEARING,#G18SWAP,#G19SWAP
*	Spindle / Gears
%DECLARE=#NUMGEARS,#STEPS,#AUTOGEAR,#GEAR,#GEARMCODE,#SPEED,#DIRECTION
%DECLARE=#SPEEDPTR,#STEPSPTR,#RPMMATCH,#MINRPM,#MAXRPM,#MAXRPMPTR,#USRMAXPTR,#USRMAXRPM,#SCODE,#SCODEINCR
%DECLARE=#MINSCODE,#MAXSCODE,#RPMINC,#TESTRPM,#SPINCOUNTER,#RPMDIFF,#HOLDRANGE,#HOLDSPINCOUNTER
*	General Coordinate Systems
%DECLARE=#XMOVE,#YMOVE,#ZMOVE,#XHOLD,#YHOLD,#ZHOLD
%DECLARE=#INCRXYZ,#INCRXYZHOLD,#INCRSUBS,#XREVERSE,#YREVERSE,#ZREVERSE
%DECLARE=#INCROTARY
%DECLARE=#XSTOREABS,#YSTOREABS,#ZSTOREABS,#AXISREVERSE
*	Rapid Traverse
%DECLARE=#FEEDRAPIDS,#RAPDIST,#RAPIDFEEDRATE
*	Hole Cycles
%DECLARE=#EMULATION
%DECLARE=#G81CYCLE,#BACKPOINTS
%DECLARE=#CYCLEGCODE,#ZRABSINCR,$CYCLETYPE,#BOREOFFSET,#RETRACTGCODE,#ZDEPTH,#RPLANE,#ZLEVEL,#DEGR
%DECLARE=#DEPTH,#HANDOFTHREAD,#BOREOFFSETMM,#BOREOFFSETINCH,#SUPPORTG98G99
%DECLARE=#PECKREVERSE,#MULTILEVEL,#THREADMOVE,#BOREOFFSETHOLD,#DWELLGCODE
%DECLARE=#FEEDMODEGCODEHOLD,#HCODEHOLD,#DIRECTIONHOLD,#DIRHOLD,#DIRHOLD2,#DIRHOLD3,#HOLECYCLE,#PITCH,#MODALCYCLE
%DECLARE=#SUPPORTMDEPTH,#ZDEPTHHOLD,#CYCLEGCODESAVE,#DEPTHCHANGE
%DECLARE=#NPECKS
%DECLARE=#EXPANDG81,#EXPANDG82,#EXPANDG83,#EXPANDG84,#EXPANDG85,#EXPANDG86,#EXPANDG87
%DECLARE=#PREPOSITION,#CYCLEPOINTS
*	Toolchange / Tooling
%DECLARE=#TLOCOMP,#ADJZMOVE,#NEXTTOOL,#FIRSTTOOL,#TOOLCHANGE,#TOOLDIA,#HCODE
%DECLARE=#ZGAUGE,#MAXTOOLS1,#SETTOOLGCODE,#REMOVEDUPLICATES,#FIRSTRAPIDZ
%DECLARE=#ZTOOLSUB,#TOOLCOUNT,#RAPIDTOOL,#THISZMOVE
%DECLARE=$NEXTGROUP,$NEXTGROUPSTRING,$NEXTID,$NEXTIDSTRING,$NEXTCOMMENT,$NEXTDESCRIPTION
%DECLARE=#NEXTGROUPNUMBER,#NEXTIDNUMBER
*	Subroutines
%DECLARE=#SUBSTARTMCODE,#SUBENDMCODE,#SUBNOSTART,#SUBROUTINE,#SUBROUTINE2
%DECLARE=#INCRSUBNUMBER
*	Cutter Radius Compensation
%DECLARE=#COMPGCODE,#COMPDCODE,#COMPON,#COMPGCODEHOLD,#COMPDCODEHOLD,#CANCELCOMP,#WARNCRC,#WARNCRC90,#CRCONZ1,#CRCONZ2,#AUTOREG
%DECLARE=#REGOFFSET,#ABSINC
%DECLARE=#WARNCRCARC,#RAPIDCOMP
*
%DECLARE=$TYPE,$UNIT,$ID,$DESCR,$NAME,$OUTPUTSUBS
%DECLARE=#ABS,#TMP,#MINFEEDADJ,#MAXFEEDADJ,$WARNING
%DECLARE=#CURPLANE,#DELETE,#FEED,#FIRSTIME,#FUNNY,#COOL
%DECLARE=#TOOLSHEET,#HEADER,#LOOP,#MCODE,#STOPMCODE
%DECLARE=#MIRROR,#MOVE,#NEGINCR,#BADNULL
%DECLARE=#SIGN
%DECLARE=#TEMP,$TEMP,$TEMP1,$TEMP2,$TEMP3
*	Datum Shifting
%DECLARE=#PRESETGCODE,#WORKGCODE,#COORDNUM,#WORKGCODE2
%DECLARE=#XINC,#YINC,#ZINC
*
%DECLARE=#XTEMP,#YTEMP
%DECLARE=#EXACTSTOP
%DECLARE=#INCANGLE,#ABSXINC,#ABSYINC,#ABSZINC,#TRUE,#FALSE,#LEFT,#RIGHT,#PI,#SKIP
%DECLARE=#COOLHOLD,#XSUB,#YSUB,#ZSUB
* #RECORD
*	Multi-plane / Rotary
%DECLARE=#TCANGLE,#TCROT1,#TCROT2,#TCPROCESS
%DECLARE=#ROTARYGCODE,#ROT1DIR,#ROT2DIR
%DECLARE=#ROT1,#ROT2,#ROT1HOLD,#ROT2HOLD,#ROT1REVERSE,#ROT2REVERSE,#ROTTYPE,#REV2ANGDIR,#ROT1RAW,#ROT2RAW
%DECLARE=#ROT,#ROTINCR
%DECLARE=#WRAPTYPE,#WRAPHEIGHT
%DECLARE=#G54FROMHOME,#UNIQUEDATUMS,#SYSID
%DECLARE=#ROTDIRMCODE,#ROT1OFFSET,#ROT2OFFSET,#ROTARYAXES,#WRAPHOLD,#ANGDIR,#SINDEX
%DECLARE=$PLANAR,$ORIENTATION,$LINEARAXIS,$ACTIVEROTAXIS
%DECLARE=$ROT1,$ROT2,#SKIPROT
%DECLARE=$COMPOUTPUT,#ROTARYTYPE,#XEND,#YEND
%DECLARE=#LEADOUTCOUNT,#COMPFACTOR,#PRECISION,#EXACTGCODE
%DECLARE=#ROTVALS,#ROT1RANGE,#ROT2RANGE,#LIMIT360,#LIMIT180,#LIMIT360W
%DECLARE=#FORCEXYZ,#CAXINTERP,#ROTARYCARTESIAN,#ROTARYCARTESIANHOLE
%DECLARE=$CAXENGAGED
%DECLARE=#CALLPOLAR,#POLARGCODE,#POLARON,#POLAROFF
%DECLARE=#FIRSTDIR,#SECONDDIR,#ROT1CLW,#ROT1CCLW,#ROT2CLW,#ROT2CCLW

*	M-FUNCTIONS
%DECLARE=$MCODE
%DECLARE=#HIGHSPEEDTOL

*Thread Mill
%DECLARE=#THRDLEAD,#KVALSAVE,#BLOCKSMISSED,#THREADSINGLE,#NEXTTYPE
%DECLARE=#NEXTLOOP,#NEXTRADIUS,#OUTPUTHELIX,#ARCRADIUS,#TYPE,#THISRAD

* Variables for Thread Mill canned cycle
%DECLARE=#THRDEPMODE,#THRDEPMODE2,#THRDPITCHMODE,#THREADMILL,#THRDMILL,#THRDEPTH
%DECLARE=#THRDCLIMB,#THRDUPCUT,#THRDCLW,#THRDCCLW,$THRDLEFT,$THRDRIGHT,$THRDHAND
*
%DECLARE=#THREADDIA,#THRDPLUNGE,#THRDSTARTZ,#THRDENDZ,#THRDCLEAR
%DECLARE=#THRDXPLUNGE,#THRDYPLUNGE,#THRDX,#THRDY,#THRDINOUT,#THRDOUTCODE,#THRDINCODE
%DECLARE=#PLUNGERAD,#THRDFEED,#THRDPOSFEED,#THRDARCDIR,#THRDARCOUT,#0RETRACT

*Extra Variables for TNC
************ Check useage and remove if not required
%DECLARE=#ABSCODE,#COORDCPL,#COORDMC,#WPCOORDS,#CUBICCOORDS
%DECLARE=#SPINBLOCK,$CLWARC,$CCLWARC,$ARCDIRN,#HOLEZ
%DECLARE=$TOOLALIGNMENT,$ALIGNMENTHOLD,$TOOLALIGNZPOS,$TOOLALIGNZNEG,$TOOLALIGNXPOS,$TOOLALIGNXNEG,$TOOLALIGNYPOS,$TOOLALIGNYNEG

%DECLARE=$WPALIGNMENT,#TOOLCALLMODAL,#TOOLCALLALL,$PROGUNIT,#WPUSED,#RFEED,#HEADSPEED
%DECLARE=#RAPFLAG,$COMPHOLD,$COMP,#COMPMODAL,#USECYCLEMOD,#POSITIONHOLD
%DECLARE=#DEPTHMOD,#SHORTCODE,#IXMOVE,#IYMOVE,#IZMOVE
%DECLARE=#RPLANEHOLD,#ZDHOLD,#ZLHOLD,#CYCNUM,#ZCHOLD
%DECLARE=#XDATUM,#YDATUM,#ZDATUM,#DATUMABS,#XDATUMHOLD,#YDATUMHOLD,#ZDATUMHOLD,#XDATUMKEEP,#YDATUMKEEP,#ZDATUMKEEP
%DECLARE=#LINECOUNT,#DSHIFTACTIVE,#TOOLWAITING
%DECLARE=#REARANGHOLD,#FRONTANGHOLD,#REARANGLE,#FRONTANGLE,#WORKPLANEACTIVE,#WORKPLANESET,#COORDSYS,#ALIGN,#ALIGNHOLD
%DECLARE=#FRONTANG2KEEP,#FRONTANGKEEP,#REARANG2KEEP,#REARANGKEEP,#FRONTANG2,#REARANG2
%DECLARE=#TABLEHOLD,#TABLE,#MCCODE,#WPCODE
%DECLARE=#DIRECTIONHOLD2,#DWELLTIME



*User variables for ;CODE command - extended for EC5.5
%DECLARE=#USER1,#USER2,#USER3,#USER4,#USER5,#USER6,#USER7,#USER8,#USER9,#USER10,#USER11,#USER12,#USER13,#USER14,#USER15,#USER16,#USER17,#USER18,#USER19,#USER20
%DECLARE=$USER1,$USER2,$USER3,$USER4,$USER5,$USER6,$USER7,$USER8,$USER9,$USER10,$USER11,$USER12,$USER13,$USER14,$USER15,$USER16,$USER17,$USER18,$USER19,$USER20,$USER
*
*	Constants for start of G function in DATA1 & M function in DATA2 statements
*
;Define^!RAPIDGCODE^1
;Define^!FEEDGCODE^2
;Define^!CIRCGCODE^3
;Define^!DWELLGCODE^5
;Define^!EXACTGCODE^10
;Define^!SETTOOLGCODE^11
;Define^!PLANEGCODE^13
;Define^!UNITSGCODE^16
;Define^!COMPGCODE^20
;Define^!PRESETGCODE^23
;Define^!WORKGCODE^24
;Define^!CHIPBREAKGCODE^34
;Define^!DRILLGCODE^35
;Define^!FEEDMODEGCODE^45
;Define^!ABSINCRGCODE^47
;Define^!RETRACTGCODE^49
;Define^!ROTARYGCODE^54
;Define^!SMOOTHGCODE^58
;Define^!RAPHOMEGCODE^60
;Define^!RAPTCGCODE^61
;Define^!3DCOMPGCODE^63
;Define^!THREADGCODE^66
;Define^!CSSGCODE^70
;Define^!MACHGCODE^72
*
;Define^!STOPMCODE^1
;Define^!SPINMCODE^4
;Define^!TLCHMCODE^7
;Define^!COOLMCODE^8
;Define^!SPINCOOLMCODE^14
;Define^!SUBPROGMCODE^34
;Define^!GEARMCODE^36
;Define^!SMOOTHMCODE^42
;Define^!ROTDIRMCODE^45
;Define^!MODALCYCLE^47

*
*
*	*********************************
*	Tokens - Use in Code Constructor
*	*********************************
*
*
*	G-Codes
;Token^<75>^RAPIDGCODE^[#GCODE=!FT_GCODE]^<76>Rapid Code
;Token^<77>^FEEDGCODE^[#GCODE=!FT_GCODE]^<78>Feed Code
;Token^<79>^CLWGCODE^[#GCODE=!FT_GCODE]^<80>CLW Code
;Token^<81>^CCLWGCODE^[#GCODE=!FT_GCODE]^<82>CCLW Code
;Token^<83>^COMPGCODE^[#COMPGCODE=!FT_GCODE]^<526>Cutter Radius Compensation Code
;Token^<1635>^COMP OFF^[#COMPGCODE=!FT_GCODE]^<2848>Cutter Radius Compensation Off
;Token^<85>^DWELLGCODE^[#DWELLGCODE=!FT_GCODE]^<86>Dwell Code
;Token^<4352>^SPEED-DWELL^^<4353>Speed Related Dwell
;Token^<87>^EXACTSTOPGCODE^[#EXACTGCODE=!FT_GCODE]^<88>Exact Stop Code
;Token^<89>^PLANEGCODE^[#PLANEGCODE=!FT_GCODE]^<527>Co-ordinate Plane
;Token^<91>^UNITSGCODE^[#UNITSGCODE=!FT_GCODE]^<528>NC Program Units
;Token^<93>^RETRACTGCODE^[#RETRACTGCODE=!FT_GCODE]^<94>Cycle Retract Code
;Token^<95>^DRILLGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<27>Drill Cycle
;Token^<96>^SPOTGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<97>Spot Face Cycle
;Token^<98>^PECKGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<99>Peck Drill Cycle
;Token^<100>^TAPGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<28>Tapping Cycle
;Token^<101>^REAMGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<102>Ream / Bore Cycle
;Token^<103>^BOREGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<104>Bore Cycle
;Token^<107>^CHIPBREAKGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<108>Chipbreak Drill Cycle
;Token^<965>^CYCLEGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<966>Hole Cycle
;Token^<105>^ENDCYCLEGCODE^[#CYCLEGCODE=!FT_GCYCLE]^<106>End Canned Cycle
;Token^<109>^PRESETGCODE^[#PRESETGCODE=!FT_GCODE]^<529>Datum Shift Code
;Token^<110>^WORKGCODE^[#WORKGCODE=!FT_WORKGCODE]^<111>Work / Fixture Offset
;Token^<4357>^WORKGCODE2^[#WORKGCODE2=!FT_WORKGCODE]^<4358>Work / Fixture Offset with override
;Token^<4405>^DYNAMICGCODE^[#DYNAMIC=!FT_DYNAMIC]^<4406>Work / Fixture Dynamic Offset
;Token^<112>^FEEDMODEGCODE^[#FEEDMODEGCODE=!FT_GCODE]^<530>Feed Mode Code
;Token^<4432>^MACHMODE^[#MACHGCODE=!FT_GCODE2]^<4433>Machining Mode Code
;Token^<4434>^CANCEL-TURN-MODE^[#MACHGCODE=!FT_GCODE2]^<4435>Cancel Turning Mode
;Token^<4436>^DIAM-RAD^[#DATAMODE=!FT_GCODE3]^<4437>Radial / Diametral
;Token^<4438>^CANCEL-DIAM^[#DATAMODEM=!FT_GCODE3]^<4439>Cancel Diametral
;Token^<199>^CSSGCODE^[#CSSGCODE=!FT_GCODE]^<200>CSS / RPM
;Token^<4457>^CANCEL-CSS^[#CSSGCODE=!FT_GCODE]^<200>CSS / RPM
;Token^<2761>^IF_CSS^^<2762>Output if in CSS Mode
;Token^<2763>^IF_RPM^^<2764>Output if in RPM Mode

*	M Codes
;Token^<1825>^COOLANT^[#COOL=!FT_MCODE]^<531>Coolant Control
;Token^<124>^COOLANT OFF^[#COOL=!FT_MCODE]^<531>Coolant Control
;Token^<1823>^COOLTHROTOOL^[#THROUGHTOOL1=!FT_MCODE]^<1824>Through Tool Coolant
;Token^<2124>^COOLTHRTLOFF^[#THROUGHTOOL1=!FT_MCODE]^<2125>Through Tool Coolant Off
;Token^<1800>^SPINDLE OFF^[#DIRECTION=!FT_MCODE]^<127>Spindle Direction
;Token^<3587>^SPINDLE STOP^[#DIRECTION=!FT_MCODE]^<127>Spindle Direction
;Token^<4514>^TURN_SPINDLE OFF^[#DIRECTION=!FT_DIRTURNCYCLE]^<4515>Turn Spindle Direction
;Token^<4516>^TURN_SPINDLE STOP^[#DIRECTION=!FT_DIRTURNCYCLE]^<4515>Turn Spindle Direction
;Token^<126>^SPINDIR^[#DIRECTION=!FT_MCODE]^<127>Spindle Direction
;Token^<3253>^SPINDLE REV^[#DIRECTION=!FT_MCODE]^<3254>Spindle Reverse Direction
;Token^<3588>^SPINDLE RESTART^[#DIRECTION=!FT_MCODE]^<3589>Spindle Restart
;Token^<3996>^RESET_SPINDLE^^<3997>Reset Spindle Direction
;Token^<128>^STOPMCODE^[#STOPMCODE=!FT_MCODE]^<129>Program / Optional Stop
;Token^<2359>^OPSTOP^[#STOPMCODE=!FT_MCODE]^<2360>Optional Program Stop
;Token^<3817>^PROGSTOP^[#STOPMCODE=!FT_MCODE]^<45>Program Stop
;Token^<2938>^PROG_STOP^^<129>Program / Optional Stop
;Token^<211>^GEARMCODE^[#GEARMCODE=!FT_MCODE]^<212>Gear Range
;Token^<532>^SMOOTHMCODE^[#EXACTGCODE=!FT_MCODE]^<533>Smooth Mcode
;Token^<1036>^RETRACTMCODE^[#RETRACTGCODE=!FT_MCODE]^<94>Cycle Retract Code

*	General
;Token^<146>^DELETE^[#DELETE=!FT_DELETE]^<147>Block Delete
;Token^<148>^BLKNUM^[#BNUM=!FT_BLKNUM]^<149>Block Number
;Token^<1293>^OPNUM^[#SBNUM=!FT_OPNUM]^<1294>Operation Number
;Token^<150>^SAFEBLKNUM^[#SBNUM=!FT_SAFEBLKNUM]^<151>Safe / Toolchange Block Number
;Token^<152>^PROGDESCR^[$DESCR]^<3732>Ask Program Description
;Token^<534>^PROGUNITS^[$PROGUNIT=5]^<528>NC Program Units
;Token^<1505>^XHOMEPOS^[#XMOVE=!FT_XHOMEPOS]^<3818>X Home Local Address
;Token^<1506>^YHOMEPOS^[#YMOVE=!FT_YHOMEPOS]^<3819>Y Home Local Address
;Token^<1507>^ZHOMEPOS^[#ZMOVE=!FT_ZHOMEPOS]^<3820>Z Home Local Address
;Token^<154>^XHOME^[#XMOVE=!FT_XMOVE]^<1508>Move to X Home
;Token^<156>^YHOME^[#YMOVE=!FT_YMOVE]^<1509>Move to Y Home
;Token^<158>^ZHOME^[#ZMOVE=!FT_ZMOVE]^<1510>Move to Z Home
;Token^<1511>^XTOOLPOS^[#XMOVE=!FT_XTOOLPOS]^<3821>X Toolchange Local Address
;Token^<1512>^YTOOLPOS^[#YMOVE=!FT_YTOOLPOS]^<3822>Y Toolchange Local Address
;Token^<1513>^ZTOOLPOS^[#ZMOVE=!FT_ZTOOLPOS]^<3823>Z Toolchange Local Address
;Token^<160>^XTOOL^[#XMOVE=!FT_XMOVE]^<1514>Move to X Toolchange
;Token^<162>^YTOOL^[#YMOVE=!FT_YMOVE]^<1515>Move to Y Toolchange
;Token^<164>^ZTOOL^[#ZMOVE=!FT_ZMOVE]^<1516>Move to Z Toolchange
;Token^<166>^XMOVE^[#XMOVE=!FT_XMOVE]^<167>X Move
;Token^<168>^YMOVE^[#YMOVE=!FT_YMOVE]^<169>Y Move
;Token^<170>^ZMOVE^[#ZMOVE=!FT_ZMOVE]^<171>Z Move
;Token^<2228>^IZMOVE^[#IZMOVE=!FT_IZMOVE]^<2229>Incremental Z Move
;Token^<172>^ZINITIAL^[#ZMOVE=!FT_ZMOVE]^<173>Initial Plane
;Token^<174>^FEED^[#FEED=!FT_FEED]^<175>Feedrate
;Token^<176>^SPEED^[#SPEED=!FT_SPEED]^<177>Spindle Speed
;Token^<4517>^TURN_FEED^[#FEED=!FT_FTURNCYCLE]^<4518>Turn Feed
;Token^<4519>^TURN_SPEED^[#SPEED=!FT_STURNCYCLE]^<4520>Turn Speed
;Token^<4521>^TURN_SPINDIR^[#DIRECTION=!FT_DIRTURNCYCLE]^<4515>Turn Spindle Direction
;Token^<970>^WARNING^[$WARNING]^<971>Warning messages
;Token^<1581>^SEMICOLON^[$TEMP]^<1582>Semi Colon character
;Token^<1801>^WARNCOUNT^^<1802>Output Warnings Count
* 3D compensation
;Token^<4359>^XPARTNORMAL^[XPARTNORMAL=!FT_XPARTNORMAL]^<4360>X Part normal
;Token^<4361>^YPARTNORMAL^[YPARTNORMAL=!FT_YPARTNORMAL]^<4362>Y Part normal
;Token^<4363>^ZPARTNORMAL^[ZPARTNORMAL=!FT_ZPARTNORMAL]^<4364>Z Part normal
;Token^<4365>^3DCOMPCODE^[$3DCOMP]^<4366>3D Compensation code
;Token^<4407>^3DCRCGODE^[#3DCRCGCODE=!FT_GCODE]^<4408>3D Compensation G Code
;Token^<4367>^3D_CCR^[#3DCCR=!FT_3DCCR]^<4368>3D Comp corner radius
;Token^<4369>^3D_TR^[#3DTR=!FT_3DTR]^<4370>3D Comp tool radius


*	Toolchange / Tooling
;Token^<182>^SETTOOLGCODE^[#SETTOOLGCODE=!FT_GCODETSET]^<43>Set Tool Data
;Token^<183>^TURRETNO^[POSITION=!FT_TPOSN]^<184>Turret / Position Number
;Token^<185>^NEXTTOOL^[#NEXTTOOL=!FT_TPOSN]^<186>Pre-select Next Tool
;Token^<4333>^NEXT_COMMENT^[$NEXTCOMMENT]^<4334>Next Comment
;Token^<4335>^NEXT_DESCRIPTION^[$NEXTDESCRIPTION]^<4336>Next Description
;Token^<4323>^NEXT_GROUP^[$NEXTGROUP]^<4324>Next Group
;Token^<4248>^NEXT_GROUP_NUMBER^[#NEXTGROUPNUMBER=!FT_TSTORE3]^<4249>Next Group Number
;Token^<4325>^NEXT_GROUP_TEXT^[$NEXTGROUPSTRING]^<4326>Next Group Text
;Token^<4327>^NEXT_ID^[$NEXTID]^<4328>Next ID
;Token^<4329>^NEXT_ID_NUMBER^[#NEXTIDNUMBER=!FT_TSTORE4]^<4330>Next ID Number
;Token^<4331>^NEXT_ID_TEXT^[$NEXTIDSTRING]^<4332>Next ID Text
;Token^<187>^FIRSTTOOL^[#FIRSTTOOL=!FT_TPOSN]^<188>Re-select First Tool
;Token^<189>^LENGTHOFFSET^[#HCODE=!FT_TLONO]^<535>Tool Length Offset (TLO)
;Token^<191>^ZGAUGELENGTH^[#ZGAUGE=!FT_ZGAUGETSET]^<192>Tool Z Gauge Length
;Token^<197>^TOOLRADIUS^[TOOLRAD=!FT_RADTSET]^<198>Tool Radius
;Token^<195>^TOOLDIAM^[#TOOLDIA=!FT_DIATSET]^<196>Tool Diameter
;Token^<209>^LOOPNUMBER^[#HEADER=!FT_LOOPTSET]^<210>Loop Number
;Token^<1856>^TOOLCHANGE^^<1857>Core Tool Change Blocks
;Token^<4440>^TURN-TOOLCHANGE^^<4441>Turn Tool Change Blocks
;Token^<4470>^CALL_INDEX^^<4471>Call Index code constructor
;Token^<4522>^PRECESSION_ANGLE^[MOUNTANGLE=!FT_FTURNPANGLE]^<4523>Turn Precession Angle
;Token^<4517>^TURN_FEED^[#FEED=!FT_FTURNCYCLE]^<4518>Turn Feed
;Token^<4519>^TURN_SPEED^[#SPEED=!FT_STURNCYCLE]^<4520>Turn Speed
;Token^<2131>^TSTORE_USER1^[TSTOREUSER1=!FT_TSTORE1]^<2132>ToolStore Numeric (User Defined)
;Token^<2133>^TSTORE_USER2^[TSTOREUSER2=!FT_TSTORE2]^<2132>ToolStore Numeric (User Defined)
;Token^<2134>^TSTORE_STRING1^[STRTSTOREUSER1]^<2135>ToolStore String (User Defined)
;Token^<2136>^TSTORE_STRING2^[STRTSTOREUSER2]^<2135>ToolStore String (User Defined)
;Token^<4199>^FORCE_INDEX^^<4200>Force First Index

* If orientation tokens
;Token^<4524>^IF_AXIAL^^<4525>Output if in Axial Turn
;Token^<4526>^IF_RADIAL^^<4527>Output if in Radial Turn
;Token^<4528>^IF_ANGLED^^<4529>Output if in Angled Turn

* Angled Head
;Token^<3926>^CYCLEAXIS^[$DEPTHDIR]^<3927>Cycle Axis Letter Address

* Rapid to Home or ToolChange
;Token^<2122>^SECOND_LEG^^<2123>Calls second leg code constructor

* G28 format for ISO
;Token^<3265>^X0^[#XZERO=!FT_XMOVE2]^<376>X Incremental Zero move
;Token^<3266>^Y0^[#YZERO=!FT_YMOVE2]^<1720>Y Incremental Zero move
;Token^<3267>^Z0^[#ZZERO=!FT_ZMOVE2]^<378>Z Incremental Zero move
;Token^<3928>^MOVETCREF^[#CODETC=!FT_GCODE]^<3929>Rapid to TC Ref Point
;Token^<3930>^MOVEHOMEREF^[#CODEHOME=!FT_GCODE]^<3931>Rapid to Home Ref Point
;Token^<3932>^FORCE-INC^[#ABSINC=!FT_GCODE]^<3933>Incremental G Code

*	Cutter Radius Compensation
;Token^<217>^CRC REGISTER^[#COMPDCODE=!FT_CRCNO]^<536>Cutter Radius Compensation Register


*	Circular Interpolation
;Token^<219>^XARCEND^[#XMOVE=!FT_XMOVE]^<220>Arc End X Coord
;Token^<221>^YARCEND^[#YMOVE=!FT_YMOVE]^<222>Arc End Y Coord
;Token^<223>^ZARCEND^[#ZMOVE=!FT_ZMOVE]^<224>Arc End Z Coord
;Token^<225>^IVALUE^[#IVALUE=!FT_IMOVE]^<226>Arc I Value
;Token^<227>^JVALUE^[#JVALUE=!FT_JMOVE]^<228>Arc J Value
;Token^<229>^KVALUE^[#KVALUE=!FT_KMOVE]^<230>Arc K Value
;Token^<231>^ARCRADIUS^[#RADIUS=!FT_RMOVE]^<232>Arc Radius
;Token^<233>^XCENTRE^[#XCENTRE=!FT_XMOVE]^<234>Arc Centre X Coord
;Token^<235>^YCENTRE^[#YCENTRE=!FT_YMOVE]^<236>Arc Centre Y Coord
;Token^<237>^ZCENTRE^[#ZCENTRE=!FT_ZMOVE]^<238>Arc Centre Z Coord
;Token^<2932>^NUMTURNS^[#TURNS=!FT_TURNS]^<2933>Number of Full Turns in Helix
*	Hole Cycles
;Token^<239>^CYCLEZFEED^[#FEED=!FT_FCYCLE]^<240>Hole Cycle Z Feedrate
;Token^<241>^CYCLESPEED^[#SPEED=!FT_SCYCLE]^<177>Spindle Speed
;Token^<242>^DWELLTIME^[DWELL=!FT_DWELL]^<243>Dwell Time
;Token^<244>^CYCLEDWELLTIME^[DWELL=!FT_DWCYCLE]^<245>Counterbore Dwell Time
;Token^<539>^ZDEPTH^[#ZDEPTHOUT=!FT_ZCYCLE]^<540>Z Depth
;Token^<246>^RPLANE^[#RPLANE=!FT_RETRACTCYCLE]^<247>R Plane
;Token^<248>^ZCLEAR^[#TMPCLEAR=!FT_CLEARCYCLE]^<249>Z Clearance Plane
;Token^<1037>^ZLEVEL^[#ZLEVEL=!FT_ZCYCLE]^<1038>Z Level
;Token^<250>^PECKDEPTH^[#DEPTH=!FT_PECKCYCLE]^<251>Pecking Depth
;Token^<252>^COMMENT^[USERDEFINEDSTRING]^<253>Operator Message
;Token^<254>^PITCH^[#PITCH=!FT_PITCHCYCLE]^<255>Thread / Tap Pitch
;Token^<256>^DEGRESSION^[#DEGR=!FT_DEGCYCLE]^<541>Hole Cycle Degression
;Token^<542>^BORESTANDOFF^[#BOREOFFSET=!FT_OFFCYCLE]^<543>Bore Stand Off Distance
;Token^<1655>^BORESTANDOFF-X^[USERVAR2=!FT_OFFCYCLE]^<1656>Bore Stand Off X
;Token^<1657>^BORESTANDOFF-Y^[USERVAR3=!FT_OFFCYCLE2]^<1658>Bore Stand Off Y
;Token^<2120>^RIGIDTAP^[#RIGIDTAP=!FT_MCODE]^<2121>Rigid Tapping Code
;Token^<2941>^PECKSAFE^[#PECKSAFE=!FT_PECKCYCLE2]^<2942>Peck Safe Distance
* Added for Sinumerik840 & Fadal cycles
;Token^<1219>^REFPLANE^[#ZLEVEL=!FT_CYCLEPARAM]^<1220>Reference Plane (RFP)
;Token^<262>^ZSAFE^[ZSAFE=!FT_CYCLEPARAM]^<263>Z Safe Distance
;Token^<1221>^CYCLEFIRSTDWELL^[#FIRSTDWELL=!FT_CYCLEFIRSTDWELL]^<1222>Cycle First Peck Dwell Time
;Token^<1223>^FIRSTDEPTH^[#FIRSTDEPTH=!FT_FIRSTDEPTH]^<1224>First Depth
;Token^<1269>^LASTDEPTH^[#LASTDEPTH=!FT_LASTDEPTH]^<1270>Last Depth
;Token^<1225>^RDEPTH^[#RELDEPTH=!FT_CYCLEPARAM]^<1226>Relative Depth
;Token^<1227>^RETFEED^[#RETFEED=!FT_CYCLEPARAM]^<1228>Retract Feed
;Token^<1229>^CYCLESPINDIR^[#DIRECTION=!FT_CYCLESPINDIR]^<127>Spindle Direction
;Token^<1659>^CYCLENPECKS^[#NPECKS=!FT_CYCLENPECKS]^<1660>Number of Pecks
;Token^<4035>^CYCLEBREAKS^[#TAPBREAK=!FT_CYCLEPARAM]^<4036>Chip Break Type Code

*	Datum Shift : Translate / Index
;Token^<264>^XABSORIGIN^[#XSUB=!FT_XMOVE]^<3158>Absolute X Origin (CPL)
;Token^<266>^YABSORIGIN^[#YSUB=!FT_YMOVE]^<3159>Absolute Y Origin (CPL)
;Token^<268>^ZABSORIGIN^[#ZSUB=!FT_ZMOVE]^<3160>Absolute Z Origin (CPL)
;Token^<3161>^XMCORIGIN^[XINC=!FT_XMOVE]^<3162>Absolute X Origin (MC DAT)
;Token^<3163>^YMCORIGIN^[YINC=!FT_YMOVE]^<3164>Absolute Y Origin (MC DAT)
;Token^<3165>^ZMCORIGIN^[ZINC=!FT_ZMOVE]^<3166>Absolute Z Origin (MC DAT)

;Token^<270>^XINC^[#XMOVE=!FT_XMOVE]^<271>Incremental X Origin
;Token^<272>^YINC^[#YMOVE=!FT_YMOVE]^<273>Incremental Y Origin
;Token^<274>^ZINC^[#ZMOVE=!FT_ZMOVE]^<275>Incremental Z Origin

* Origin shift for TNC
;Token^<2849>^XINCR^[#XMOVE=!FT_XMOVE]^<271>Incremental X Origin
;Token^<2850>^YINCR^[#YMOVE=!FT_YMOVE]^<273>Incremental Y Origin
;Token^<2851>^ZINCR^[#ZMOVE=!FT_ZMOVE]^<275>Incremental Z Origin
;Token^<276>^CPLNAME^[$CPLNAME]^<277>CPL Name
*
* Datum shift for ISO
;Token^<3242>^XSHIFT^[#XSHIFT=!FT_XMOVE]^<3243>Incremental X Shift
;Token^<3244>^YSHIFT^[#YSHIFT=!FT_YMOVE]^<3245>Incremental Y Shift
;Token^<3246>^ZSHIFT^[#ZSHIFT=!FT_ZMOVE]^<3247>Incremental Z Shift

* Datum Tokens For Siemens
;Token^<3824>^XORIGIN^[#XSUB=!FT_XORIG]^<3158>Absolute X Origin (CPL)
;Token^<3825>^YORIGIN^[#YSUB=!FT_YORIG]^<3159>Absolute Y Origin (CPL)
;Token^<3826>^ZORIGIN^[#ZSUB=!FT_ZORIG]^<3160>Absolute Z Origin (CPL)
;Token^<3827>^X840ORIGIN^[XINC=!FT_XORIG]^<3162>Absolute X Origin (MC DAT)
;Token^<3828>^Y840ORIGIN^[YINC=!FT_YORIG]^<3164>Absolute Y Origin (MC DAT)
;Token^<3829>^Z840ORIGIN^[ZINC=!FT_ZORIG]^<3166>Absolute Z Origin (MC DAT)
;Token^<3830>^DATUM_TYPE^[$DATUMTYPE]^<3831>Datum Type Description
;Token^<4059>^X840SHIFT^[#XSHIFT=!FT_XSHIFT]^<4060>Cycle X Shift
;Token^<4061>^Y840SHIFT^[#YSHIFT=!FT_YSHIFT]^<4062>Cycle Y Shift
;Token^<4063>^Z840SHIFT^[#ZSHIFT=!FT_ZSHIFT]^<4064>Cycle Z Shift

*	Tooling Sheet / Program Information
;Token^<3693>^TOOL-ANGLE^[INCLUDEDANGLE=!FT_REALSETUP]^<3694>Tool Angle
;Token^<278>^HDR-TURRETNO^[POSITION=!FT_INTSETUP]^<544>Turret No.
;Token^<279>^TOOLDESCR^[$TOOLDESCRIPTION]^<280>Tool Description
;Token^<281>^HDR-TOOLDIAM^[#TOOLDIA=!FT_REALSETUP]^<196>Tool Diameter
;Token^<282>^TOOLTYPE^[$TYPE=10]^<283>Tool Type
;Token^<545>^HDR-TOOLGAUGE^[TOOLEN=!FT_REALSETUP]^<285>Tool Zgauge
;Token^<290>^TOOLUNITS^[$UNIT=5]^<291>Tool Units
;Token^<1792>^FLUTE^[FLUTELENGTH=!FT_REALSETUP]^<1793>Tool Flute Length
;Token^<292>^PROGID^[#PROGID=!FT_PROGID]^<3802>Ask Program Id
;Token^<1295>^TOOLOFFSETID^[#TMP1=!FT_OFFSETID]^<1296>Offset Program Id
;Token^<1297>^WORKOFFSETID^[#TMP2=!FT_OFFSETID]^<1296>Offset Program Id
;Token^<294>^SEQID^[$SEQID=23]^<295>Machining Sequence
;Token^<296>^MACHINENAME^[MACHINENAME]^<297>Machine Description
;Token^<298>^CYCLETIME^[MACHTIME1=!FT_REALSETUP]^<547>Cycle Time Including Toolchange
;Token^<300>^DATE^[DATE]^<301>Program creation Date
;Token^<2105>^UKDATE^[UKDATE]^<2106>Program creation Date (UK Format)
;Token^<2107>^DAY^[DAY=!FT_INTSETUP]^<2108>Program creation Day
;Token^<2109>^MONTH^[MONTH=!FT_INTSETUP]^<2110>Program creation Month
;Token^<2111>^YEAR^[YEAR=!FT_INTSETUP]^<2112>Program creation Year
;Token^<302>^TIME^[TIME]^<303>Program creation Time
;Token^<304>^PROGVERSION^[$PROGVER]^<3742>Ask Program Version No.
;Token^<306>^PROGRAMMER^[$ID]^<3743>Ask Programmer's Name
;Token^<308>^MANREADABLE^MANREADABLE=[$MANREADABLE]^<3744>Enter Manreadable (Punch Tape)
;Token^<310>^LEADER^LEADER=[#LEADER=!FT_REALSETUP]^<311>Leader (Punch Tape)
;Token^<312>^PARTNAME^[PARTNAME]^<313>Input Part Name
;Token^<314>^SEQUENCENAME^[SEQUENCENAME]^<315>M/C Sequence Name
;Token^<2230>^CORNER^[CORNERRAD=!FT_REALSETUP]^<2231>Tool Corner radius
;Token^<2232>^REACH^[REACH=!FT_REALSETUP]^<2233>Tool Reach

*	Subroutines
;Token^<316>^SUBCALL^[#SUBSTARTMCODE=!FT_MCODE]^<317>Subroutine Call M-Code
;Token^<318>^SUBNO^[#SUBROUTINE=!FT_SUBID]^<319>Subroutine Program Number
;Token^<320>^SUBNOCALL^[#SUBROUTINE=!FT_SUBCALL]^<321>Call Subroutine Program Number
;Token^<3832>^SUBENDNO^[#SUBROUTINE2=!FT_SUBID]^<319>Subroutine Program Number
;Token^<322>^SUBEND^[#SUBENDMCODE=!FT_MCODE]^<323>Subroutine End M-Code

*	By block number
;Token^<324>^N-SUBSTART^[STARTSUB=!FT_SSNUM]^<325>Block Number Start
;Token^<326>^N-SUBEND^[ENDSUB=!FT_SENUM]^<327>Block Number End

*	Position : Before, after, in-line with main NC Program
;Token^<328>^SUBROUTINES^^<329>Subroutines position
;Token^<912>^ABS-INC^[#ABSINC=!FT_GCODE]^<913>Absolute/Incremental Coords Code

*	Datums
;Token^<330>^SETDATUMS^^<549>Set-Up Workdatums
;Token^<842>^WORKREGISTER^[#COORDNUM=!FT_LOOPTSET]^<843>Work Offset Register

*	Rotary Axes / Milling
;Token^<2852>^FIRST ROT^[#FIRSTANGLE=!FT_PRIMARYROT]^<2853>First Rotary Axis
;Token^<2854>^SECOND ROT^[#SECONDANGLE=!FT_SECONDARYROT]^<2855>Second Rotary Axis
;Token^<3833>^FIRST ANG^[#FIRSTANGLE=!FT_PRIMARY2]^<3834>First Rotary Angle
;Token^<3835>^SECOND ANG^[#SECONDANGLE=!FT_SECONDARY2]^<3836>Second Rotary Angle
;Token^<2313>^REAR_ANGLE^[#REARANGLE=!FT_PRIMARYROT2]^<2853>First Rotary Axis
;Token^<2315>^FRONT_ANGLE^[#FRONTANGLE=!FT_SECONDARYROT2]^<2855>Second Rotary Axis
;Token^<4337>^POLAR_CODE^[#POLARGCODE=!FT_POLARGCODE]^<4338>Polar ON / OFF Code

;Token^<4530>^TC FIRST ROT^[#TCROT1=!FT_PRIMARYROT]^<4531>Toolchange First Rotary Axis
;Token^<4532>^TC SECOND ROT^[#TCROT2=!FT_SECONDARYROT]^<4533>Toolchange Second Rotary Axis

;Token^<848>^ROTARYGCODE^[#ROTARYGCODE=!FT_ROTARYGCODE]^<849>Rotary / Planar Code
;Token^<850>^WRAP HEIGHT^[#WRAPHEIGHT=!FT_WRAPHEIGHT]^<851>Wrap Height (Radius/Diameter)

;Token^<852>^ROTATE CLW/CCLW^[#ROTDIRMCODE=!FT_ROTDIRMCODE]^<853>Code for direction of Rotation
;Token^<4472>^FIRST ROT DIR^[#FIRSTDIR=!FT_ROTDIRMCODE]^<4473>First Rotary Axis direction code
;Token^<4474>^SECOND ROT DIR^[#SECONDDIR=!FT_ROTDIRMCODE]^<4475>Second Rotary Axis direction code

;Token^<2113>^T-CLAMP-ON^[#TCLAMP=!FT_MCODE]^<2114>Table Clamp On
;Token^<2115>^T-CLAMP-OFF^[#TCLAMP=!FT_MCODE]^<2116>Table Clamp Off
;Token^<2117>^TABLE-CLAMP^[#TCLAMP=!FT_MCODE]^<2118>Table Clamp Status
;Token^<4065>^T-CLAMP2-ON^[#T2CLAMP=!FT_MCODE]^<4066>Secondary Table Clamp On
;Token^<4067>^T-CLAMP2-OFF^[#T2CLAMP=!FT_MCODE]^<4068>Secondary Table Clamp Off
;Token^<4069>^TABLE-CLAMP2^[#T2CLAMP=!FT_MCODE]^<4070>Secondary Table Clamp Status

;Token^<3837>^ROTATION_X^[#XCENTRE=!FT_ROTX]^<3838>Rotation Centre X Coord
;Token^<3839>^ROTATION_Y^[#YCENTRE=!FT_ROTY]^<3840>Rotation Centre Y Coord
;Token^<3841>^ROTATION_ANG^[#ANGLE2=!FT_ROTA]^<3842>Rotation Angle

* Token^TOOL-ANGLE-1^[#TOOLR1=!FT_PRIMARY2]^Tool Angle - First Axis
* Token^TOOL-ANGLE-2^[#TOOLR2=!FT_SECONDARY2]^Tool Angle - Second Axis
;Token^<3843>^MOUNT-ANGLE^[#MOUNTANG=!FT_MOUNTANG]^<3844>Attachment Mounting Angle
;Token^<3845>^HEAD-ANGLE^[#HEADANG=!FT_HEADANG]^<3846>Head Attachment Angle

* 5 Axis IKJ
;Token^<2856>^5AXISMODE^[#AX5MODE=!FT_AX5CODE]^<2857>5 Axis Machining Mode
;Token^<642>^IVECTOR^[INORMAL=!FT_AX5ICODE]^<2858>5 Axis I Vector
;Token^<644>^JVECTOR^[JNORMAL=!FT_AX5JCODE]^<2859>5 Axis J Vector
;Token^<646>^KVECTOR^[KNORMAL=!FT_AX5KCODE]^<2860>5 Axis K Vector

* Pivot options
;Token^<3248>^PIVOTMODE^[#PIVOTCODE=!FT_PIVOT]^<3249>Pivot Mode Code

*   Spline Output
*   Fanuc specific
;Token^<1039>^ORDER^[#ORDER=!FT_ORDER]^<1040>NURB Order
;Token^<1041>^WEIGHT^[#WEIGHT=!FT_WEIGHT]^<1042>NURB Weight
;Token^<1043>^KNOT^[#KNOT=!FT_KNOT]^<1044>NURB Knot

*   Heidenhain specific
;Token^<1045>^AXIS^[$AXIS]^<1046>Active axis
;Token^<1047>^CONTINUATION^[$CONTINUE]^<1048>Continuation Character
;Token^<1049>^K1 COEFF^[#K1VALUE=!FT_COEFF]^<1050>K1 Coefficient
;Token^<1051>^K2 COEFF^[#K2VALUE=!FT_COEFF]^<1052>K2 Coefficient
;Token^<1053>^K3 COEFF^[#K3VALUE=!FT_COEFF]^<1054>K3 Coefficient
;Token^<1055>^K1 EXPONENT^[#K1EXP=!FT_EXP]^<1056>K1 Exponent
;Token^<1057>^K2 EXPONENT^[#K2EXP=!FT_EXP]^<1058>K2 Exponent
;Token^<1059>^K3 EXPONENT^[#K3EXP=!FT_EXP]^<1060>K3 Exponent
;Token^<1061>^HIGHSPEED TOL^[#HIGHSPEEDTOL=!FT_HIGHSPEEDTOL]^<1062>High Speed M/c Tolerance
;Token^<3078>^HIGHSPEED BLOCK^^<3079>High Speed Mode Block
;Token^<1230>^MAXFEED^[#FEED=!FT_FEED]^<1231>Rapid Feed Value
* Also in Siemens
;Token^<2337>^RETRACT-FEED^[#RFEED=!FT_FCYCLE2]^<1228>Retract Feed
;Token^<840>^M89/M99^[#MODALCYCLE=!FT_MCODE]^<841>Modal (M89) / Non Modal (M99)
;Token^<2258>^ARCDIRN^[$ARCDIRN]^<2259>Arc Direction Code
;Token^<2292>^MC-COORDS^[#ABSCODE=!FT_COORDS]^<2293>Machine Absolute Coordinate Code

* Siemens Polynomial
;Token^<1232>^POLY-X^[#EX=!FT_SPLINEX]^<1233>Polynomial X End Point
;Token^<1234>^POLY-Y^[#EY=!FT_SPLINEY]^<1235>Polynomial Y End Point
;Token^<1236>^POLY-Z^[#EZ=!FT_SPLINEZ]^<1237>Polynomial Z End Point
;Token^<1238>^COEFF-XA^[#AX=!FT_SPLINEPARAM]^<1239>Polynomial Xa Coefficient
;Token^<1240>^COEFF-XB^[#BX=!FT_SPLINEPARAM]^<1241>Polynomial Xb Coefficient
;Token^<1242>^COEFF-YA^[#AY=!FT_SPLINEPARAM]^<1243>Polynomial Ya Coefficient
;Token^<1244>^COEFF-YB^[#BY=!FT_SPLINEPARAM]^<1245>Polynomial Yb Coefficient
;Token^<1246>^COEFF-ZA^[#AZ=!FT_SPLINEPARAM]^<1247>Polynomial Za Coefficient
;Token^<1248>^COEFF-ZB^[#BZ=!FT_SPLINEPARAM]^<1249>Polynomial Zb Coefficient
* Tokens for Polynomials - Trailng brackets
;Token^<1332>^XBRACKET^[$XBRAK]^<1333>Trailing bracket on X coefficients
;Token^<1334>^YBRACKET^[$YBRAK]^<1335>Trailing bracket on Y coefficients
;Token^<1336>^ZBRACKET^[$ZBRAK]^<1337>Trailing bracket on Z coefficients


;Token^<2260>^DATUM-SHIFT^^<2055>Datum Shift
;Token^<2261>^CANCEL-DSHIFT^^<2262>Cancel Datum Shift
;Token^<2263>^IF-X-CHANGED^^<2264>Output if Datum Coordinate Has Changed
;Token^<2265>^IF-Y-CHANGED^^<2264>Output if Datum Coordinate Has Changed
;Token^<2266>^IF-Z-CHANGED^^<2264>Output if Datum Coordinate Has Changed
;Token^<2267>^X-DATUM^[#XDATUM=!FT_XDATUM]^<2268>X Datum Coordinate
;Token^<2269>^Y-DATUM^[#YDATUM=!FT_YDATUM]^<2270>Y Datum Coordinate
;Token^<2271>^Z-DATUM^[#ZDATUM=!FT_ZDATUM]^<2272>Z Datum Coordinate
;Token^<2273>^LINECOUNT^[#LINECOUNT=!FT_LINECOUNT]^<2274>Cycl Def Line Count
;Token^<2275>^ROTATE-HEAD^^<2276>Rotate Machine Head
;Token^<2277>^WORKPLANE^^<2278>Call to Define Work Plane
;Token^<2279>^AXIS-ALIGN^[#ALIGN=!FT_ALIGN]^<2280>X Axis Alignment Angle
;Token^<2320>^SHORTEST^[#SHORTCODE=!FT_MCODE]^<2861>Axis Rotation Shortest

;Token^<2281>^WPLANESET^^<2282>Work Plane Setting blocks
;Token^<2283>^CANCEL-WPLANE^^<2284>Cancel Workplane
;Token^<1567>^POLAR-RAD^[#RADIUS=!FT_PRAD]^<1568>Polar Arc Radius
;Token^<1569>^START-ANGLE^[#BEARING1=!FT_ARCSTART]^<1570>Arc Start Angle
;Token^<1571>^INC-ANGLE^[#INCANGLE=!FT_ARCANG]^<1572>Arc Included Angle
;Token^<2285>^CPL-NAME^[$CPLNAME]^<277>CPL Name
;Token^<2286>^CPL-ID3^[$CPLNAME]^<2287>CPL Name First 3 Characters
;Token^<2261>^CANCEL-DSHIFT^^<2328>Cancel Datum Shift if Active
;Token^<2329>^TOOL-CALL^^<2330>Tool Call Block
;Token^<2305>^TOOL-ALIGNMENT^[$TOOLALIGNMENT=1]^<2306>Tool Axis Alignment Character
;Token^<2307>^TOOL-ALIGN-STR^[$TOOLALIGNMENT]^<2308>Tool Axis Alignment String
;Token^<2335>^COORDSYS^[#COORDSYS=!FT_MCODE]^<2336>Coordinate System Type
;Token^<2910>^MOVE_CODE^[$TNCLINEAR]^<2911>Linear Movement Code

* Tap cycle tokens for different addresses
;Token^<1583>^TAP-ZFEED^[#FEED=!FT_TAP-FCYCLE]^<240>Hole Cycle Z Feedrate
;Token^<1584>^TAP-DWELLTIME^[DWELL=!FT_TAP-DWCYCLE]^<245>Counterbore Dwell Time
;Token^<1585>^TAP-ZDEPTH^[#ZMOVE=!FT_TAP-ZCYCLE]^<540>Z Depth
;Token^<4071>^TAP-PECK^[#DEPTH=!FT_TAP-ZCYCLE3]^<4072>Peck Depth
;Token^<1586>^TAP-RPLANE^[#RPLANE=!FT_TAP-RETRACTCYCLE]^<247>R Plane
;Token^<1587>^TAP-ZCLEAR^[#TMPCLEAR=!FT_TAP-CLEARCYCLE]^<249>Z Clearance Plane
;Token^<1588>^TAP-ZLEVEL^[#ZLEVEL=!FT_ZCYCLE2]^<1038>Z Level
;Token^<1589>^TAP-PITCH^[#PITCH=!FT_TAP-PITCHCYCLE]^<255>Thread / Tap Pitch

;Token^<1590>^Z-LEVEL^[#ZLEVEL=!FT_ZCYCLE2]^<1038>Z Level

* Thread Mill Canned Cycle
;Token^<3847>^T-MILL-HAND^[$THRDHAND]^<3848>Hand of Thread Description
;Token^<2339>^T-MILL-TYPE^[#THRDINOUT=!FT_TM_TYPE]^<2340>Internal External Thread Cycle
;Token^<2341>^T-MILL-DIA^[#THREADDIA=!FT_TM_DIA]^<2342>Thread Mill Nominal Diameter
;Token^<3849>^T-MILL-MINOR^[#THREADMIN=!FT_TM_DIA]^<3850>Thread Mill Minor Diameter
;Token^<4161>^T-MILL-TDEPTH^[#THREADDEPTH=!FT_TM_DIA]^<4162>Thread Mill Thread Depth
;Token^<2343>^T-MILL-LEAD^[#THRDLEAD=!FT_TM_LEAD]^<2344>Thread Mill Lead
;Token^<3851>^T-MILL-PITCH^[#THRDPITCH=!FT_TM_PITCH]^<3852>Thread Mill Pitch
;Token^<3853>^T-MILL-STARTS^[STARTS=!FT_TM_START]^<3854>Thread Mill Number of Starts
;Token^<4133>^T-MILL-START_ANGLE^[STARTANGLE=!FT_TM_START]^<4134>Thread Mill Start Angle
;Token^<4135>^T-MILL-TAPER^[INCLUDEDANGLE=!FT_TM_START]^<4136>Thread Mill Taper Angle
;Token^<2345>^T-MILL-ZDEPTH^[#THRDEPTH=!FT_TM_DEP]^<2346>Thread Mill Z Depth
;Token^<2347>^T-MILL-APPROACH^[#THRDPOSFEED=!FT_TM_APP]^<2348>Thread Mill Approach Feed
;Token^<2349>^T-MILL-MODE^[#THRDMILL=!FT_TM_MODE]^<2350>Thread Mill Climb or Upcut
;Token^<2351>^T-MILL-RETR^[#THRDPLUNGE=!FT_TM_RETR]^<2352>Thread Mill Retract
;Token^<2353>^T-MILL-LEVEL^[#THRDLEVEL=!FT_TM_LEVEL]^<2354>Thread Mill Level
;Token^<2355>^T-MILL-CLEAR^[#TMPCLEAR=!FT_TM_CLEAR]^<2356>Thread Mill Z Clear
;Token^<2357>^T-MILL-FEED^[#THRDFEED=!FT_TM_FEED]^<2358>Thread Mill Cutting Feed
* Added for Siemens
;Token^<3855>^T-MILL-DIR^[#THRDARCOUT=!FT_TM_DIR]^<3856>Thread Mill Direction
;Token^<3857>^T-MILL-X^[#XMOVE=!FT_TM_X]^<3858>Thread Mill X Centre
;Token^<3859>^T-MILL-Y^[#YMOVE=!FT_TM_Y]^<3860>Thread Mill Y Centre
;Token^<3998>^THISZMOVE^[#ZMOVE=!FT_ZMOVE]^<3999>Z of First Leg
* For Heidenhain
;Token^<3934>^T-MILL-STEP^[#THRDSTEP=!FT_TM_TPS]^<3935>Threads Per Step

***********************************************************
* Job Record Tokens
***********************************************************
;Token^<1637>^JM-DESC^[JOBDESC]^<1638>Job Manager Description
;Token^<1639>^JM-COM^[JOBCOM]^<1640>Job Manager Comment
;Token^<1641>^JM-FAM^[JOBFAM]^<1642>Job Manager Family
;Token^<1643>^JM-MACH^[JOBMACH]^<1644>Job Manager Machine
;Token^<1645>^JM-CUST^[JOBCUST]^<1646>Job Manager Customer
;Token^<1647>^JM-PROG^[JOBPROG]^<1648>Job Manager Programmer
;Token^<1649>^JM-MATL^[JOBMATL]^<1650>Job Manager Material
;Token^<1651>^JM-REV^[JOBREV]^<1652>Job Manager Revision

***********************************************************
* User tokens for ;CODE commands
***********************************************************
;Token^<1497>^USER-STRING^[$USER]^<1498>User String Token
;Token^<1597>^USER-STRING-1^[$USER1]^<1498>User String Token
;Token^<1598>^USER-STRING-2^[$USER2]^<1498>User String Token
;Token^<1599>^USER-STRING-3^[$USER3]^<1498>User String Token
;Token^<1600>^USER-STRING-4^[$USER4]^<1498>User String Token
;Token^<1601>^USER-STRING-5^[$USER5]^<1498>User String Token
;Token^<1499>^USER-1^[#USER1=!FT_USER-1]^<1602>User Numeric Token
;Token^<1501>^USER-2^[#USER2=!FT_USER-2]^<1602>User Numeric Token
;Token^<1503>^USER-3^[#USER3=!FT_USER-3]^<1602>User Numeric Token
;Token^<1603>^USER-4^[#USER4=!FT_USER-4]^<1602>User Numeric Token
;Token^<1604>^USER-5^[#USER5=!FT_USER-5]^<1602>User Numeric Token
;Token^<1605>^USER-6^[#USER6=!FT_USER-6]^<1602>User Numeric Token
;Token^<1606>^USER-7^[#USER7=!FT_USER-7]^<1602>User Numeric Token
;Token^<1607>^USER-8^[#USER8=!FT_USER-8]^<1602>User Numeric Token
;Token^<1608>^USER-9^[#USER9=!FT_USER-9]^<1602>User Numeric Token
;Token^<1609>^USER-10^[#USER10=!FT_USER-10]^<1602>User Numeric Token
;Token^<2492>^USER-11^[#USER11=!FT_USER-11]^<1602>User Numeric Token
;Token^<2493>^USER-12^[#USER12=!FT_USER-12]^<1602>User Numeric Token
;Token^<2494>^USER-13^[#USER13=!FT_USER-13]^<1602>User Numeric Token
;Token^<2495>^USER-14^[#USER14=!FT_USER-14]^<1602>User Numeric Token
;Token^<2496>^USER-15^[#USER15=!FT_USER-15]^<1602>User Numeric Token
;Token^<2497>^USER-16^[#USER16=!FT_USER-16]^<1602>User Numeric Token
;Token^<2498>^USER-17^[#USER17=!FT_USER-17]^<1602>User Numeric Token
;Token^<2499>^USER-18^[#USER18=!FT_USER-18]^<1602>User Numeric Token
;Token^<2500>^USER-19^[#USER19=!FT_USER-19]^<1602>User Numeric Token
;Token^<2501>^USER-20^[#USER20=!FT_USER-20]^<1602>User Numeric Token

*	Heidenhain TNC Only
;Token^<2862>^CRC L/R OFF^[$COMP]^<2863>Compensation R0
;Token^<537>^CRC L/R^[$COMP]^<538>Compensation RR / RL
;Token^<2365>^IXMOVE^[#IXMOVE=!FT_IXMOVE]^<2366>Incremental X Move
;Token^<2367>^IYMOVE^[#IYMOVE=!FT_IYMOVE]^<2368>Incremental Y Move
;Token^<4073>^FEEDMODEMCODE^[#FEEDMODEGCODE=!FT_MCODE]^<530>Feed Mode Code

* modal lines in Drill Cycle Modify
;Token^<2481>^IF-RPLANE^^<2482>Output Block if Value Has Changed
;Token^<2483>^IF-ZDEPTH^^<2482>Output Block if Value Has Changed
;Token^<2484>^IF-ZLEVEL^^<2482>Output Block if Value Has Changed
;Token^<2485>^IF-ZLEVEL2^^<2482>Output Block if Value Has Changed
;Token^<2934>^IF-ZCLEAR^^<2482>Output Block if Value Has Changed
;Token^<4163>^IF-TM-RPLANE^^<2482>Output Block if Value Has Changed
;Token^<4164>^IF-TM-ZDEPTH^^<2482>Output Block if Value Has Changed
;Token^<4165>^IF-TM-ZLEVEL^^<2482>Output Block if Value Has Changed
;Token^<4166>^IF-TM-ZLEVEL2^^<2482>Output Block if Value Has Changed
;Token^<4167>^IF-TM-ZCLEAR^^<2482>Output Block if Value Has Changed
;Token^<2486>^CYCL-CODE^[#CYCNUM=!FT_INTSETUP]^<2487>Cycl Definition Number
;Token^<3708>^CYCL-DESC^[$CYCDEF]^<3709>Cycl Definition Description

* Euler angles for Workplane
;Token^<3167>^WORKPLANECODE^[#WPLANECODE=!FT_WPLANECODE]^<3168>Work Plane Mode
;Token^<3169>^CANCELWORKPLANE^[#WPLANECODE=!FT_WPLANECODE]^<2446>Cancel Work Plane
;Token^<3170>^EULER-1^[EULER1=!FT_EULER1]^<3171>First Euler Angle
;Token^<3172>^EULER-2^[EULER2=!FT_EULER2]^<3173>Second Euler Angle
;Token^<3174>^EULER-3^[EULER3=!FT_EULER3]^<3175>Third Euler Angle

* Tokens for back bore cycles
;Token^<3590>^BOTTOMZCLEAR^[BOTTOMZCLEAR=!FT_BACKCLEAR]^<3528>Back Bore Z Clear
;Token^<3591>^BOTTOMZLEVEL^[BOTTOMZLEVEL=!FT_BACKLEVEL]^<3530>Back Bore Z Level
;Token^<3710>^BOTTOMCBORE^[#BOTTOMBORE=!FT_BACKDEPTH]^<3711>Incremental Back Bore Z Depth
;Token^<3592>^BOTTOMZDEPTH^[BOTTOMZDEPTH=!FT_BACKDEPTH]^<3712>Absolute Back Bore Z Depth
;Token^<3593>^ZRELIEF^[ZRELIEF=!FT_BACKRELEIF]^<3534>Back Bore Z Back Off
;Token^<3594>^RELIEFDIR^[#RELIEFDIR=!FT_BRDIRN]^<3536>Back Bore Relief Direction
;Token^<3595>^RELIEFDIST^[RELIEFDIST=!FT_BSREL]^<3538>Back Bore Side Relief
;Token^<3713>^EDGEHEIGHT^[#EDGEHEIGHT=!FT_EDGE]^<3714>Tool Edge Height (Flute Length)
;Token^<3715>^THICKNESS^[#THICK=!FT_THICK]^<3716>Material Thickness
;Token^<3717>^SPINANG^[#SPINANG=!FT_SPINANG]^<3718>Spindle Angle
;Token^<3719>^PRE-FEED^[#PREFEED=!FT_PREFEED]^<3720>Pre-Position Z Feedrate

* Tokens for Helical cycles
;Token^<3596>^HOLEDIAM^[HOLEDIAM=!FT_HELDIAM]^<3540>Helical Hole Diameter
;Token^<195>^TOOLDIAM^[#TOOLDIAM=!FT_HEL2DIAM]^<196>Tool Diameter
;Token^<3597>^CHAMFERWIDTH^[CHAMFERWIDTH=!FT_HELCHFR]^<3543>Helical Chamfer Width
;Token^<3598>^CHAMFERANGLE^[CHAMFERANGLE=!FT_HELANG]^<3545>Helical Chamfer Angle
;Token^<3599>^PITCH1^[PITCH1=!FT_HELPITCH1]^<3547>Helical Chamfer Pitch
;Token^<3600>^PITCH2^[PITCH2=!FT_HELPITCH2]^<3549>Helical Hole Pitch
;Token^<3601>^BOTTOMFINISH^[BOTTOMFINISH=!FT_HELFIN]^<3551>Helical Finish Pass
;Token^<3602>^MACHDIR^[MACHDIR=!FT_HELDIRN]^<3553>Helical Mc Direction

* Tokens for tool group and ID
;Token^<3397>^TOOL_GROUP^[GROUP]^<3398>Tool Group
;Token^<3399>^TOOL_GROUP_TEXT^[GROUPSTRING]^<3400>Tool Group Leading Text
;Token^<3401>^TOOL_GROUP_NUMBER^[GROUPNUMBER=!FT_TSTORE3]^<3402>Tool Group Number
;Token^<3403>^TOOL_ID^[ID]^<3404>Tool ID
;Token^<3405>^TOOL_ID_TEXT^[IDSTRING]^<3406>Tool ID Leading Text
;Token^<3407>^TOOL_ID_NUMBER^[IDNUMBER=!FT_TSTORE4]^<3408>Tool ID Number
;Token^<3733>^HOLDER_TYPE^[HOLDERTYPE]^<3734>Tool Holder Type

* Tokens for Renishaw Probing
;Token^<3603>^PROBEX^[#FEEDX=!FT_PROBE01]^<3604>Probe Positioning X Move
;Token^<3605>^PROBEY^[#FEEDY=!FT_PROBE02]^<3606>Probe Positioning Y Move
;Token^<3607>^PROBEZ^[#FEEDZ=!FT_PROBE03]^<3608>Probe Positioning Z Move
;Token^<3609>^PROBEFEED^[FEED=!FT_PROBE04]^<3610>Probe Positioning Feed
;Token^<3611>^PROBEDIAM^[#DIAMETER=!FT_PROBE05]^<3612>Probe Feature Diameter
;Token^<3613>^PROBEANG_A^[#ANGLEA=!FT_PROBE06]^<3614>Probe First Vector Angle
;Token^<3615>^PROBEANG_B^[#ANGLEB=!FT_PROBE07]^<3616>Probe Second Vector Angle
;Token^<3617>^PROBEANG_C^[#ANGLEC=!FT_PROBE08]^<3618>Probe Third Vector Angle
;Token^<3619>^PROBE_FX^[#TRX=!FT_PROBE09]^<3620>Probe Feature X
;Token^<3621>^PROBE_FY^[#TRY=!FT_PROBE10]^<3622>Probe Feature Y
;Token^<3623>^PROBE_FZ^[#TRZ=!FT_PROBE11]^<3624>Probe Feature Z
;Token^<3625>^PROBEDIR^[#ANGLE=!FT_PROBE12]^<3626>Probe Measurement Direction
;Token^<3627>^PROBEDIST^[#DISTANCE=!FT_PROBE13]^<3628>Probe Distance to Surface
* One token for depth  #BOREBOSSZDEPTH #WEBPOCKETZDEPTH #4THAXISZDEPTH
;Token^<3629>^PROBE_DEPTH^[#PROBEZDEPTH=!FT_PROBE14]^<3630>Probe Absolute Depth
;Token^<3631>^PROBE_CLEAR^[#RADCLEAR=!FT_PROBE15]^<3632>Probe Radial Clearance
;Token^<3633>^PROBE_2X^[#SECONDX=!FT_PROBE16]^<3634>Probe X Increment to 2nd Pos
;Token^<3635>^PROBE_2Y^[#SECONDY=!FT_PROBE17]^<3636>Probe Y Increment to 2nd Pos
;Token^<3637>^PROBEDATUM^[#DATUM=!FT_PROBE18]^<4534>Datum & Functions
;Token^<3639>^PROBEOVER^[#OVERTRAVEL=!FT_PROBE19]^<3640>Probe Overtravel
;Token^<3641>^PROBE_FTOL^[#TOLERANCE=!FT_PROBE20]^<3642>Probe Feature Tolerance
;Token^<3643>^PROBE_POSTOL^[#POSITIONTOLERANCE=!FT_PROBE21]^<3644>Probe Positionional Tolerance
;Token^<3645>^PROBE_UPPERTOL^[#UPPERTOLERANCE=!FT_PROBE22]^<3646>Probe Upper Tolerance
;Token^<3647>^PROBE_ANGTOL^[#ANGULARTOLERANCE=!FT_PROBE23]^<3648>Probe Angle tolerance
;Token^<3649>^PROBEXDIST^[#DISTANCE=!FT_PROBE24]^<3650>Probe X Distance
;Token^<3651>^PROBEYDIST^[#DISTANCE=!FT_PROBE25]^<3652>Probe Y Distance
;Token^<3861>^PROBE_ON^^<3862>Probe Mode On
;Token^<3863>^PROBE_OFF^^<3864>Probe Mode Off
;Token^<3865>^PROBE_MODE^^<3866>Probe Mode Control
;Token^<4535>^PROBE_PRINT^[#PRINT=!FT_PROBE41]^<4536>Probe Print

* Tokens for M&H Probing
;Token^<4537>^PROBE_TOUCH^[#TOUCHDIR=!FT_PROBE26]^<4538>Probe Touching Direction
;Token^<4539>^PROBE_SAFEZ^[#FEEDZ=!FT_PROBE27]^<4540>Probe Safety Z
;Token^<4541>^PROBE_1X^[#FIRSTX=!FT_PROBE28]^<4542>Probe X Increment to 1st Pos
;Token^<4543>^PROBE_1Y^[#FIRSTY=!FT_PROBE29]^<4544>Probe Y Increment to 1st Pos
;Token^<4545>^PROBETOUCH_A^[#ANGLEA=!FT_PROBE30]^<4546>Probe First Touch Angle
;Token^<4547>^PROBETOUCH_B^[#ANGLEB=!FT_PROBE31]^<4548>Probe Second Touch Angle
;Token^<4549>^PROBE_ANGLE^[#ANGLEA=!FT_PROBE32]^<4550>Probe Initial Angle
;Token^<4551>^PROBEANG_I^[#ANGLEB=!FT_PROBE33]^<4552>Probe Second Angle
;Token^<4553>^PROBEANG_J^[#ANGLEC=!FT_PROBE34]^<4554>Probe Third Angle
;Token^<4555>^PROBE_TDIST^[#DISTANCE=!FT_PROBE35]^<4556>Probe Trigger Distance
;Token^<4557>^PROBE_X_TOL^[#TOLERANCE=!FT_PROBE38]^<4558>Probe X Tolerance
;Token^<4559>^PROBE_Y_TOL^[#TOLERANCE=!FT_PROBE39]^<4560>Probe Y Tolerance
;Token^<4561>^PROBE_Z_TOL^[#TOLERANCE=!FT_PROBE40]^<4562>Probe Z Tolerance
;Token^<4563>^GAGE_PROGRAM^[NCGAGEPROGNAME]^<4564>Probing NC Gage


***********************************************************
*	Auxilliary axis
***********************************************************



***********************************************************
*	M-Functions (Used to create default Code Constructor)
***********************************************************
;Token^<381>^MCODE^[$MCODE]^<382>M-Code from list
;Define User Macro^$MCODE
;Use Tokens^DELETE^BLKNUM^MCODE
;Use Tokens^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5
;Use Tokens^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10
;Use Tokens^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[MCODE]
*** End of include file A:\Pams\cam\machdef\template\mill-initialise.cgi ***
*** Start of include file mill-iso-mach-mm.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	mill-iso-mach-mm.cgi
*	Author:		RHA
*   Date:       11 November 2005
*
* New file for adaptive milling templates derived from earlier multiplane template                                *
**************************************************************************
*   Change History
* Version 10.5
*          FIRST ISSUE
* 16/12/05 RHA DEV00015566 Spline output enabled
* 20/02/06 RHA DEV00016344 New MM line switch for 5 axis IJK
* 02/03/06 RHA DEV00016506 Change default Home and Tool Change locations
* 07/03/06 RHA DEV00015555 High Speed mode tolerance
* Version 11.0
* 18/07/06 RHA DEV00017692 Tidy Code Generator options in hole macros
* 28/07/06 RHA DEV00017797 New MM and MT line switches
* 07/08/06 RHA DEV00012241 Add High speed and coolant controls to Tool Change*
* 08/08/06 RHA DEV00017341 Correct Tool Length Offset setting
* 13/09/06 RHA DEV00018145 Correct High Speed Mode Q var macro setting
* Version 12.00
* 03/04/07 RHA DEV00020278 Allow Macro15 access to USERVAR2
* Version 12.50
* 06/02/08 RHA DEV00022190 Set default helical interpolation
* 19/03/08 RHA DEV00022891 Allow concecutive coincident indexes to CPL
* Version 2009
* 06/08/08 RHA DEV00024310 Back Bore Cycles Q205
* 13/08/08 RHA DEV00024364 Helical Hole Cycles Q205
* Version 2009.2
* 19/12/08 RHA DEV00025797 Comment new MT fields
* Version 2010.1
* 18/06/09 RHA WI34606 Set SPLINE_OUTPUT for Siemens. Add comment to MM details for all adaptive mill
* 25/09/09 RHA W36130 Set CRC factor to 1.1
* Version 2010.2
* 06/04/10 RHA W38513 Default output to machine coords for 3ax mills
* Version 2011.1
* 04/06/10 RHA W39410 Document MM line switches 42 43
* Version 2011.2
* 16/11/10 RHA W41684 Document MM line switches
* Version 2012.1
* 31/08/11 RHA W45992 Make Max Rapid and High Feed the same value
* Version 2013.2
* 27/11/12 RHA W31861 Assess CGX for milling
* Version 2013.2
* 20/03/13 GST W56520 Add and document new MM line switches 42 43 44 45 46
* 03/04/13 GST W56667 Add and document new MM line switch 47
* Version 2015.1
* 09/07/14 GST W61121 Implement Maximum Linear Separation
* Version 2015.2
* 10/02/15 GST W81600 Implement Program Stop on Move to Home/TC
* 02/04/15 GST W82709 Update Documentation
*
**************************************************************************



;                                                       ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = Machine ÃÄÄÄ
;                                                       ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

;CGXVARIANT^Mill_AX3^3 Axis Mill^3AXMILL
;CGXVARIANT^Mill_AX4^4 Axis Mill^4AXMILL
;CGXVARIANT^Mill_AX5^5 Axis Mill^MPLMILL^5AXMILL
%MACHINE=MILL=ISO 3 Axis Mill
MM=1,30000,2000,4320,0,0,1,39,0,3,600,0,0,0,0,1.1,0,9999.999,0,0,0,0,0,0,0,0,nc,0,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0
;  1|  2  | 3  |4|5|6|7|8 |9|10| 11|12|13|14|15| 16|17|   18   |19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47
;  1|  2  | 3  |4|5|6|7|8 |9|10| 11|12|13|14|15| 16|17|   18   |19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47
;
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ MT=Turret Details Line    ÃÄÄÄ
;                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
; sw  1  Turret name
; sw  2  Number of stations
; sw  3  Tool change X
; sw  4  Tool change Y
; sw  5  Tool change Z
; sw  6  Home X
; sw  7  Home Y
; sw  8  Home Z
; sw  9  Max Extents X
; sw 10  Max Extents Y
; sw 11  Max Extents Z
; sw 12  Min Extents x
; sw 13  Min Extents y
; sw 14  Min Extents z
; sw 15  Max Primary feed
; sw 16  Max Secondary feed
; sw 17  TC Dwell
; sw 18  Number of load points
; sw 19	Z Separation for Multiple Load Points
; sw 20	X Separation 	-""-
; sw 21	B-axis Swing Configuration [1]
; sw 22	Default SpindleId (0,1)
; sw 23  Min B axis extent
; sw 24  Max B axis extent
; sw 25  Angular Increment of B Axis
; sw 26  B axis angle at Tool Change
; sw 27  Tool Set X
; sw 28  Tool Set Y
; sw 29  Tool Set Z
; sw 30  Turret type 0=Indexing, 1=ATC
; sw 31  Index time per station
; sw 32  Move to ToolChange & Home Pivot  (0=about tip, 1=about pivot point)
; sw 33  Move Index
; sw 34  Move Angular, Feed, Rapid
; sw 35  B axis 0= interpolates, 1=indexing only
; sw 36  Turret rotates to face sub spindle 0= no, 1= yes
; sw 37  Turret Park X Main end (turn only)
; sw 38  Turret Park Y Main end (turn only)
; sw 39  Turret Park Z Main end (turn only)
; sw 40  Turret Park B Main end (turn only)
; sw 41  Turret Park X Sub end (turn only)
; sw 42  Turret Park Y Sub end (turn only)
; sw 43  Turret Park Z Sub end (turn only)
; sw 44  Turret Park B Sub end (turn only)
; sw 45  Turret Holder type for tool selection
;
; |  1     | 2| 3 | 4 | 5 | 6 | 7 | 8 | 9  | 10 | 11 |  12 | 13 |  14 | 15 | 16 | 17
**********************************************
* Setting up spindle defaults
**********************************************
; sw  1 Name  Main/Sub
; sw  2 ID
; sw  3 TurretId on which spindle is mounted [0,1 (-1 = n/a)]
;       For milling machines (single spindle) set to 0
; sw  4 Type (Driven 0, Main 1, Mounted 2 (not used yet), Sub 3)
; sw  5 MaxRpm
; sw  6 MaxAngFeed
; sw  7 Direction [0 CCLW,1 CLW]
; sw  8 MirrorOutput [0,1] 	(Not used yet)
; sw  9 CSS Capable [0,1] 	(Not used yet)
; sw 10 Rotation [None=0,A=1,B=2,C=3]  	(Not used yet)
; sw 11-13 Default Location [X,Y,Z] (X and Y should always be zero at present)
; sw 14 DefaultTurretId for control of speeds
; sw 15 HorsePower
; sw 16 DatumToChuckFace
; sw 17 RapidRate M/Min
; sw 18 Angular Increment C axis  	(Not used yet)
; sw 19 Spindle stop time         	(Not used yet)
; sw 20 Spindle acceleration time  	(Not used yet)
; MG Line
; No. Gears,Min1,Max1,UserMax1,Code,...........
; Spindle
;  1       2  3 4 5    6     7     10
;
;
;                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ User defined variables    ÃÄÄÄ
;                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
; USER DEFINED VARS
; Text strings are held in ptmach.txt for translation
* Code Generator Options
* Tapping Modifiers
* Longhand^No^Yes
* CRC Register
* Work Datum Override
* Tap Cycle Type^Floating^Rigid
* Tap CycleTap Cycle^Right Hand^Left Hand
*Chord    Enter chord length for arc splitting
*Full Canned Cycle
* High speed tolerance
* High Speed Mode^Off^On
* Coolant^Off^Flood^Mist
* Tool Length Offset
* Maximum Linear Separation
* Maximum Linear Separation
* Program stop options
;SPLINE_OUTPUT=1
MT=head one,60,0,800,800,0,800,800,0,0,0,0,0,-800,30000,1000,6,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,,,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1
MS=driven,0,0,0,2000,32,0,0,0,3,0,0,0,0,10,0,0,0
MG=1,100,2000,2000,41
Q210=_Separator=_lang894  [9,10,11,12,13,671,672]
Q206=_Separator=_lang895  [9,10,11,12,13,671,672]
Q205=_Check=_lang873 [9,10,11,12,13,671,672]
Q201=_real=_lang874 [29]
Q202=_real=_lang879 [15,43,48]
Q203=_list=_lang811 [9,10]
Q204=_list=_lang878 [9,10,11,12,13]
Q204=_real=_lang876 [102]
Q208=_Check=_lang877 [37]
Q203=_real=_lang899 [15,110]
Q208=_List=_lang898 [15,110]
Q205=_list=_lang900 [15]
Q203=_real=_lang901 [116]
Q400=_Check=_lang1179 [4002]
Q401=_real=_lang1180 [4002]
Q402=_list=_lang908 [40,41]
%ENDMACH

*
******************************************************************************************************
*	Gcodes                                            20                            30             35             40              45
%DATA1=0,1,2,3,4,0,0,0,-1,9,10,11,17,18,19,20,21,33,76,40,41,42,92,53,54,55,56,57,58,59,70,71,72,73,80,81,82,83,84,85,86,84.1,97,96,94,95,90,91,98,99,92,74,75,,,,,,,30,28,,141,40,,33,92,76,,97,96,18.1,18.2,18.3,18.9,18
*	Mcodes
%DATA2=0,1,2,5,3,4,6,7,8,9,17,11,12,13,14,15,16,17,18,19,30,31,32,33,34,35,36,37,38,80,81,23,24,98,99,41,42,43,44,0,0,0,53,54,,
*

*** End of include file A:\Pams\cam\machdef\template\mill-iso-mach-mm.cgi ***

** ISO uses a unique kt due to the Probing kt flags
*** Start of include file mill-iso-kt.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	mill-default-kt.cgi
*	Author:		RHA
*   Date:       11 November 2005
*
* New file for adaptive milling templates
*
* ISO uses exclusive KT file due to Probing flags
*
**************************************************************************
*   Change History
* Version 10.5
*          FIRST ISSUE
* 13/03/06 RHA DEV00016683 Alter horizontal machine width
* Version 11.75
* 23/04/07 RHA             Change gantry default size
* Version 2012.2
* 06/02/12 RHA W47500 Implement auxiliary Z axes
* Version 2015.2
* 07/01/15 GST W80110 Implement M&H Probing

**************************************************************************


; KT graphics definitions Metric
; Note that this data is not passed through to the Code Generator source file.

* Base=Height, Width, Length, Thickness

* Mount=Length,Width,Height   would be used in case of trunnion table
*lower mount would be used as the default mount
*side mount is for machines with a vertical mount
*saddle mount is for machines with a saddle


* Table=Length, Width, Height, Lead, Angle, Radius
* the line below is used for table in case of horizontal machines with B primary axis

* Head=Type,Length, Width, Height,Lead, Angle,Protrusion Length,Protrusion Width,Protrusion Ht,SpindleLocation

* Head=Type,Length, Width, Height,Protrusion Length,Protrusion Width,Protrusion Ht

* KTTILTTABLE Length, Width, Height, Lead, Angle, Radius

* cylinder KTROTUNIT Length, Radius

* KTSADDLE Length, Radius,thickness,width,height

* KT Chuck Type, Length,Diameter,Bore,JawLength,JawHeight,JawWidth,Protrusion,NoJaws,NoSteps

*KT ATC - Length Width Depth Lead Angle Diameter Protrusion


* Auxiliary Z axes



* Probing flags


; End of KT graphics definitions

*


*** End of include file A:\Pams\cam\machdef\template\mill-iso-kt.cgi ***
*** Start of include file mill-iso.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	mill-iso.cgi
*	Author:		RHA
*   Date:       11 November 2005
*
* New file for adaptive milling templates derived from earlier multiplane template
**************************************************************************
*   Change History
* Version 10.5
*          FIRST ISSUE
* 16/12/05 RHA DEV00015647 Add R in XY Only Option
* 31/01/06 RHA DEV00012212 Align code constructor trace text
* 06/02/06 RHA DEV00007742 Single helix option for Thread Mill
* 10/02/06 RHA DEV00016236 Spindle control fixes
* 14/02/06 RHA DEV00016311 Change index defaults
* 15/02/06 RHA DEV00016297 Incremental datum shift
* 20/02/06 RHA DEV00016344 Implement IJK vector for 5 axis cycle
* 24/02/06 RHA DEV00016420 Dwell token in peck drill codecon
* 27/02/06 RHA DEV00016236 Spindle control fixes
* 28/02/06 RHA DEV00016369 Fix Convert rapid to feed
* 01/03/06 RHA DEV00016487 Set modality of inex direction M code
* 02/03/06 RHA DEV00016511 G54 default format to be 2.2
* 07/03/06 RHA DEV00015555 High Speed mode tolerance, Reposition ZMOVE in Rapid codecon
* 07/03/06 RHA DEV00014230 Rotation axes range correction
* 14/03/06 RHA DEV00016367 Spindle control - add spindir to rapid codecon
* 15/03/06 RHA DEV00015533 Add format table entries for toolstore tokens
* 15/03/06 RHA DEV00015655 Add GEARMCODE token to hole cycles
* 21/03/06 RHA DEV00007321 Correct Datum setting - limits
* Version 10.75
* 12/04/06 RHA DEV00010822 Designate logical tokens by colour
* 12/04/06 RHA DEV00016781 Document use of UARRAY1 in template
* 12/04/06 RHA DEV00016809 Colour code tokens
* 20/04/06 RHA DEV00016925 Add PLANEGCODE to Rapid After ToolChange
* 22/05/06 RHA DEV00017232 Add FEEDMODEGCODE for Inverse Time Feeds
* Version 11.0
* 25/07/06 RHA DEV00016799 Remove force output in Rapid After ToolChange
* 26/07/06 RHA DEV00017767 Correct g98g99 terminology - all amachines
* 01/08/06 RHA DEV00017818 Hole cycle clearance and level options
* 01/08/06 RHA DEV00017490 Make spindle start warning optional
* 03/08/06 RHA DEV00017814 Add WORKGCODE token to Rapid Home & Rapid TC
* 04/08/06 RHA DEV00017771 Number of turns token for ISO
* 24/08/06 RHA DEV00017771 Suppress P0 in helix
* Version 11.5
* 20/09/06 RHA DEV00017909 Expand trace options
* 26/10/06 RHA DEV00018471 HPCC improvements
* 03/11/06 RHA DEV00018471 ToolChange HPCC call should only be via a token
* 21/12/06 RHA DEV00018873 Call 5 axis off at end if still active
* 04/01/07 RHA DEV00018873 5 Axis cancel, correct for 3 axis machines
* 08/01/07 RHA DEV00018930 Make ZSAFE value available as a token for hole cycles
* 07/02/07 RHA DEV00018471 Correct Highspeed output in CORE TC
* 07/02/07 RHA DEV00018873 try again
* Version 11.75
* 30/04/07 RHA DEV00019883 Tokens etc for Euler angles in Index output
* 14/05/07 RHA DEV00019985 Tokens for XINC etc.
* 24/05/07 RHA DEV00019981 Orthogonal plane cycle controls
* 29/05/07 RHA DEV00019981 Force longhand holes in mc coords
* Version 12.00
* 09/08/07 RHA DEV00020648 Implement pitch suppression in ISO mill
* 10/08/07 RHA DEV00020285 Add new ISO Datum Shift Tokens
* 25/09/07 RHA DEV00021119 Add setvars and tokens for pivot mode control
* 27/09/07 RHA DEV00021119 Give pivot code its own format entry
* Version 12.25
* 03/12/07 RHA DEV00021534 Enable longhand tapping
* Version 12.50
* 17/01/08 RHA DEV00022021 Incremental option for Z Clear
* 04/02/08 RHA DEV00016982 Make tool user tokens available in tool set up
* 18/02/08 RHA DEV00022063 Fix single helix and tidy call structure
* Version 2009.1
* 14/04/08 RHA DEV00023113 Feed after ToolChange code constructor added
* 08/05/08 RHA DEV00020490 Add new hole depth option. Incremental from Retract
* 06/08/08 RHA DEV00024310 Back bore and face in milling
* 06/08/08 RHA DEV00023786 Add tool group and ID tokens
* 07/08/08 RHA DEV00023786 Format table entries for Tooling tokens
* 11/08/08 RHA DEV00024364 Implement helical hole cycles
* 20/08/08 RHA DEV00024474 Add Feed Type setting to toolchange
* 26/08/08 GST DEV00022751 Thread mill depth in canned cycle, RHA-added set variables
* 26/08/08 RHA DEV00021410 Thread mill token values
* 28/08/08 RHA DEV00023797 Add tool token and remove chamfer angle restriction
* 11/09/08 RHA DEV00024662 Fix ASIN error in thread mill canned cycle
* 11/09/08 RHA DEV00024504 Probing format table
* 16/09/08 RHA DEV00024824 Format helical tokens with decimal part
* 16/09/08 RHA DEV00024845 Remove duplicate token from back bore
* 24/09/08 RHA DEV00024504 Format table changes requested
* 24/09/08 RHA DEV00024855 Correct spindle direction in back bore longhand
* 01/10/08 RHA DEV00024310 Add format Table entries for back bore
* Version 2009.2
* 24/10/08 RHA DEV00025000 Allow Rapid after tool change with null move
* 07/11/08 RHA DEV00025098 Make tool angle available in setup & core tool change
* 14/11/08 RHA DEV00024851 Counter bore depth token corrections
* 07/01/09 RHA DEV00025831 Add token for holdertype
* 09/01/09 RHA DEV00024568 Make Tool Unit available in toolchange. Set variable on token
* 06/03/09 RHA DEV00026198 Use Job data instead of ASK questions
* 17/03/09 RHA DEV00026452 Changes for 3D Z with TLO application
* Version 2010.1
* 25/06/09 RHA WI34681 Correction to Home and ToolChange tokens
* 08/07/09 RHA WI34873 New Thread Mill - Restructure existing canned cycle
* 09/07/09 RHA WI34873 New Thread Mill - Add new code options
* 15/07/09 RHA WI34964 5 Axis IJK vectors should have format default 1.6
* 20/07/09 RHA WI34873 Fix Internal/External codes
* 22/07/09 RHA WI34873 Add Thread Mill token format refs
* 23/07/09 RHA WI34873 Clarify option for Threaded Depth Sign
* 23/07/09 RHA WI35139 Remove duplicate variable declarations
* 29/07/09 RHA WI34873 Add signed absolute option for depth
* 05/08/09 RHA WI35305 Add Probing mode control tokens etc
* 05/08/09 RHA WI34754 Make call to Feed Type code constructor optional in toolchange
* 06/08/09 RHA WI35307 Add code con and option for manual toolchange, tidy safe block
* 07/08/09 RHA WI34873 Fix Format entry for T-MILL-MODE
* 19/08/09 RHA W35537 Add Lead and Starts tokens for thread mill
* 20/08/09 RHA W35450 Add tokens for coordinate rotation to sub call
* 25/08/09 RHA W35537 Add TEXT for Starts in old cycle
* 09/09/09 RHA W35307 Manual toolchange and tokens for angled head
* 15/09/09 RHA W35307 Set values for tool angle (angled head) tokens etc
* 17/09/09 RHA W35307 System variables renamed HEADANGLE MOUNTANGLE
* 17/09/09 RHA W35307 Improve token availability
* Version 2010.1 SP1
* 13/10/09 RHA W36119 Remove [RELIEFDIR] [RELIEFDIST] from back face cycle
* 13/10/09 RHA W36121 [RELIEFDIR] token has no value
* 13/10/09 RHA W33257 Make Through Coolant token more widely available
* 13/10/09 RHA W36415 Allow TNC TOOLCALL when #MOVE=0   PT_INDEX_HANDLER
* 14/10/09 RHA W33489 Default coords, feeds, speeds etc to 5 digits before decimal
* 15/10/09 RHA W33119 Correct ZLEVEL modality setting
* Version 2010.2
* 13/11/09 RHA W36665 Correct action of planar rotate on rotary angles
* 20/11/09 RHA W36755 Make #MOVE diagnostic available in 3 axis CGDs
* 11/12/09 RHA W36903 Add "Ask Once" to the NC Stlyes > Interactive Startup options
* 17/12/09 RHA W37043 Shorten PITCH and LEAD note for Thread mill
* 04/01/10 RHA W32567 Implement G28 Moves to Home etc. ISO Template
* 15/01/10 RHA W37297 Add Single Shot option for Exact Stop
* 26/01/10 RHA W37441 Make new hole depth variable modal
* 26/01/10 RHA W37512 set chipbreak cycle depth to output now
* 26/01/10 RHA W37512 set chipbreak cycle depth to output now - all mc configurations
* 12/03/10 RHA W38140 Add ZMOVE to hole cycle and cycle points default output
* 31/03/10 RHA W38513 Activate canned cycle switches for orthogonal planes
* Version 2011.1
* 02/07/10 RHA W38284 Add Reset_Spindle token to toolchange
* 15/07/10 RHA W39785 Implement tap type setting at toolchange
* 16/08/10 RHA W39553 Control allowable chamfer for helical hole cycle
* 24/08/10 RHA W33388 Add more tokens to Program Stop
* 16/09/10 RHA W31859 Improve use of hole clearance on approach
* 21/09/10 RHA W40898 Refresh CPL variable when datum selecting
* 27/09/10 RHA W40898 Allow for no index condition
* 29/09/10 RHA W40981 Correct incremental datum setting (W40898 error)
* Version 2011.2
* 26/10/10 RHA W41396 Use MAXFEED for Rapid conversion
* 28/10/10 RHA W32074 Fix #XSHIFT etc.
* 29/10/10 RHA W38135 Alternative incremental datum base
* 03/12/10 RHA W41396 Clarify NCStyle description text
* 10/12/10 RHA W38043 Mill TNC and others - support feed type
* 16/12/10 RHA W41997 Implement peck tapping
* 20/12/10 RHA W31156 Rotary Sin=direction and angle option (+-360)
* 22/12/10 RHA W41738 New option - Always use IJK with 360deg arcs
* 11/01/11 RHA W42393 New Option - Control for negative radius when angle>180
* 19/11/11 RHA W38043 Corrections & add thread mill cycle option
* 14/02/11 RHA W42352 Separate clamping for secondary rotary axis
* 22/02/11 RHA W42941 Re-organise Notes section & add macro number details
* 23/02/11 RHA W42848 Make #USERAD options more descriptive
* 28/02/11 RHA W42352 Separate clamping for secondary rotary axis
* 28/03/11 RHA W31156 Initialise rotary direction for #ROTTYPE=4
* Version 2012.1
* 06/07/11 RHA W44708 Add Thread Mill tokens
* 22/06/11 RHA W42241 Selective threadmill canned cycles
* 28/07/11 RHA W43985 Implement feedrate multiplier
* 03/08/11 RHA W42241 Move taper thread check onto Thread Mill tab
* 10/08/11 RHA W42871 Make use of NEXTSPEED optional
* 19/12/11 RHA W47452 Change #ROTTYPE=4 initialisation
* 21/12/11 RHA W47111 Force GCode after Dwell
* Version 2012.2
* 19/01/12 RHA W45710 Force Index token on first toolchange
* 31/01/12 RHA W47500 Implement auxiliary Z axes
* 15/02/12 RHA W47500 Various minor fixes
* 22/02/12 RHA W48595 Make PLANEGCODE more robust
* 14/03/12 RHA W49403 Implement Quill Retract function
* 15/03/12 RHA W49473 Option for W (quill) move to be tool tip
* 15/03/12 RHA W49072 Add quill tokens [QUILL_BLOCK] [QUILLMOVE] to drilling code constructors.
* 20/03/12 RHA W49473 Option for W (quill) move to be tool tip QUILL
* 20/03/12 RHA W49072 More Quill tokens for drilling code constructors.
* 27/03/12 RHA W49627 Quills - add clamp / unclamp codes
* 03/04/12 RHA W49857 Add modality options for Quill Hole Cycles
* 18/03/12 RHA W49403 Implement Quill Retract function
* Version 2013.1
* 31/05/12 RHA W48878 Phantom warnings from Subroutines
* 30/08/12 RHA W43286 Support peck tapping via cycle point calls
* 11/09/12 RHA W43286 Remove #USER1
* 13/09/12 RHA W43286 Fix for multi-depth etc
* 03/10/12 RHA W31018 Correct CPL tool tip option for Rapid to Tool Change
* 16/10/12 RHA W43286 Fix peck tapping via cycle point calls
* 29/10/12 RHA W53736 Fix peck tapping for negative cut increment
* Version 2013.2
* 14/11/12 RHA W31861 Assess CGX for milling, Implement for ISO
* 15/03/13 GST W56083 Add [nMOVE] tokens to Coordinate Rotation code constructor
* 20/03/13 GST W31039 Implement new coolant system - fase 1
* 20/03/13 GST W55128 Implement Rotary Axial interpolation
* 20/03/12 GST W54195 Create tokens for NEXT tool parameters
* 20/03/13 GST W55128 Implement Rotary Axial interpolation - second batch
* 21/03/13 GST W55128 Implement Rotary Axial interpolation - third batch
* 21/03/13 GST W54191 Force feed for tapping - floating and rigid choice
* 22/03/13 GST W31039 Implement new coolant system - fase 2
* 27/03/13 GST W55128 Implement Rotary Axial interpolation - allow arcs
* 28/03/13 GST W31039 Implement new coolant system - make autocool override optional
* 23/05/13 GST W56952 Add Dwell Time to allow spindle to change speed
* Version 2014.1
* 22/07/13 GST W55730 Implement rotary precision
* 22/07/13 GST W57644 Add Rotary axis tokens to Set Work Datums
* 07/08/13 GST W49799 Allow output of datum override in Set Work Datums
* 27/08/13 GST W43623 BackBore/Face cycle points option
* 04/09/13 GST W59852 Add support for Dynamic Offset
* 09/10/13 GST W59433 Add support for 3D compensation
* 14/10/13 GST W60594 Allow CRC off on rapid retracts
* Version 2014.2
* 24/02/14 GST W62726 Implement Turning on milling machines
* 25/02/14 GST W62726 Move turning specifics to dedicated files
* 25/05/14 GST W62726 Create turning specific RAT
* 06/03/14 GST W62726 Various corrections and new tokens
* 07/03/14 GST W62726 Add feed type for turning
* 11/03/14 GST W62726 Create Cancel-CSS token
* 13/03/14 GST W63762 Add breakout call to Start and End
* Version 2015.1
* 09/07/14 GST W64574 Add Integrex ID conversion
* 10/07/14 GST W62726 Assign milling mode to CANCEL-TURN-MODE
* 30/07/14 GST W32318 Implement -+360 angular range
* 30/07/14 GST W64059 Add Force XYZ to 3x posts
* 04/08/14 GST W65629 Fix direction assignment
* 11/08/14 GST W64177 New codes for angular direction
* 26/08/14 GST W62726 Add XZ tool length tokens to tooling list
* 29/08/14 GST W67146 Implement move to TC/Home variations for ToM
* 03/09/14 GST W67146 Assign correct modes at MtTc
* Version 2015.2
* 10/12/14 GST W66367 Reestructure
* 16/12/14 GST W79582 Add MAXRPM to Turn RAT and TC
* 07/01/15 ATA W80879 Code Wizard - Consistency in IJK Arc Centre options (replicated in milling)
* 07/01/15 GST W80110 Implement M&H Probing
* 19/01/15 ATA W63186 Code Wizard - "Force feed output at start" to be checked by default
* 20/01/15 ATA W59919 Templates Mill ISO - Correct code con debug for Spindle End
* 21/01/15 GST W80110 Separate M&H & Renishaw at tokens/formats levels
* 22/01/15 ATA W62982 Templates Mill - create modality options for back bore / face parameters
* 05/02/15 GST W80347 Implement support for Simultaneous indexing
* 10/02/15 GST W32377 Printing function for Renishaw
* 11/02/15 GST W81600 Implement Program Stop on Move to Home/TC
* Version 2016.1
* 16/06/15 GST W83495 Allow thread turn on YZ plane
* 16/06/15 GST W83540 Add missing X Taper Thread Parameters
* 27/07/15 GST ECAM-2343 Implement Angle at Toolchange
*
**************************************************************************

%PROCEDURE=NC_Style
*
*						*************************************************************
*						*	Template Dependant Language extensions for Code Wizard	*
*						*************************************************************
*************************************************
*	Tab Name 	:	General G-Codes
*************************************************
;Setvar^DATA1(!RAPIDGCODE)^0^<1>G-Codes^REAL^<2>Rapid Traverse^-1
;Setvar^DATA1(!FEEDGCODE)^1^<1>G-Codes^REAL^<3>Linear Interpolation^-1

;Setvar^DATA1(!CIRCGCODE)^2^<1>G-Codes^REAL^<4>Circular Interpolation (CLW)^-1
;Setvar^DATA1(!CIRCGCODE+1)^3^<1>G-Codes^REAL^<5>Circular Interpolation (CCLW)^-1

;Setvar^DATA1(!DWELLGCODE)^4^<1>G-Codes^REAL^<6>Dwell^-1

;Setvar^DATA1(!EXACTGCODE)^9^<1>G-Codes^REAL^<7>Exact Stop^-1
;Setvar^DATA1(!EXACTGCODE-1)^#FUNNY^<1>G-Codes^REAL^<1774>Exact Stop Cancel^-1

;Setvar^DATA1(!PLANEGCODE)^17^<1>G-Codes^REAL^<513>XY Plane^-1
;Setvar^DATA1(!PLANEGCODE+1)^18^<1>G-Codes^REAL^<514>XZ Plane^-1
;Setvar^DATA1(!PLANEGCODE+2)^19^<1>G-Codes^REAL^<515>YZ Plane^-1

;Setvar^DATA1(!UNITSGCODE)^20^<1>G-Codes^REAL^<1621>Inch^-1
;Setvar^DATA1(!UNITSGCODE+1)^21^<1>G-Codes^REAL^<9>Metric^-1

;Setvar^DATA1(!COMPGCODE)^40^<1>G-Codes^REAL^<516>Cutter Compensation (Off)^-1
;Setvar^DATA1(!COMPGCODE+1)^41^<1>G-Codes^REAL^<517>Cutter Compensation (Left)^-1
;Setvar^DATA1(!COMPGCODE+2)^42^<1>G-Codes^REAL^<518>Cutter Compensation (Right)^-1

;Setvar^DATA1(!3DCOMPGCODE)^141^<1>G-Codes^REAL^<4409>3D Cutter Compensation (On)^-1
;Setvar^DATA1(!3DCOMPGCODE+1)^40^<1>G-Codes^REAL^<4410>3D Cutter Compensation (Off)^-1

;Setvar^DATA1(!ABSINCRGCODE)^90^<1>G-Codes^REAL^<13>Absolute Coordinates^-1
;Setvar^DATA1(!ABSINCRGCODE+1)^91^<1>G-Codes^REAL^<14>Incremental Coordinates^-1

;Setvar^DATA1(!FEEDMODEGCODE)^94^<1>G-Codes^REAL^<15>Feed / Minute^-1
;Setvar^DATA1(!FEEDMODEGCODE+1)^95^<1>G-Codes^REAL^<16>Feed / Revolution^-1

;Setvar^DATA1(!RAPHOMEGCODE)^30^<1>G-Codes^REAL^<3936>Home Ref Point Code^-1
;Setvar^DATA1(!RAPTCGCODE)^28^<1>G-Codes^REAL^<3937>ToolChange Ref Point Code^-1


*************************************************
*	Tab Name 	:	Hole Cycle G-Codes
*************************************************
;Setvar^DATA1(!DRILLGCODE)^80^<26>Hole Cycle G-Codes^REAL^<519>Cancel Canned Cycle^-1
;Setvar^DATA1(!DRILLGCODE+1)^81^<26>Hole Cycle G-Codes^REAL^<27>Drill Cycle^-1
;Setvar^DATA1(!DRILLGCODE+2)^82^<26>Hole Cycle G-Codes^REAL^<520>Counterbore Cycle^-1
;Setvar^DATA1(!DRILLGCODE+3)^83^<26>Hole Cycle G-Codes^REAL^<99>Peck Drill Cycle^-1
;Setvar^DATA1(!DRILLGCODE+4)^84^<26>Hole Cycle G-Codes^REAL^<521>Tapping Cycle (Right Hand)^-1
;Setvar^DATA1(!DRILLGCODE+7)^84.1^<26>Hole Cycle G-Codes^REAL^<522>Tapping Cycle (Left Hand)^-1
;Setvar^DATA1(!DRILLGCODE+5)^85^<26>Hole Cycle G-Codes^REAL^<102>Ream / Bore Cycle^-1
;Setvar^DATA1(!DRILLGCODE+6)^86^<26>Hole Cycle G-Codes^REAL^<104>Bore Cycle^-1
;Setvar^DATA1(!CHIPBREAKGCODE)^73^<26>Hole Cycle G-Codes^REAL^<108>Chipbreak Drill Cycle^-1
;Setvar^DATA1(!RETRACTGCODE)^98^<26>Hole Cycle G-Codes^REAL^<523>Return to Initial level^-1
;Setvar^DATA1(!RETRACTGCODE+1)^99^<26>Hole Cycle G-Codes^REAL^<524>Return to Rplane^-1


*************************************************
*	Tab Name 	:	Datum G-Codes
*************************************************

* Setvar^DATA1(25)^54^Datum G-Codes^REAL^Work Coord System 1
* Setvar^DATA1(26)^55^Datum G-Codes^REAL^Work Coord System 2
* Setvar^DATA1(27)^56^Datum G-Codes^REAL^Work Coord System 3
* Setvar^DATA1(28)^57^Datum G-Codes^REAL^Work Coord System 4
* Setvar^DATA1(29)^58^Datum G-Codes^REAL^Work Coord System 5
* Setvar^DATA1(30)^59^Datum G-Codes^REAL^Work Coord System 6

********************************************
*	Tab Name 	:		M-Codes
********************************************

;Setvar^DATA2(!STOPMCODE)^0^<44>M-Codes^REAL^<45>Program Stop^-1
;Setvar^DATA2(!STOPMCODE+1)^1^<44>M-Codes^REAL^<46>Optional Stop^-1

;Setvar^DATA2(!SPINMCODE+1)^3^<44>M-Codes^REAL^<47>Spindle CLW^-1
;Setvar^DATA2(!SPINMCODE+2)^4^<44>M-Codes^REAL^<48>Spindle CCLW^-1
;Setvar^DATA2(!SPINCOOLMCODE)^13^<44>M-Codes^REAL^<50>Spindle CLW with coolant^-1
;Setvar^DATA2(!SPINCOOLMCODE+1)^14^<44>M-Codes^REAL^<51>Spindle CCLW with coolant^-1
;Setvar^DATA2(!SPINMCODE)^5^<44>M-Codes^REAL^<49>Spindle Stop^-1

;Setvar^DATA2(!COOLMCODE)^7^<44>M-Codes^REAL^<52>Coolant Flood^-1
;Setvar^DATA2(!COOLMCODE+1)^8^<44>M-Codes^REAL^<53>Coolant Mist^-1
;Setvar^DATA2(!COOLMCODE+2)^9^<44>M-Codes^REAL^<54>Coolant Off^-1
;Setvar^DATA2(!COOLMCODE+3)^17^<44>M-Codes^REAL^<4339>Coolant Air^-1

;Setvar^DATA2(!SUBPROGMCODE)^98^<44>M-Codes^REAL^<69>Subprogram Call^-1
;Setvar^DATA2(!SUBPROGMCODE+1)^99^<44>M-Codes^REAL^<70>Subprogram End^-1



%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 51  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=START
#MACRO=51
#EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

$MACHINE=ISO

;Setvar^#MCODECPL^#FUNNY^<44>M-Codes^REAL^<2864>CPL Coordinates Code^-1
#MCODECPL=#FUNNY
%IF #MCODECPL<0 %THEN #MCODECPL=#FUNNY
;Setvar^#MCODEMC^#FUNNY^<44>M-Codes^REAL^<2865>M/C Coordinates Code^-1
#MCODEMC=#FUNNY
%IF #MCODEMC<0 %THEN #MCODECPL=#FUNNY

;Setvar^#THROUGHTOOL1ON^26^<44>M-Codes^REAL^<1824>Through Tool Coolant^-1
#THROUGHTOOL1ON=26
;Setvar^#THROUGHTOOL1OFF^27^<44>M-Codes^REAL^<2125>Through Tool Coolant Off^-1
#THROUGHTOOL1OFF=27
;Setvar^#THROUGHTOOL1HIGH^28^<44>M-Codes^REAL^<4340>Through Tool Coolant High^-1
#THROUGHTOOL1HIGH=28




*************************************************
*	Tab Name 	:	More Hole Cycle G-Codes
*************************************************
;Setvar^#BBGCODE^#FUNNY^<26>Hole Cycle G-Codes^REAL^<3557>Back Bore Cycle^-1
#BBGCODE=#FUNNY
;Setvar^#BFGCODE^#FUNNY^<26>Hole Cycle G-Codes^REAL^<3558>Back Face Cycle^-1
#BFGCODE=#FUNNY
;Setvar^#HEGCODE^#FUNNY^<26>Hole Cycle G-Codes^REAL^<3584>Helical Hole Cycle^-1
#HEGCODE=#FUNNY

;Setvar^#FORCEAFTERDWELL^0^<1>G-Codes^YESNO^<4193>Force G Code After Dwell^-1
#FORCEAFTERDWELL=0

*************************************************
*	Tab Name 	:		Coolant Control
*************************************************
;Setvar^#AUTOCOOL^0^<531>Coolant Control^LIST^<2774>Switch Coolant Automatically^0^<4351>^Disabled^Enabled^Enabled with override^^-1
#AUTOCOOL=0
;Setvar^#COMINED^0^<531>Coolant Control^YESNO^<2867>Allow Combined Coolant Spindle M Codes^-1
#COMINED=0

*************************************************
*	Tab Name 	:		New Datum Setting
*************************************************
;Setvar^#UNIQUEDATUMS^1^<2868>Datum Setting^YESNO^<873>Use Unique Co-ordinate System / Index^-1
#UNIQUEDATUMS=1
;Setvar^DATA1(!WORKGCODE)^53^<2868>Datum Setting^REAL^<36>Machine Coord System^-1

;Setvar^DATA1(!PRESETGCODE)^92^<2868>Datum Setting^REAL^<525>Max Rpm / Preset Registers^-1
;Setvar^DATA1(!SETTOOLGCODE)^10^<2868>Datum Setting^REAL^<43>Set Tool Data^-1

;Setvar^#DATUMSTART^1^<2868>Datum Setting^REAL^<2869>Number of First Absolute Datum^-1
#DATUMSTART=1
;Setvar^#DATUMINCR^1^<2868>Datum Setting^REAL^<2870>Datum Increment^-1
#DATUMINCR=1

;Setvar^#DATUMMAX^50^<2868>Datum Setting^REAL^<2871>Datum Maximum Value^-1
#DATUMMAX=50
;Setvar^#BASETYPE^0^<2868>Datum Setting^LIST^<1770>Incremental Datum Shift^0^<4076>^From Current Datum^From Initial Datum^^-1
#BASETYPE=0

;Setvar^$ABSDATUM^L2^<2868>Datum Setting^STRING^<4411>Absolute Datum Description^-1
$ABSDATUM=L2
;Setvar^$DYNAMIC^L21^<2868>Datum Setting^STRING^<4412>Dynamic Datum Description^-1
$DYNAMIC=L21

;Setvar^#FORCEXYZ^0^<2868>Datum Setting^YESNO^<1718>Force XYZ Output after Index^-1
#FORCEXYZ=0




*************************************************
*	Tab Name 	:		NC File General			*
*************************************************
;Setvar^NUMBLOCKS^#FUNNY^<383>NC File General^INT^<558>Max Program Size (Blocks)^-1
NUMBLOCKS=#FUNNY
;Setvar^NUMCHARS^#FUNNY^<383>NC File General^INT^<559>Max Program Size (Characters)^-1
NUMCHARS=#FUNNY
;Setvar^#LEADER^#FUNNY^<383>NC File General^INT^<386>Punch Tape Leader (Nulls)^-1
#LEADER=#FUNNY

;Setvar^#INCHINCR^0.0001^<383>NC File General^REAL^<387>Minimum movement Inches^-1
#INCHINCR=0.0001
;Setvar^#MMINCR^0.001^<383>NC File General^REAL^<388>Minimum movement millimetres^-1
#MMINCR=0.001
;Setvar^#ANGINCR^0.001^<383>NC File General^REAL^<4355>Minimum angular movement^-1
#ANGINCR=0.001


;Setvar^#INCRXYZ^0^<383>NC File General^LIST^<389>Coordinate Mode^0^<1552>^Absolute^Incremental^Run Time Switch^^-1
#INCRXYZ=0


;Setvar^#XREVERSE^0^<383>NC File General^YESNO^<391>Reverse X Axis^-1
#XREVERSE=0
;Setvar^#YREVERSE^0^<383>NC File General^YESNO^<560>Reverse Y Axis^-1
#YREVERSE=0
;Setvar^#ZREVERSE^0^<383>NC File General^YESNO^<561>Reverse Z Axis^-1
#ZREVERSE=0
;Setvar^#TLOCOMP^0^<383>NC File General^YESNO^<562>Compensate Z for Tool Gauge Length^-1
#TLOCOMP=0

;Setvar^#SPINBLOCK^0^<383>NC File General^YESNO^<1675>Output Speed Change on Separate Block^-1
#SPINBLOCK=0


;Setvar^#DWELLTIME^1000^<383>NC File General^INT^<4354>RPM change per second - Dwell^-1
#DWELLTIME=1000
;Setvar^TEXTCASE^0^<383>NC File General^LIST^<1797>Text Case Output^0^<1798>^Leave as Input^Force UPPER case^Force lower case^^-1
TEXTCASE=0
;Setvar^#QUESTION^2^<383>NC File General^LIST^<3773>Interactive Startup^1^<3907>^Always Ask^Ask if Not Set^Never Ask^Ask Once^^-1
#QUESTION=2

****************************************************************
*   Tab Name    :      Setup Sheet
****************************************************************
;Setvar^#TOOLSHEET^3^<1714>Set Up Sheet^LIST^<393>Output Set-up Sheet^1^<784>^With NC program^Separate File^None^^-1
#TOOLSHEET=3
;Setvar^$NAME^Setup^<1714>Set Up Sheet^STRING^<394>Set-Up / Tooling Sheet Append Name^-1
$NAME=Setup
;Setvar^#SETUPHEAD^0^<1714>Set Up Sheet^YESNO^<1715>Output Setup Header / Trailer^-1
#SETUPHEAD=0
;Setvar^#REMOVEDUPLICATES^0^<1714>Set Up Sheet^YESNO^<783>Suppress Duplicate Tools (Tooling Sheet / List)^-1
#REMOVEDUPLICATES=0

*************************************************
*	Tab Name 	:		Block Numbers
*************************************************
;Setvar^#BNUM^5^<397>Block Numbers^INT^<325>Block Number Start^-1
#BNUM=5
;Setvar^#BNUMINC^5^<397>Block Numbers^INT^<398>Block Number Increment^-1
#BNUMINC=5
;Setvar^#USEBNUM^1^<397>Block Numbers^YESNO^<399>Output Block Numbers^-1
#USEBNUM=1
;Setvar^#MAXTMP^0^<397>Block Numbers^INT^<1392>Max Block Number (If reset required)^-1
#MAXTMP=0
%IF #USEBNUM=0 @NOMAX
%IF #MAXTMP>0 %THEN #USEBNUM=#MAXTMP ; Reset level for numbering
@NOMAX
;Setvar^#ONLYSBNUM^0^<397>Block Numbers^YESNO^<400>Output Safe/Toolchange Block Numbers only^-1
#ONLYSBNUM=0
;Setvar^#SBNUMPOSITION^0^<397>Block Numbers^YESNO^<401>Safe/Toolchange Block Numbers as Tool Position^-1
#SBNUMPOSITION=0
;Setvar^#RESTARTSUBSBNUM^1^<397>Block Numbers^YESNO^<402>Restart Block Numbering in Sub Programs^-1
#RESTARTSUBSBNUM=1

*************************************************
*	Tab Name 	:		Feed Moves
*************************************************
;Setvar^#FTYPEMILL^0^<3775>Feed Moves^LIST^<4077>Feed Type - Milling^0^<3777>^Unchanged^Force Feed per Rev^Force Feed per Min^^-1
#FTYPEMILL=0
;Setvar^#FTYPEDRILL^0^<3775>Feed Moves^LIST^<4078>Feed Type - Drill Cycles^0^<3777>^Unchanged^Force Feed per Rev^Force Feed per Min^^-1
#FTYPEDRILL=0
;Setvar^#FTYPETAP^0^<3775>Feed Moves^LIST^<4341>Feed Type - Floating Tap Cycles^0^<3777>^Unchanged^Force Feed per Rev^Force Feed per Min^^-1
#FTYPETAP=0
;Setvar^#FTYPETAPRIG^3^<3775>Feed Moves^LIST^<4342>Feed Type - Rigid Tap Cycles^0^<4343>^Unchanged^Force Feed per Rev^Force Feed per Min^As Floating^^-1
#FTYPETAPRIG=3
;Setvar^#FTYPETHRD^0^<3775>Feed Moves^LIST^<4080>Feed Type - Thread Mill Cycles^0^<3777>^Unchanged^Force Feed per Rev^Force Feed per Min^^-1
#FTYPETHRD=0
;Setvar^#FTYPEBORE^0^<3775>Feed Moves^LIST^<4081>Feed Type - Bore Cycles^0^<3777>^Unchanged^Force Feed per Rev^Force Feed per Min^^-1
#FTYPEBORE=0


;Setvar^#EXACTMODE^1^<3775>Feed Moves^LIST^<3908>Exact Stop Mode^0^<3909>^Single Shot^Modal^^-1
#EXACTMODE=1

;Setvar^#TIMESFPR^1^<3775>Feed Moves^REAL^<4168>Feed Per Rev Multiplier^-1
#TIMESFPR=1
;Setvar^#TIMESFPM^1^<3775>Feed Moves^REAL^<4169>Feed Per Min Multiplier^-1
#TIMESFPM=1

*************************************************
*	Tab Name 	:		Rapid Traverse
*************************************************
;Setvar^#FEEDRAPIDS^0^<2>Rapid Traverse^YESNO^<403>Convert All Rapids to Feedmoves at Highfeed^-1
#FEEDRAPIDS=0
;Setvar^#USEMAXFEED^0^<2>Rapid Traverse^YESNO^<4082>Use Sequence Max High Feed^-1
#USEMAXFEED=0
;Setvar^#RAPDIST^0^<2>Rapid Traverse^REAL^<405>Convert to Feedmoves if less than ..^-1
#RAPDIST=0
;Setvar^#LOOKAHEAD^1^<2>Rapid Traverse^LIST^<4170>Lookahead for Speed^0^<4171>^Never^All Rapids^Last Rapid^^-1
#LOOKAHEAD=1

*************************************************
*	Tab Name 	:		Circular Interpolation
*************************************************
;Setvar^CIRCLE^0^<406>Circular Interpolation^YESNO^<567>Single Quadrant Interpolation^-1
CIRCLE=0
;Setvar^#NEGRAD180^1^<406>Circular Interpolation^YESNO^<4083>Negate Radius For Angle Above 180^-1
#NEGRAD180=1
;Setvar^#ARCTYPE^1^<406>Circular Interpolation^LIST^<407>Arc Centre type when IJK^1^<4507>^Signed Start-Centre^Signed Centre-Start^Unsigned Start-Centre^Centre^^-1
#ARCTYPE=1
;Setvar^#USERADS^0^<406>Circular Interpolation^LIST^<2872>Use Radius^0^<4084>^Never^Except 360 or Helical^XY Plane Except 360 or Helical^Always^Except 360^^-1
#USERADS=0
;Setvar^#FULLARCXYZ^0^<406>Circular Interpolation^YESNO^<2119>Force XYZ Output on Full Circle^-1
#FULLARCXYZ=0
;Setvar^#ADJARCFEED^1^<406>Circular Interpolation^YESNO^<568>Adjust Feedrate to Side of tool^-1
#ADJARCFEED=1
;Setvar^#G18SWAP^0^<406>Circular Interpolation^YESNO^<914>Reverse CLW/CCLW codes for XZ plane^-1
#G18SWAP=0
;Setvar^#G19SWAP^0^<406>Circular Interpolation^YESNO^<915>Reverse CLW/CCLW codes for YZ plane^-1
#G19SWAP=0
;Setvar^#MINFEEDADJ^25^<406>Circular Interpolation^INT^<569>Adjust Feedrate Maximum Decrease (%)^-1
#MINFEEDADJ=25
;Setvar^#MAXFEEDADJ^25^<406>Circular Interpolation^INT^<570>Adjust Feedrate Maximum Increase (%)^-1
#MAXFEEDADJ=25
;Setvar^#NOPITCH^1^<406>Circular Interpolation^YESNO^<2372>Suppress Pitch in Helical Moves^-1
#NOPITCH=1

*************************************************
*	Tab Name 	:		Cutter Compensation
*************************************************
;Setvar^#REGOFFSET^#FUNNY^<411>Cutter Compensation^REAL^<571>Start Register Numbering at ...^-1
#REGOFFSET=#FUNNY
;Setvar^#AUTOREG^1^<411>Cutter Compensation^LIST^<1808>CRC Register Number^1^<967>^Max Tools + Turret Position^Turret Position^Max Tools + Tool Count^^-1
#AUTOREG=1
;Setvar^#WARNCRC^0^<411>Cutter Compensation^YESNO^<413>Warn if Cutter Compensation used^-1
#WARNCRC=0
;Setvar^#WARNCRC90^0^<411>Cutter Compensation^YESNO^<414>Warn if Lead In not at 90 degrees^-1
#WARNCRC90=0
;Setvar^#CRCONZ2^0^<411>Cutter Compensation^YESNO^<1809>Warn if CRC applied on ramp^-1
#CRCONZ2=0
;Setvar^#CRCONZ1^0^<411>Cutter Compensation^YESNO^<1810>Warn if CRC Cancelled with Z move^-1
#CRCONZ1=0
;Setvar^#WARNCRCARC^1^<411>Cutter Compensation^YESNO^<1653>Warn if CRC changes on arc move^-1
#WARNCRCARC=1
;Setvar^#AUTOTLO^2^<411>Cutter Compensation^LIST^<1811>TLO Register Number^1^<967>^Max Tools + Turret Position^Turret Position^Max Tools + Tool Count^^-1
#AUTOTLO=2

*************************************************
*	Tab Name 	:		Hole Cycles
*************************************************
;Setvar^#BOREOFFSETMM^0.25^<415>Hole Cycles^REAL^<572>Fine Bore stand-off distance (MM)^-1
#BOREOFFSETMM=0.25
;Setvar^#BOREOFFSETINCH^0.010^<415>Hole Cycles^REAL^<573>Fine Bore stand-off distance (INCH)^-1
#BOREOFFSETINCH=0.010
;Setvar^#ZRABSINCR^1^<415>Hole Cycles^LIST^<416>Cycle Z depth^1^<787>^Absolute^Incremental signed^Incremental unsigned^^-1
#ZRABSINCR=1
;Setvar^#ZRABSINCR2^2^<415>Hole Cycles^LIST^<3517>Cycle Z depth Inc^1^<3518>^From Clearance^From Level^From Retract^^-1
#ZRABSINCR2=2
;Setvar^#RTYPE^1^<415>Hole Cycles^LIST^<2935>Cycle R Plane^1^<2936>^Absolute^From Clearance^From Level^^-1
#RTYPE=1
;Setvar^#CLEARTYPE^1^<415>Hole Cycles^LIST^<3503>Cycle Z Clear^1^<3504>^Absolute^From Level^^-1
#CLEARTYPE=1
;Setvar^#SUPPORTG98G99^0^<415>Hole Cycles^YESNO^<2937>Support Retract Plane Definition^-1
#SUPPORTG98G99=0
;Setvar^#SUPPORTMDEPTH^0^<415>Hole Cycles^YESNO^<1618>Support Multi Depth Cycles?^-1
#SUPPORTMDEPTH=0

;Setvar^#PREPOSITION^2^<415>Hole Cycles^LIST^<1775>Move to position before cycle^0^<4000>^Clearance Change^Always^After ToolChange^^-1
#PREPOSITION=2
;Setvar^#CYCLEPOINTS^2^<415>Hole Cycles^LIST^<1776>Calls Hole Cycle Points^1^<1777>^None^Except First^All^^-1
#CYCLEPOINTS=2
;Setvar^#RIGIDTAP^29^<415>Hole Cycles^REAL^<2121>Rigid Tapping Code^-1
#RIGIDTAP=29

;Setvar^#EXPANDG81^1^<415>Hole Cycles^YESNO^<1764>Drill Cycles Always Longhand^-1
#EXPANDG81=1
;Setvar^#EXPANDG82^1^<415>Hole Cycles^YESNO^<1765>Counterbore Cycles Always Longhand^-1
#EXPANDG82=1
;Setvar^#EXPANDG83^1^<415>Hole Cycles^YESNO^<1766>Peck Drill Cycles Always Longhand^-1
#EXPANDG83=1
;Setvar^#EXPANDG85^1^<415>Hole Cycles^YESNO^<1767>Ream Cycles Always Longhand^-1
#EXPANDG85=1
;Setvar^#EXPANDG86^1^<415>Hole Cycles^YESNO^<1768>Bore Cycles Always Longhand^-1
#EXPANDG86=1
;Setvar^#EXPANDG87^1^<415>Hole Cycles^YESNO^<1769>Chipbreak Cycles Always Longhand^-1
#EXPANDG87=1
;Setvar^#BBCYCLE^1^<415>Hole Cycles^YESNO^<3653>Back Bore Cycles Always Longhand^-1
#BBCYCLE=1
;Setvar^#BFCYCLE^1^<415>Hole Cycles^YESNO^<3654>Back Face Cycles Always Longhand^-1
#BFCYCLE=1
;Setvar^#HECYCLE^1^<415>Hole Cycles^YESNO^<3655>Helical Cycles Always Longhand^-1
#HECYCLE=1
;Setvar^#LHPECKTAP^0^<415>Hole Cycles^YESNO^<4085>Peck Tapping Cycles Always Longhand^-1
#LHPECKTAP=0
;Setvar^#PTCYPECKTAP^0^<415>Hole Cycles^YESNO^<4310>Use Cycle Points for Peck Tapping^-1
#PTCYPECKTAP=0
;Setvar^#BACKPOINTS^1^<415>Hole Cycles^LIST^<4413>Back Bore / Face Cycle Points^0^<4414>^Don't Use^Use Common^Use Dedicated^^-1
#BACKPOINTS=1
;Setvar^#HECHAMFER^0^<415>Hole Cycles^LIST^<3987>Helical Canned Cycles Chamfer^0^<3988>^Any Chamfer^No Chamfer^None & 90 Degree^^-1
#HECHAMFER=0

;Setvar^#DIRNXPOS^0.0^<415>Hole Cycles^REAL^<3722>Back Bore Disengage X+^-1
#DIRNXPOS=0.0
;Setvar^#DIRNYPOS^90^<415>Hole Cycles^REAL^<3723>Back Bore Disengage Y+^-1
#DIRNYPOS=90
;Setvar^#DIRNXNEG^180^<415>Hole Cycles^REAL^<3724>Back Bore Disengage X-^-1
#DIRNXNEG=180
;Setvar^#DIRNYNEG^270^<415>Hole Cycles^REAL^<3725>Back Bore Disengage Y-^-1
#DIRNYNEG=270

;Setvar^#SUBWARN^1^<415>Hole Cycles^YESNO^<3396>Warn for Subroutines with Longhand Hole Cycles^-1
#SUBWARN=1
;Setvar^#TAPWARN^1^<415>Hole Cycles^YESNO^<3986>Warn for Type Mismatch in Tapping Cycles^-1
#TAPWARN=1

;SetController^9^1^<415>Hole Cycles^<574>Subroutine Drill / CounterBore / Peck Drill Cycle Co-ordinates ?
;SetController^10^0^<415>Hole Cycles^<575>Subroutine Chipbreak Cycle Co-ordinates?
;SetController^11^1^<415>Hole Cycles^<576>Subroutine Ream Bore Cycle Co-ordinates?
;SetController^12^0^<415>Hole Cycles^<577>Subroutine Bore Cycle Co-ordinates?
;SetController^13^1^<415>Hole Cycles^<578>Subroutine Tapping Cycle Co-ordinates?
;Setvar^#ORTHCYCLES^0^<415>Hole Cycles^YESNO^<3180>Allow Canned Cycle On Orthogonal Planes^-1
#ORTHCYCLES=0

*************************************************
*	Tab Name 	:		Thread Mill Cycle
*************************************************
;Setvar^#THREADCANNED^2^<2433>Thread Mill Cycle^LIST^<2875>Thread Mill Full Cycle^0^<2876>^None^Multi Turn Helix^Canned Cycle^^-1
#THREADCANNED=2
;Setvar^#TAPERWARN^1^<2433>Thread Mill Cycle^YESNO^<3395>Warn for Helical Taper Thread Mill^-1
#TAPERWARN=1
;Setvar^#ORTHMILLCYCLES^0^<2433>Thread Mill Cycle^YESNO^<3180>Allow Canned Cycle On Orthogonal Planes^-1
#ORTHMILLCYCLES=0
;Setvar^#THRDEPMODE2^1^<2433>Thread Mill Cycle^LIST^<3867>Threaded Depth^1^<3868>^Absolute^From Level^From Retract^^-1
#THRDEPMODE2=1
;Setvar^#THRDEPMODE^0^<2433>Thread Mill Cycle^LIST^<3869>Threaded Depth Sign^0^<3870>^Signed^Unsigned^Negative Upward^Negative Downward^^-1
#THRDEPMODE=0
;Setvar^#THRDPITCHMODE^0^<2433>Thread Mill Cycle^LIST^<3871>Pitch Sign^1^<3872>^Absolute^Negative Left Hand^Negative Right Hand^^-1
#THRDPITCHMODE=0
;Setvar^#THRDCLIMB^-1^<2433>Thread Mill Cycle^REAL^<3873>Climb Mill Code^-1
#THRDCLIMB=-1
;Setvar^#THRDUPCUT^1^<2433>Thread Mill Cycle^REAL^<3874>Up-cut Code^-1
#THRDUPCUT=1
;Setvar^#THRDINCODE^0^<2433>Thread Mill Cycle^REAL^<3875>Thread Internal Code^-1
#THRDINCODE=0
;Setvar^#THRDOUTCODE^1^<2433>Thread Mill Cycle^REAL^<3876>Thread External Code^-1
#THRDOUTCODE=1
;Setvar^#THRDCLW^#FUNNY^<2433>Thread Mill Cycle^REAL^<80>CLW Code^-1
#THRDCLW=#FUNNY
;Setvar^#THRDCCLW^#FUNNY^<2433>Thread Mill Cycle^REAL^<82>CCLW Code^-1
#THRDCCLW=#FUNNY
;Setvar^$THRDLEFT^Left^<2433>Thread Mill Cycle^STRING^<3877>Left Hand Description^-1
$THRDLEFT=Left
;Setvar^$THRDRIGHT^Right^<2433>Thread Mill Cycle^STRING^<3878>Right Hand Description^-1
$THRDRIGHT=Right

;Setvar^#ALLOWSTANG^1^<2433>Thread Mill Cycle^YESNO^<4145>Allow Non-Zero Start Angle^-1
#ALLOWSTANG=1
;Setvar^#ALLOWTAPER^1^<2433>Thread Mill Cycle^YESNO^<4146>Allow Taper Angle^-1
#ALLOWTAPER=1
;Setvar^#ALLOWMSTART^1^<2433>Thread Mill Cycle^YESNO^<4147>Allow Multi-Start Thread^-1
#ALLOWMSTART=1


*************************************************
*	Tab Name 	:		Subroutines
*************************************************
;Setvar^#SUBNOSTART^10^<417>Subroutines^INT^<579>Start Subroutine Program Numbers (blank = Progid)^-1
#SUBNOSTART=10
;Setvar^#INCRSUBNUMBER^10^<417>Subroutines^INT^<580>Increment Subroutine Program Numbers by ...^-1
#INCRSUBNUMBER=10
;Setvar^#INCRSUBS^0^<417>Subroutines^YESNO^<598>Incremental Subroutines Co-ordinates^-1
#INCRSUBS=0
;Setvar^#FORCEFEED^0^<417>Subroutines^YESNO^<1812>Force Feed Output at Start^-1
#FORCEFEED=0
;SetController^32^1^<417>Subroutines^<581>Output Subroutines for Translate ?
;SetController^33^1^<417>Subroutines^<3938>Output Subroutines for Planar Rotate ?
;SetController^35^1^<417>Subroutines^<582>Output Subroutines for Repeat (Peck) ?

*************************************************
*	Tab Name 	:		Tool Change
*************************************************
;Setvar^#TOOLRAPWARN^1^<1622>Tool Change^YESNO^<1631>Warn if no Rapid to Tool Change^-1
#TOOLRAPWARN=1
;Setvar^#TOOLZWARN^0^<1622>Tool Change^YESNO^<1632>Warn if not at Tool Change Z^-1
#TOOLZWARN=0
;Setvar^#TOOLFEEDTYPE^0^<1622>Tool Change^YESNO^<3879>Call Feed Type Before Tool Change^-1
#TOOLFEEDTYPE=0
;Setvar^#REFSHIFT^2^<1622>Tool Change^LIST^<1813>Values of ToolChange Home^0^<4309>^Gauge Adjusted Datum^Machine Datum Coords^Current CPL Coords^^-1
#REFSHIFT=2
;Setvar^#SPINWARN^2^<1622>Tool Change^LIST^<2928>Spindle Stopped Warning^0^<2929>^Never^Feed Moves^All Moves^^-1
#SPINWARN=2
;Setvar^#FORCEAFTERTC^0^<1622>Tool Change^YESNO^<3721>Force Move After Tool Change^-1
#FORCEAFTERTC=0
;Setvar^#3DAFTERTC^1^<1622>Tool Change^LIST^<3803>Apply TLO^1^<3804>^Move After TC^First Z move^^-1
#3DAFTERTC=1
;Setvar^#MANUAL^1^<1622>Tool Change^YESNO^<3880>Use Manual TC Code Constructor^-1
#MANUAL=1




***********************************************************
* Workplane definition
***********************************************************
;Setvar^#WPLANEON^68.2^<3176>Workplane Definition^REAL^<3168>Work Plane Mode^-1
#WPLANEON=68.2
;Setvar^#WPLANEOFF^69^<3176>Workplane Definition^REAL^<2446>Cancel Work Plane^-1
#WPLANEOFF=69

***********************************************************
*	Tab Name 	:		4-5 Axis Machining
***********************************************************

******************************************************************************************
*	Modal Variables
;Setmodal^#GCODE^1^Modal^General G-Codes
%OUTPUT-IF-CHANGED=#GCODE
;Setmodal^#FEEDMODEGCODE^1^Modal^Fpr/Fpm G-Code
%OUTPUT-IF-CHANGED=#FEEDMODEGCODE
;Setmodal^#ABSINC^1^Modal^Absolute/Incremental Coords Code
%OUTPUT-IF-CHANGED=#ABSINC
;Setmodal^#EXACTGCODE^0^Modal^Exact Stop G-Code
;Setmodal^#PLANEGCODE^1^Modal^XY / XZ / YZ Plane G-Code
%OUTPUT-IF-CHANGED=#PLANEGCODE
;Setmodal^#COMPGCODE^1^Modal^Cutter Compensation G-Code
%OUTPUT-IF-CHANGED=#COMPGCODE
;Setmodal^#COMPDCODE^1^Modal^Cutter Compensation Register
%OUTPUT-IF-CHANGED=#COMPDCODE
;Setmodal^DWELL^0^Modal^Dwell Time

;Setmodal^#MCODE^1^Modal^General M-Codes
%OUTPUT-IF-CHANGED=#MCODE
;Setmodal^#GEARMCODE^1^Modal^Gear M-Codes
%OUTPUT-IF-CHANGED=#GEARMCODE
;Setmodal^#COOL^1^Modal^Coolant M-Codes
%OUTPUT-IF-CHANGED=#COOL
;Setmodal^#THROUGHTOOL1^1^Modal^Through Tool Coolant
%OUTPUT-IF-CHANGED=#THROUGHTOOL1

;Setmodal^#XMOVE^1^Modal^X Axis Coordinates
%OUTPUT-IF-CHANGED=#XMOVE
;Setmodal^#YMOVE^1^Modal^Y Axis Coordinates
%OUTPUT-IF-CHANGED=#YMOVE
;Setmodal^#ZMOVE^1^Modal^Z Axis Coordinates
%OUTPUT-IF-CHANGED=#ZMOVE
;Setmodal^#IVALUE^0^Modal^Arc I Coordinates
;Setmodal^#JVALUE^0^Modal^Arc J Coordinates
;Setmodal^#KVALUE^0^Modal^Arc K Coordinates
;Setmodal^#RADIUS^0^Modal^Arc Radius

;Setmodal^XPARTNORMAL^0^Modal^X Part normal
;Setmodal^YPARTNORMAL^0^Modal^Y Part normal
;Setmodal^ZPARTNORMAL^0^Modal^Z Part normal

;Setmodal^#HCODE^1^Modal^Tool Length Offset
%OUTPUT-IF-CHANGED=#HCODE
;Setmodal^#SPEED^1^Modal^Spindle Speed
%OUTPUT-IF-CHANGED=#SPEED
;Setmodal^#DIRECTION^1^Modal^Spindle Direction
%OUTPUT-IF-CHANGED=#DIRECTION
;Setmodal^#FEED^1^Modal^Feedrates
%OUTPUT-IF-CHANGED=#FEED

;Setmodal^#CYCLEGCODE^1^Modal^Hole Cycle G-Codes
%OUTPUT-IF-CHANGED=#CYCLEGCODE
;Setmodal^#RETRACTGCODE^0^Modal^Hole Cycle Return to Rplane
;Setmodal^#RPLANE^1^Modal^Hole Cycle - Rplane
%OUTPUT-IF-CHANGED=#RPLANE
;Setmodal^#TMPCLEAR^0^Modal^Hole Cycle - Zclear
;Setmodal^#ZDEPTHOUT^1^Modal^Hole Cycle Depth
%OUTPUT-IF-CHANGED=#ZDEPTHOUT
;Setmodal^#DEPTH^0^Modal^Hole Cycle Peck Depth
;Setmodal^#DEGR^0^Modal^Hole Cycle Degression
;Setmodal^#BOREOFFSET^1^Modal^Hole Cycle Bore Stand Off distance
%OUTPUT-IF-CHANGED=#BOREOFFSET

;Setmodal^BOTTOMZCLEAR^0^Modal^Back Bore Z Clear
;Setmodal^BOTTOMZLEVEL^0^Modal^Bottom Z Level
;Setmodal^#BOTTOMBORE^0^Modal^Incremental Back Bore Z Depth
;Setmodal^BOTTOMZDEPTH^0^Modal^Absolute Back Bore Z Depth
;Setmodal^ZRELIEF^0^Modal^Back Bore Z Back Off
;Setmodal^#RELIEFDIR^0^Modal^Back Bore Relief Direction
;Setmodal^RELIEFDIST^0^Modal^Back Bore Side Relief





****************************************************************
*   Tab Name    :      Debug
****************************************************************
;Setvar^MACRONAMEOP^0^<3052>NC Debug^YESNO^<1255>Generate Macro Calls Trace^-1
MACRONAMEOP=0
;Setvar^$CONDEBUG^0^<3052>NC Debug^YESNO^<395>Generate Code Constructor Trace^-1
$CONDEBUG=0
%IF $CONDEBUG=0 %THEN $CONDEBUG=N
;Setvar^#PROCTRACE^0^<3052>NC Debug^YESNO^<1330>Generate Procedures Trace^-1
#PROCTRACE=0
;Setvar^#PROCTRACE2^1^<3052>NC Debug^YESNO^<3053>Procedure Trace Output^-1
#PROCTRACE2=1
;Setvar^#TRENDS^0^<3052>NC Debug^YESNO^<3054>Procedure Trace - Input Coordinates^-1
#TRENDS=0
;Setvar^#TRSTARTS^0^<3052>NC Debug^YESNO^<3055>Procedure Trace - CPL Initialisation^-1
#TRSTARTS=0
;Setvar^#TRTHREAD^0^<3052>NC Debug^YESNO^<3057>Procedure Trace - Thread Mill Array^-1
#TRTHREAD=0
;Setvar^#TRHOLE^0^<3052>NC Debug^YESNO^<3058>Procedure Trace - Hole Cycle Array^-1
#TRHOLE=0
;Setvar^#TRMODE^0^<3052>NC Debug^YESNO^<3925>Procedure Trace - #MOVE values^-1
#TRMODE=0

;Setvar^#LISTCODE^0^<3052>NC Debug^YESNO^<1391>List NC Code^-1
#LISTCODE=0
%IF #LISTCODE=0 %THEN SILENT=1
****************************************************************



%CALL=PT_SET_DEFAULTS


*
*	*****************************************
*	*	Tab Name	:	Program Start		*
*	*****************************************
*
*	Note ! Cannot be a procedure because %SUBROUTINE must be defined in the START or END macros
*
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Program Start	*****>
@NO_CON-DEBUG

;Sequence Definition^<434>Program Start^-1^<899>NC Program General^
;Use Tokens^SUBROUTINES^DELETE^BLKNUM^ABS-INC^XHOME^YHOME^ZHOME^COOLANT OFF^COMP OFF^UNITSGCODE^PROGID^PLANEGCODE^PROGDESCR^TIME^DATE^UKDATE^DAY^MONTH^YEAR^PROGRAMMER^PROGVERSION^MANREADABLE^LEADER^MACHINENAME^PARTNAME^SEQUENCENAME^CYCLETIME^JM-DESC^JM-COM^JM-FAM^JM-MACH^JM-CUST^JM-PROG^JM-MATL^JM-REV^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^(^[PROGDESCR]^)
;Default Sequence^[DELETE]^[BLKNUM]^ G54
;TEXT^  This template is based on generic ISO control requirements
;TEXT^  It will need to be configured for individual machine tools
%CALL=PT_ASK_PROGDESCR
<([$DESCR])>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G54>




%CALL=SET_TOOLING_DATA

%CALL=SET_WORK_DATUMS

*	Rotary Axes set to zero for start of program
#ROT1=0:#ROT2=0:#ROT1HOLD=0:#ROT2HOLD=0
%IF #ROTTYPE=4 %THEN #ROT1DIRHOLD=#FUNNY:#ROT2DIRHOLD=#FUNNY:#ROT1HOLD=0:#ROT2HOLD=0

%IF #SUBNOSTART=#FUNNY %THEN #SUBNOSTART=#PROGID	; If user has not specified subroutine start number, use Progid+1 etc.
*$DEBUG=Y
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


*****************************************************************************************************************
%PROCEDURE=SPLINE
%IF #PROCTRACE=1 %THEN $PROCEDURE=SPLINE:%CALL=ENTER_PROCEDURE

%IF SUBFUNCT=1 %THEN %CANCEL=#CYCLEGCODE,#ORDER
#CYCLEGCODE=6.2
#KNOT=FIELD2
#WEIGHT=FIELD3
#ORDER=FIELD1
%OUTPUT-IF-CHANGED=#ORDER

%CALL=CODECON_SPLINE-PARAMETER
%CANCEL=#GCODE
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 58  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=END
#MACRO=58
#EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

*	Note ! Cannot be a procedure because %SUBROUTINE must be defined in the START or END macros
$SPC=" "; Reset trace spacing
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Program End	*****>
@NO_CON-DEBUG


#XMOVE=XHOME:#YMOVE=YHOME:#ZMOVE=ZHOME
%IF #TLOCOMP=#TRUE %THEN %CALL=PT_COMPENSATE_TLO

#XHOLD=XHOME:#YHOLD=YHOME:#ZHOLD=ZHOME						;	 Necessary for incremental output

;Sequence Definition^<435>Program End^-1^<899>NC Program General^
;Use Tokens^SUBROUTINES^WARNCOUNT^PROBE_OFF^DELETE^BLKNUM^RAPIDGCODE^XHOME^YHOME^ZHOME^COOLANT OFF^COMP OFF^FIRSTTOOL^PROGDESCR^TIME^DATE^UKDATE^DAY^MONTH^YEAR^PROGRAMMER^PROGVERSION^PROGID^MACHINENAME^PARTNAME^SEQUENCENAME^CYCLETIME^JM-DESC^JM-COM^JM-FAM^JM-MACH^JM-CUST^JM-PROG^JM-MATL^JM-REV^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_OFF]
;Default Sequence^[DELETE]^[BLKNUM]^ M30
;Default Sequence^%
;Default Sequence^[SUBROUTINES]
;Default Sequence^[WARNCOUNT]
%CALL=PT_PROBE_OFF
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] M30>
<%>
%SUBROUTINE
%CALL=PT_WARNING_COUNT


%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*   *************************************************
*                      Code constructors
*   *************************************************



*   *************************************************
*	*	Tab Name	:	Set-Up / Tooling Sheet		*
*	*************************************************
%PROCEDURE=SETUP_HEADER
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Set-Up Header 	*****>
@NO_CON-DEBUG

;Sequence Definition^<1716>Set-Up Header^-1^<899>NC Program General^
;Use Tokens^PROGID^PROGDESCR^TIME^DATE^UKDATE^DAY^MONTH^YEAR^PROGRAMMER^PROGVERSION^MANREADABLE^MACHINENAME^PARTNAME^SEQUENCENAME^CYCLETIME^JM-DESC^JM-COM^JM-FAM^JM-MACH^JM-CUST^JM-PROG^JM-MATL^JM-REV^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^This constructor is only called if selected in SET UP SHEET (NC Style) tab
;Default Sequence^_____________________________________________________________________________
;Default Sequence
;Default Sequence^                     Machine Tool Set Up Details
;Default Sequence^_____________________________________________________________________________
;Default Sequence
;Default Sequence^                    Job Description     ^[JM-DESC]
;Default Sequence^                                        ^[JM-COM]
;Default Sequence
;Default Sequence^                    Machine             ^[JM-MACH]
;Default Sequence
;Default Sequence^     Total Machining Time (including Toolchange) : ^[CYCLETIME]^ Minutes
;Default Sequence
;Default Sequence
;Default Sequence^Tools used in this program
;Default Sequence^.
<This constructor is only called if selected in SET UP SHEET (NC Style) tab>
<_____________________________________________________________________________>
< >
<                     Machine Tool Set Up Details>
<_____________________________________________________________________________>
< >
<                    Job Description     [JOBDESC]>
<                                        [JOBCOM]>
< >
<                    Machine             [JOBMACH]>
< >
<     Total Machining Time (including Toolchange) : [MACHTIME1=12] Minutes>
< >
< >
<Tools used in this program>
<.>


%ENDM
*
%PROCEDURE=SETUP_TRAILER
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Set-Up Trailer 	*****>
@NO_CON-DEBUG

;Sequence Definition^<1717>Set-Up Trailer^-1^<899>NC Program General^
;Use Tokens^PROGID^PROGDESCR^TIME^DATE^UKDATE^DAY^MONTH^YEAR^PROGRAMMER^PROGVERSION^MANREADABLE^MACHINENAME^PARTNAME^SEQUENCENAME^CYCLETIME^JM-DESC^JM-COM^JM-FAM^JM-MACH^JM-CUST^JM-PROG^JM-MATL^JM-REV^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^_____________________________________________________________________________
;Default Sequence^.
;Default Sequence^                    Programmed By       ^[JM-PROG]^              Date           : ^[DATE]
;Default Sequence^ End of setup Sheet
;Default Sequence^
<_____________________________________________________________________________>
<.>
<                    Programmed By       [JOBPROG]              Date           : [DATE]>
< End of setup Sheet>


%ENDM
*
%PROCEDURE=CODECON_SET-UP-SHEET
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Set-Up / Tooling Sheet	*****>
@NO_CON-DEBUG
*
* Setup sheet header if requested (not in loop)
%IF #SETUPHEAD=1 %THEN %CALL=SETUP_HEADER
*

#HEADER=1
@HEADER              ;output header at top of cnc file
%LOAD=#HEADER

*	Remove duplicate tools from Tool Sheet
%IF #REMOVEDUPLICATES=#FALSE @MISS_REMOVE_DUPLICATES
#TMP1=#FALSE:%CALL=PT_REMOVE_DUPLICATE_TOOLS:%IF #TMP1=#TRUE @SKIP
@MISS_REMOVE_DUPLICATES

%LOAD=#HEADER

%IF TOOLUNIT=0 %THEN $UNIT=IN %ELSE $UNIT=MM
%CALL=PT_SET_ATTACHMENT

#TOOLDIA=2*TOOLRAD
%IF TOOLEN=#FUNNY %THEN TOOLEN=0				;	If Gauge Length unset then force zero

;Sequence Definition^<436>Set-Up / Tooling Sheet^-1^<899>NC Program General^
;Use Tokens^HDR-TURRETNO^TOOLDESCR^COMMENT^HDR-TOOLDIAM^TOOLTYPE^HDR-TOOLGAUGE^ZGAUGELENGTH^FLUTE^LENGTHOFFSET^CORNER^REACH^TOOLUNITS^MOUNT-ANGLE^HEAD-ANGLE^TSTORE_USER1^TSTORE_USER2^TSTORE_STRING1^TSTORE_STRING2^TOOL_GROUP^TOOL_GROUP_NUMBER^TOOL_GROUP_TEXT^TOOL_ID^TOOL_ID_NUMBER^TOOL_ID_TEXT^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^* ^Turret No. :^[HDR-TURRETNO]^Diameter :^[HDR-TOOLDIAM]^[TOOLUNITS]^[TOOLTYPE]
#TOOLDIA=TOOLRAD*2
%IF TOOLUNIT=0 %THEN $UNIT=IN %ELSE $UNIT=MM
%CALL=SET_TOOL_TYPE
<* Turret No. :[POSITION=11]Diameter :[#TOOLDIA=12][$UNIT=5][$TYPE=10]>


@SKIP
#HEADER=#HEADER+1:%IF #HEADER<=NUMTOOLS @HEADER  ;check number of tools used

*
* Setup sheet trailer if requested (not in loop)
%IF #SETUPHEAD=1 %THEN %CALL=SETUP_TRAILER
*
%ENDM
*
*	*************************************************
*	*	Tab Name	:	Set Tooling Data			*
*	*************************************************
*
%PROCEDURE=CODECON_SET-TOOLING-DATA
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Set Tooling Data List	*****>
@NO_CON-DEBUG

%CALL=PT_SET_ATTACHMENT

;Sequence Definition^<437>Set Tooling Data List^-1^<899>NC Program General^
;Use Tokens^DELETE^BLKNUM^SETTOOLGCODE^LOOPNUMBER^TOOLDESCR^TOOLTYPE^COMMENT^ZGAUGELENGTH^FLUTE^LENGTHOFFSET^CORNER^REACH^TOOLRADIUS^TOOLDIAM^TURRETNO^TOOLUNITS^MOUNT-ANGLE^HEAD-ANGLE^TSTORE_USER1^TSTORE_USER2^TSTORE_STRING1^TSTORE_STRING2^TOOL-ANGLE^TOOL_GROUP^TOOL_GROUP_NUMBER^TOOL_GROUP_TEXT^TOOL_ID^TOOL_ID_NUMBER^TOOL_ID_TEXT^HOLDER_TYPE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence


%ENDM
*
*	*****************************************
*	*	Tab Name	:	Rapid Move			*
*	*****************************************
*
%PROCEDURE=CODECON_RAPID-MOVE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Rapid Move	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<438>Rapid Move^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^ABS-INC^RAPIDGCODE^PLANEGCODE^EXACTSTOPGCODE^XMOVE^YMOVE^ZMOVE^COOLANT^COOLTHROTOOL^COMPGCODE^CRC REGISTER^SPEED^SPINDIR^GEARMCODE^FEED^WORKGCODE^FEEDMODEGCODE^COMPGCODE^CRC REGISTER^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RAPIDGCODE]^[PLANEGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[SPEED]^[SPINDIR]
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#GCODE=24][#PLANEGCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#SPEED=8][#DIRECTION=23]>











%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*********************************************
*	*	Tab Name	:	Linear Interpolation	*
*	*********************************************
*
%PROCEDURE=CODECON_LINEAR-INTERPOLATION
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Linear Interpolation	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<3>Linear Interpolation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^ABS-INC^PLANEGCODE^FEEDMODEGCODE^FEEDGCODE^EXACTSTOPGCODE^XMOVE^YMOVE^ZMOVE^COOLANT^COOLTHROTOOL^COMPGCODE^CRC REGISTER^FEED^SPEED^SPINDIR^GEARMCODE^MC-COORDS^XPARTNORMAL^YPARTNORMAL^ZPARTNORMAL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[COMPGCODE]^[FEEDMODEGCODE]^[FEEDGCODE]^[PLANEGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[CRC REGISTER]^[SPEED]^[SPINDIR]^[FEED]
;TEXT^Use tokens XPARTNORMAL etc. for 3D Normal Offset output
%CALL=PT_BINC
%IF #EXACTSTOP=2 %THEN #GCODE=DATA1(10)
<[#DELETE=29][#BNUM=25][#COMPGCODE=24][#FEEDMODEGCODE=24][#GCODE=24][#PLANEGCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#COMPDCODE=17][#SPEED=8][#DIRECTION=23][#FEED=7]>












%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*************************************************
*	*	Tab Name	:	Circular Interpolation   	*
*	*************************************************
*
%PROCEDURE=CODECON_2D_CIRCULAR
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	2D Circular Interpolation	*****>
@NO_CON-DEBUG

* 2D only, blank unwanted values
%IF XYPLANE=0 %THEN #KVALUE=#FUNNY
%IF XYPLANE=1 %THEN #JVALUE=#FUNNY
%IF XYPLANE=2 %THEN #IVALUE=#FUNNY

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<2894>2D Circular Interpolation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^ABS-INC^PLANEGCODE^CLWGCODE^EXACTSTOPGCODE^XARCEND^YARCEND^ZARCEND^IVALUE^JVALUE^KVALUE^ARCRADIUS^XCENTRE^YCENTRE^ZCENTRE^COOLANT^COOLTHROTOOL^COMPGCODE^CRC REGISTER^SPEED^SPINDIR^GEARMCODE^FEED^FEEDMODEGCODE^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[PLANEGCODE]^[COMPGCODE]^[FEEDMODEGCODE]^[CLWGCODE]^[XARCEND]^[YARCEND]^[ZARCEND]^[IVALUE]^[JVALUE]^[KVALUE]^[ARCRADIUS]^[FEED]^[SPEED]^[SPINDIR]
;TEXT^Circular Interpolation in any 2 dimensions. No third axis movement.
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#PLANEGCODE=24][#COMPGCODE=24][#FEEDMODEGCODE=24][#GCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#IVALUE=3][#JVALUE=4][#KVALUE=5][#RADIUS=6][#FEED=7][#SPEED=8][#DIRECTION=23]>














%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


%PROCEDURE=CONTROL_HELICAL
%IF #PROCTRACE=1 %THEN $PROCEDURE=CONTROL_HELICAL:%CALL=ENTER_PROCEDURE
* Enables control of multi-helix block for TNC
%CALL=CODECON_HELICAL
%ENDM

%PROCEDURE=CODECON_HELICAL
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Helical Interpolation	*****>
@NO_CON-DEBUG

* Call to get number of turns
%CALL=PT_ARC_TURN_BRG_HH

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


* Suppress number of turns if 0
%IF #TURNS=0 %THEN #TURNS=#FUNNY

;Sequence Definition^<2895>Helical Interpolation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^ABS-INC^PLANEGCODE^CLWGCODE^EXACTSTOPGCODE^XARCEND^YARCEND^ZARCEND^IVALUE^JVALUE^KVALUE^ARCRADIUS^NUMTURNS^XCENTRE^YCENTRE^ZCENTRE^COOLANT^COOLTHROTOOL^COMPGCODE^CRC REGISTER^SPEED^SPINDIR^GEARMCODE^FEED^FEEDMODEGCODE^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[PLANEGCODE]^[COMPGCODE]^[FEEDMODEGCODE]^[CLWGCODE]^[XARCEND]^[YARCEND]^[ZARCEND]^[<C>IVALUE]^[<C>JVALUE]^[<C>KVALUE]^[FEED]^[SPEED]^[SPINDIR]^[GEARMCODE]
;TEXT^Circular Interpolation in any 2 dimensions with linear movement in the third
%CALL=PT_BINC
%CANCEL=#IVALUE
%CANCEL=#JVALUE
%CANCEL=#KVALUE
<[#DELETE=29][#BNUM=25][#PLANEGCODE=24][#COMPGCODE=24][#FEEDMODEGCODE=24][#GCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#IVALUE=3][#JVALUE=4][#KVALUE=5][#FEED=7][#SPEED=8][#DIRECTION=23][#GEARMCODE=23]>














%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL



*
*	*****************************************
*	*	Tab Name	:	Dwell				*
*	*****************************************
*
%PROCEDURE=CODECON_DWELL
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Dwell	*****>
@NO_CON-DEBUG

;Sequence Definition^<6>Dwell^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[<C>DWELLTIME]
%CALL=PT_BINC
%CANCEL=DWELL
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE

%ENDM
*
*	*****************************************
*	*	Tab Name	:	Cutter Compensation	*
*	*****************************************
*
%PROCEDURE=CODECON_CUTTER-COMPENSATION
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Cutter Compensation	*****>
@NO_CON-DEBUG

;Sequence Definition^<411>Cutter Compensation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^EXACTSTOPGCODE^FEEDGCODE^COMPGCODE^PLANEGCODE^CRC REGISTER^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^



%ENDM
*
*
*	*************************************************
*	*	Tab Name	:	Cancel Cutter Compensation	*
*	*************************************************
*
%PROCEDURE=CODECON_CANCEL-CUTTER-COMP
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Cancel Cutter Compensation	*****>
@NO_CON-DEBUG

;Sequence Definition^<588>Cancel Cutter Compensation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^EXACTSTOPGCODE^FEEDGCODE^COMPGCODE^PLANEGCODE^CRC REGISTER^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^



%ENDM
*
*	*****************************************
*	*	Tab Name	:	3D Cutter Compensation	*
*	*****************************************
*
%PROCEDURE=CODECON_3D_CUTTER-COMP
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	3D Cutter Compensation	*****>
@NO_CON-DEBUG

;Sequence Definition^<4373>3D Cutter Compensation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^EXACTSTOPGCODE^FEEDGCODE^PLANEGCODE^3DCRCGODE^3D_CCR^3D_TR^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[3DCRCGODE]
;TEXT^Called to activate 3D Compensation mode
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#3DCRCGCODE=24]>




%ENDM
*
*	*************************************************
*	*	Tab Name	:	Cancel Cutter Compensation	*
*	*************************************************
*
%PROCEDURE=CODECON_CANCEL-3D-COMP
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Cancel 3D Cutter Compensation	*****>
@NO_CON-DEBUG

;Sequence Definition^<4374>Cancel 3D Cutter Compensation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^EXACTSTOPGCODE^FEEDGCODE^3DCRCGODE^3D_CCR^3D_TR^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[3DCRCGODE]
;TEXT^Called to de-activate 3D Compensation mode
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#3DCRCGCODE=24]>




%ENDM

*
*
*	*************************************************
*	*	Tab Name	:	Drill Cycle					*
*	*************************************************
*
*
%PROCEDURE=CODECON_DRILL-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Drill Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<27>Drill Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DRILLGCODE^XMOVE^YMOVE^ZMOVE^ZDEPTH^RAPIDGCODE^CYCLEAXIS^ZCLEAR^RPLANE^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^SPINDIR^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[DRILLGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[<C>RPLANE]^[<C>CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
%CANCEL=#RPLANE
%CANCEL=#FEED
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#RPLANE=40][#FEED=32][#SPEED=33][#GEARMCODE=23]>










%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*************************************************
*	*	Tab Name	:	Counterbore Cycle			*
*	*************************************************
*
*
%PROCEDURE=CODECON_COUNTERBORE-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	CounterBore Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<589>CounterBore Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^SPOTGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^SPINDIR^CYCLEDWELLTIME^DWELLGCODE^RAPIDGCODE^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[SPOTGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[<C>CYCLEDWELLTIME]^[<C>RPLANE]^[<C>CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
%CANCEL=DWELL
%CANCEL=#RPLANE
%CANCEL=#FEED
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][DWELL=34][#RPLANE=40][#FEED=32][#SPEED=33][#GEARMCODE=23]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE










%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*************************************************
*	*	Tab Name	:	Peck Drill Cycle			*
*	*************************************************
*
*
%PROCEDURE=CODECON_PECK-DRILL-CYCLE

%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Peck Drill Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<99>Peck Drill Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^PECKGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^PECKDEPTH^PECKSAFE^DEGRESSION^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[PECKGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[<C>PECKDEPTH]^[<C>RPLANE]^[<C>CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
%CANCEL=#DEPTH
%CANCEL=#RPLANE
%CANCEL=#FEED
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#DEPTH=36][#RPLANE=40][#FEED=32][#SPEED=33][#GEARMCODE=23]>










%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*************************************************
*	*	Tab Name	:	Tapping Cycle				*
*	*************************************************
*
*
%PROCEDURE=CODECON_TAPPING-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=CODECON_TAPPING-CYCLE:%CALL=ENTER_PROCEDURE

*******************************
* Code for point based peck tapping
#CYCLEPOINTSHOLD=#CYCLEPOINTS  ; keep for resetting
#TAPDEPTH=#ZDEPTHOUT*#ZREVERSE
%IF #PTCYPECKTAP=0 @CALL
%IF DEPTH=0 @CALL
%IF #DEPTH=#FUNNY @CALL
* Repeated calls for Peck Tapping
DEPTH=ABS(DEPTH)
#CYCLEPOINTS=3
#ZMOVEA=ZLEVEL-DEPTH
%IF ZLEVEL=#FUNNY %THEN #ZMOVEA=ZPOINT(#LOOP)-DEPTH
#ZDEPTHOUT=#ZMOVEA*#ZREVERSE
@CALL
*******************************

* Rigid or floating
%IF #TAPTYPE=2 %THEN %CALL=CODECON_RIGID-TAP-CYCLE %ELSE %CALL=CODECON_FLOAT_TAP-CYCLE

#ZDEPTHOUT=#TAPDEPTH*#ZREVERSE Reset in case modified

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=CODECON_FLOAT_TAP-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Tapping Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<28>Tapping Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^TAPGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^PECKDEPTH^ZCLEAR^RPLANE^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^PITCH^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[TAPGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[<C>RPLANE]^[<C>CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
%CANCEL=#RPLANE
%CANCEL=#FEED
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#RPLANE=40][#FEED=32][#SPEED=33][#GEARMCODE=23]>










%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


%PROCEDURE=CODECON_RIGID-TAP-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Rigid Tapping Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<1069>Rigid Tapping Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^TAPGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^PECKDEPTH^ZCLEAR^RPLANE^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^RIGIDTAP^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^PITCH^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RIGIDTAP]
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[TAPGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[<C>RPLANE]^[<C>CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#RIGIDTAP=23]>
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
%CANCEL=#RPLANE
%CANCEL=#FEED
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#RPLANE=40][#FEED=32][#SPEED=33][#GEARMCODE=23]>











%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


%PROCEDURE=CODECON_TAPREV_B
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Tapping Spindle Reverse (Bottom)	*****>
@NO_CON-DEBUG

;Sequence Definition^<3255>Tapping Spindle Reverse (Bottom)^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE OFF^SPINDLE REV^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE OFF]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[<C>DWELLTIME]
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE REV]
;TEXT^Longhand tapping spindle reverse at bottom of hole
%CALL=PT_BINC
#DIRECTIONHOLD=#DIRECTION:#DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4):#SPEEDHOLD=0
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
#DIRECTION=#DIRECTIONHOLD:#DIRHOLD=1
%CALL=PT_BINC
%CANCEL=DWELL
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%CALL=PT_BINC
%CALL=PT_SPINDLE_REVERSE
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>





@END
%ENDM


%PROCEDURE=CODECON_TAPREV_T
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Tapping Spindle Reverse (Top)	*****>
@NO_CON-DEBUG

;Sequence Definition^<3256>Tapping Spindle Reverse (Top)^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE OFF^SPINDLE REV^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE OFF]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[<C>DWELLTIME]
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE REV]
;TEXT^Longhand tapping spindle reverse at top of retract
%CALL=PT_BINC
#DIRECTIONHOLD=#DIRECTION:#DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4):#SPEEDHOLD=0
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
#DIRECTION=#DIRECTIONHOLD:#DIRHOLD=1
%CALL=PT_BINC
%CANCEL=DWELL
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%CALL=PT_BINC
%CALL=PT_SPINDLE_REVERSE
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>





@END
%ENDM



*
*	*************************************************
*	*	Tab Name	:	Ream / Bore Cycle			*
*	*************************************************
*
*
%PROCEDURE=CODECON_REAM-BORE-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Ream / Bore Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<102>Ream / Bore Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^REAMGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[REAMGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[RPLANE]^[CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#RPLANE=40][#FEED=32][#SPEED=33][#GEARMCODE=23]>










%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*************************************************
*	*	Tab Name	:	Bore Cycle					*
*	*************************************************
*
*
%PROCEDURE=CODECON_BORE-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Bore Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<104>Bore Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^BOREGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^BORESTANDOFF^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[BOREGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[<C>RPLANE]^[CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
%CANCEL=#RPLANE
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#RPLANE=40][#FEED=32][#SPEED=33][#GEARMCODE=23]>










%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*************************************************
*	*	Tab Name	:	Chipbreak Cycle				*
*	*************************************************
*
*
%PROCEDURE=CODECON_CHIPBREAK-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Chipbreak Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<590>Chipbreak Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^CHIPBREAKGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^PECKDEPTH^PECKSAFE^DEGRESSION^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RETRACTGCODE]^[CHIPBREAKGCODE]^[XMOVE]^[YMOVE]^[ZMOVE]^[<C>ZDEPTH]^[<C>RPLANE]^[PECKDEPTH]^[DEGRESSION]^[<C>CYCLEZFEED]^[CYCLESPEED]^[GEARMCODE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
%CANCEL=#ZDEPTHOUT
%CANCEL=#RPLANE
%CANCEL=#FEED
<[#DELETE=29][#BNUM=25][#RETRACTGCODE=24][#CYCLEGCODE=30][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#RPLANE=40][#DEPTH=36][#DEGR=38][#FEED=32][#SPEED=33][#GEARMCODE=23]>










%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*
*
*	*********************************************
*	*	Tab Name	:	Back Bore Cycle			*
*	*********************************************
*
*
%PROCEDURE=CODECON_BACKBORE-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Bore Cycle	*****>
@NO_CON-DEBUG

* Set Relief token values
#RELIEFDIR=#DIRNXPOS
%IF RELIEFDIR=1 %THEN #RELIEFDIR=#DIRNXNEG
%IF RELIEFDIR=2 %THEN #RELIEFDIR=#DIRNYPOS
%IF RELIEFDIR=3 %THEN #RELIEFDIR=#DIRNYNEG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<3557>Back Bore Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^CYCLEGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^PECKDEPTH^PECKSAFE^DEGRESSION^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^BOTTOMZCLEAR^BOTTOMZLEVEL^BOTTOMCBORE^BOTTOMZDEPTH^ZRELIEF^RELIEFDIR^RELIEFDIST^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT







@END
%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


*	**********************************
*	* Tab Name :  Back Bore Longhand *
*	**********************************

%PROCEDURE=CODECON_BBCHANGE_A
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Bore Longhand Approach *****>
@NO_CON-DEBUG

;Sequence Definition^<3578>Back Bore Longhand Approach^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE STOP^SPINDLE RESTART^SPINDLE REV^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE STOP]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;TEXT^Spindle controls for longhand cycle approach
;TEXT^NB. Allow for 0ffset direction configurations on machine
%CALL=PT_BINC
%IF #DIRECTION<>DATA2(4) %THEN #DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4)
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE




@END
%ENDM

%PROCEDURE=CODECON_BBCHANGE_C
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Bore Longhand  Cut *****>
@NO_CON-DEBUG

;Sequence Definition^<3579>Back Bore Longhand Cut^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE STOP^SPINDLE REV^SPINDLE RESTART^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE RESTART]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;TEXT^Spindle controls for longhand cycle cutting move
%CALL=PT_BINC
#DIRECTION=#DIRHOLD2
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
#DIRHOLD=DIRECTION
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE




@END
%ENDM

%PROCEDURE=CODECON_BBCHANGE_R
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Bore Longhand Retract *****>
@NO_CON-DEBUG

;Sequence Definition^<3580>Back Bore Longhand Retract^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE STOP^SPINDLE REV^SPINDLE RESTART^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE STOP]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;TEXT^Spindle controls for longhand cycle retract
;TEXT^NB. Allow for 0ffset direction configurations on machine
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%CALL=PT_BINC
%IF #DIRECTION<>DATA2(4) %THEN #DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4)
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE




@END
%ENDM

*
*
*	*********************************************
*	*	Tab Name	:	Back Face Cycle			*
*	*********************************************
*
*
%PROCEDURE=CODECON_BACKFACE-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Face Cycle	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<3558>Back Face Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^CYCLEGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^PECKDEPTH^PECKSAFE^DEGRESSION^SPINDIR^CYCLEDWELLTIME^RAPIDGCODE^CYCLESPEED^GEARMCODE^BOTTOMZCLEAR^BOTTOMZLEVEL^BOTTOMCBORE^BOTTOMZDEPTH^ZRELIEF^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT







@END
%CALL=HOLD
#RPLANEHOLD=#RPLANE
#ZDHOLD=#ZMOVE
#ZLHOLD=#ZLEVEL
#ZCHOLD=ZCLEAR
#CYCNUM=203
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*	***********************************
*	* Tab Name :  Back Face Longhand  *
*	***********************************
*

%PROCEDURE=CODECON_BFCHANGE_A
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Face Longhand Approach *****>
@NO_CON-DEBUG


;Sequence Definition^<3581>Back Face Longhand Approach^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE STOP^SPINDLE REV^SPINDLE RESTART^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE STOP]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;TEXT^Spindle controls for longhand cycle approach
%CALL=PT_BINC
%IF #DIRECTION<>DATA2(4) %THEN #DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4)
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE




@END
%ENDM

%PROCEDURE=CODECON_BFCHANGE_C
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Face Longhand Cut *****>
@NO_CON-DEBUG

;Sequence Definition^<3582>Back Face Longhand Cut^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE STOP^SPINDLE REV^SPINDLE RESTART^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE RESTART]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;TEXT^Spindle controls for longhand cycle cutting move
%CALL=PT_BINC
#DIRECTION=#DIRHOLD2
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
#DIRHOLD=DIRECTION
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE




@END
%ENDM

%PROCEDURE=CODECON_BFCHANGE_R
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Face Longhand Retract *****>
@NO_CON-DEBUG

;Sequence Definition^<3583>Back Face Longhand Retract^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DWELLGCODE^DWELLTIME^SPINDLE STOP^SPINDLE REV^SPINDLE RESTART^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE STOP]
;Default Sequence^[DELETE]^[BLKNUM]^[DWELLGCODE]^[DWELLTIME]
;TEXT^Spindle controls for longhand cycle retract
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%CALL=PT_BINC
%IF #DIRECTION<>DATA2(4) %THEN #DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4)
<[#DELETE=29][#BNUM=25][#DIRECTION=23]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#DWELLGCODE=24][DWELL=9]>
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE
%IF #FORCEAFTERDWELL=1 %THEN %CANCEL=#GCODE




@END
%ENDM

*
*
*	*************************************************
*	*	Tab Name	:	Helical Cycle			*
*	*************************************************
*
*
%PROCEDURE=CODECON_HELICAL-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Helical Cycle	*****>
@NO_CON-DEBUG


@OUTPUT
;Sequence Definition^<3584>Helical Hole Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^CYCLEGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RPLANE^ZCLEAR^FEED^RETRACTGCODE^PLANEGCODE^HOLEDIAM^TOOLDIAM^CHAMFERWIDTH^CHAMFERANGLE^PITCH1^PITCH2^BOTTOMFINISH^MACHDIR^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^SPINDIR^RAPIDGCODE^SPEED^DWELLTIME^BORESTANDOFF^N-SUBSTART^N-SUBEND^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^
;TEXT^Canned cycle must be activated in NCStyle
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT







@END
%CALL=HOLD
#RPLANEHOLD=#RPLANE
#ZDHOLD=#ZMOVE
#ZLHOLD=#ZLEVEL
#ZCHOLD=ZCLEAR
#CYCNUM=203

%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*************************************************
*	*	Tab Name	:	Thread Mill Cycles   		*
*	*************************************************
*
*
%PROCEDURE=CODECON_THREAD_CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Thread Mill Cycle	*****>
@NO_CON-DEBUG

* Set Minor Diameter value
#TMP=THREADDEPTH
%IF #MACRO=37 %THEN #TMP=FIELD5
#TMP=#TMP*2
#THREADMIN=#THREADDIA-#TMP

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<2433>Thread Mill Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^DRILLGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RAPIDGCODE^ZCLEAR^RPLANE^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^SPINDIR^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^NUMTURNS^T-MILL-TYPE^T-MILL-HAND^T-MILL-DIA^T-MILL-MINOR^T-MILL-TDEPTH^T-MILL-LEAD^T-MILL-PITCH^T-MILL-STARTS^T-MILL-START_ANGLE^T-MILL-TAPER^T-MILL-ZDEPTH^T-MILL-APPROACH^T-MILL-MODE^T-MILL-RETR^T-MILL-LEVEL^T-MILL-CLEAR^T-MILL-FEED^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^
;Default Sequence^;CODE:<* THREAD MILL CYCLE FORMAT NOT SET UP>
;TEXT^T-MILL-TYPE Uses #THRDINOUT - 1 for Internal, 2 for External
;TEXT^T-MILL-MODE Uses #THRDCLIMB - 1 for Climb, -1 for Upcut
;TEXT^PITCH and LEAD are the same in Macro37 cycles
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
<* THREAD MILL CYCLE FORMAT NOT SET UP>











%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


*
*	*************************************************
*	*	Tab Name	:	Hole Cycle Points			*
*	*************************************************
*
*
%PROCEDURE=CODECON_HOLE-CYCLEPOINTS
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Hole Cycle Points	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

*******************
%IF $CYCLETYPE<>TAPPING @CALL
%IF #PTCYPECKTAP=0 @CALL
%IF DEPTH=0 @CALL
%IF #DEPTH=#FUNNY @CALL
*
* Repeated calls for Peck Tapping
#TAPDEPTH=#ZDEPTHOUT*#ZREVERSE
#ZMOVEA=ZLEVEL
#TAPCOUNT=ZLEVEL-ZDEPTH
%IF ZLEVEL=#FUNNY %THEN #ZMOVEA=ZPOINT(#LOOP):#TAPCOUNT=ZPOINT(#LOOP)-MZDEPTH(#LOOP)
%IF #LOOP=1 %THEN #ZMOVEA=#ZMOVEA-DEPTH  ; First hole has definition line
*
#TAPCOUNT=ABS(#TAPCOUNT)
#TAPCOUNT=#TAPCOUNT/DEPTH
#TAPCOUNT2=INT(#TAPCOUNT)
%IF #TAPCOUNT2<>#TAPCOUNT %THEN #TAPCOUNT2=#TAPCOUNT2+1
%IF #LOOP>1 %THEN #TAPCOUNT2=#TAPCOUNT2+1
@HERE
#TAPCOUNT=#TAPCOUNT2
*
@REPEAT
#TAPCOUNT=#TAPCOUNT-1
#ZMOVEA=#ZMOVEA-DEPTH
#ZDEPTHOUT=#ZMOVEA*#ZREVERSE
%IF #TAPCOUNT=1 %THEN #ZDEPTHOUT=#TAPDEPTH*#ZREVERSE
*
@CALL
*******************


;Sequence Definition^<602>Hole Cycle Points^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^CYCLEGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RAPIDGCODE^ZCLEAR^RPLANE^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^COOLANT^COOLTHROTOOL^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^SPINDIR^CYCLEDWELLTIME^DWELLGCODE^PECKDEPTH^PECKSAFE^DEGRESSION^PITCH^BORESTANDOFF^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[XMOVE]^[YMOVE]^[ZMOVE]^[ZDEPTH]^[RPLANE]
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][#RPLANE=40]>









%IF $CYCLETYPE<>TAPPING @END
%IF #PTCYPECKTAP=0 @END
%IF DEPTH=0 @END
%IF #DEPTH=#FUNNY @END
%IF #TAPCOUNT>1 @REPEAT
#ZDEPTHOUT=#TAPDEPTH*#ZREVERSE

@END
%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*
*	*************************************************
*	*	Tab Name	:	Back Cycle Points			*
*	*************************************************
*
*
%PROCEDURE=CODECON_BACK-CYCLEPOINTS
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Back Bore / Face Cycle Points	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<4413>Back Bore / Face Cycle Points^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^CYCLEGCODE^XMOVE^YMOVE^ZMOVE^CYCLEAXIS^ZDEPTH^RAPIDGCODE^ZCLEAR^RPLANE^CYCLEZFEED^RETRACTGCODE^RETRACTMCODE^PLANEGCODE^FEEDMODEGCODE^LENGTHOFFSET^BOTTOMZCLEAR^BOTTOMZLEVEL^BOTTOMCBORE^BOTTOMZDEPTH^ZRELIEF^RELIEFDIR^RELIEFDIST^COOLANT^COOLTHROTOOL^CYCLESPEED^GEARMCODE^N-SUBSTART^N-SUBEND^MC-COORDS^SPINDIR^CYCLEDWELLTIME^DWELLGCODE^DEGRESSION^BORESTANDOFF^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[XMOVE]^[YMOVE]^[ZMOVE]^[ZDEPTH]^[BOTTOMZCLEAR]
;TEXT^This code constructor is only used if allowed on NC-Style/Holes
;TEXT^MC Coords/Angled Heads may need CYCLEAXIS and blank depth address.
;TEXT^Token ZDEPTH now uses variable #ZDEPTHOUT
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#ZDEPTHOUT=31][BOTTOMZCLEAR=42]>










@END
%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*
*	*************************************************
*	*	Tab Name	:	Cancel Canned Cycle			*
*	*************************************************
*
*
%PROCEDURE=CODECON_CANCEL-CANNED-CYCLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Cancel Canned Cycle	*****>
@NO_CON-DEBUG

%IF #CYCLEPOINTSHOLD<>#FUNNY %THEN #CYCLEPOINTS=#CYCLEPOINTSHOLD  ; Reset value (tapping)

;Sequence Definition^<519>Cancel Canned Cycle^-1^<415>Hole Cycles^
;Use Tokens^DELETE^BLKNUM^ENDCYCLEGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[ENDCYCLEGCODE]
%CALL=PT_BINC
#CYCLEGCODE=DATA1(35)
<[#DELETE=29][#BNUM=25][#CYCLEGCODE=30]>



%ENDM

*
*	*****************************************
*	*	Tab Name	:	First Toolchange	*
*	*****************************************
*
%PROCEDURE=CODECON_FIRST-TOOLCHANGE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	First Toolchange	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET

;Sequence Definition^<444>First Toolchange^-1^<905>Toolchange^
;Use Tokens^TOOLCHANGE^HIGHSPEED BLOCK^RESET_SPINDLE^SPEED-DWELL^PROBE_MODE^DELETE^BLKNUM^SAFEBLKNUM^OPSTOP^ABS-INC^TOOLDESCR^TOOLTYPE^COMMENT^TURRETNO^LENGTHOFFSET^SPEED^NEXTTOOL^COOLANT^COOLANT OFF^COMP OFF^COOLTHROTOOL^SPINDIR^WORKGCODE^DYNAMICGCODE^RAPIDGCODE^PLANEGCODE^PROGID^PROGDESCR^FEEDMODEGCODE^XTOOL^YTOOL^ZTOOL^ZGAUGELENGTH^GEARMCODE^SETTOOLGCODE^TOOLRADIUS^TOOLDIAM^UNITSGCODE^TOOLUNITS^3D_CCR^3D_TR^TSTORE_USER1^TSTORE_USER2^TSTORE_STRING1^TSTORE_STRING2^TOOL_GROUP^TOOL_GROUP_NUMBER^TOOL_GROUP_TEXT^TOOL_ID^TOOL_ID_NUMBER^TOOL_ID_TEXT^NEXT_COMMENT^NEXT_DESCRIPTION^NEXT_GROUP^NEXT_GROUP_NUMBER^NEXT_GROUP_TEXT^NEXT_ID^NEXT_ID_NUMBER^NEXT_ID_TEXT^HOLDER_TYPE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G97^[<C>FEEDMODEGCODE]
;Default Sequence^[DELETE]^[BLKNUM]^ G58 X0.0 Y0.0 Z0.0
;Default Sequence^[TOOLCHANGE]
;TEXT^PROBE_MODE Token acts modally to call code constructors
;TEXT^Use SPEED-DWELL after speed output to calculate and output dwell
;TEXT^Use DYNAMICGCODE next to WORKGCODE to correctly activate modes
%CALL=PT_BINC
%CANCEL=#FEEDMODEGCODE
<[#DELETE=29][#BNUM=25] G97[#FEEDMODEGCODE=24]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G58 X0.0 Y0.0 Z0.0>
%CALL=CODECON_CORETC



%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*****************************************
*	*	Tab Name	:	General Toolchange	*
*	*****************************************
*
%PROCEDURE=CODECON_GENERAL-TOOLCHANGE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	General Toolchange	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET

;Sequence Definition^<445>General Toolchange^-1^<905>Toolchange^
;Use Tokens^TOOLCHANGE^HIGHSPEED BLOCK^RESET_SPINDLE^SPEED-DWELL^PROBE_MODE^DELETE^BLKNUM^SAFEBLKNUM^OPSTOP^ABS-INC^TOOLDESCR^TOOLTYPE^COMMENT^TURRETNO^LENGTHOFFSET^SPEED^NEXTTOOL^COOLANT^COOLANT OFF^COMP OFF^COOLTHROTOOL^SPINDIR^WORKGCODE^DYNAMICGCODE^RAPIDGCODE^PLANEGCODE^PROGID^PROGDESCR^FEEDMODEGCODE^XTOOL^YTOOL^ZTOOL^ZGAUGELENGTH^GEARMCODE^SETTOOLGCODE^TOOLRADIUS^TOOLDIAM^UNITSGCODE^TOOLUNITS^3D_CCR^3D_TR^TSTORE_USER1^TSTORE_USER2^TSTORE_STRING1^TSTORE_STRING2^TOOL_GROUP^TOOL_GROUP_NUMBER^TOOL_GROUP_TEXT^TOOL_ID^TOOL_ID_NUMBER^TOOL_ID_TEXT^NEXT_COMMENT^NEXT_DESCRIPTION^NEXT_GROUP^NEXT_GROUP_NUMBER^NEXT_GROUP_TEXT^NEXT_ID^NEXT_ID_NUMBER^NEXT_ID_TEXT^HOLDER_TYPE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[TOOLCHANGE]
;TEXT^PROBE_MODE Token acts modally to call code constructors
;TEXT^Use SPEED-DWELL after speed output to calculate and output dwell
;TEXT^Use DYNAMICGCODE next to WORKGCODE to correctly activate modes
%CALL=CODECON_CORETC



%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*****************************************
*	*	Tab Name	:	Last Toolchange		*
*	*****************************************
*
%PROCEDURE=CODECON_LAST-TOOLCHANGE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Last Toolchange	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET

;Sequence Definition^<591>Last Toolchange^-1^<905>Toolchange^
;Use Tokens^TOOLCHANGE^HIGHSPEED BLOCK^RESET_SPINDLE^SPEED-DWELL^PROBE_MODE^DELETE^BLKNUM^SAFEBLKNUM^OPSTOP^ABS-INC^TOOLDESCR^TOOLTYPE^COMMENT^TURRETNO^LENGTHOFFSET^SPEED^FIRSTTOOL^COOLANT^COOLANT OFF^COMP OFF^COOLTHROTOOL^SPINDIR^WORKGCODE^DYNAMICGCODE^RAPIDGCODE^PLANEGCODE^PROGID^PROGDESCR^FEEDMODEGCODE^XTOOL^YTOOL^ZTOOL^ZGAUGELENGTH^GEARMCODE^SETTOOLGCODE^TOOLRADIUS^TOOLDIAM^UNITSGCODE^TOOLUNITS^3D_CCR^3D_TR^TSTORE_USER1^TSTORE_USER2^TSTORE_STRING1^TSTORE_STRING2^TOOL_GROUP^TOOL_GROUP_NUMBER^TOOL_GROUP_TEXT^TOOL_ID^TOOL_ID_NUMBER^TOOL_ID_TEXT^NEXT_COMMENT^NEXT_DESCRIPTION^NEXT_GROUP^NEXT_GROUP_NUMBER^NEXT_GROUP_TEXT^NEXT_ID^NEXT_ID_NUMBER^NEXT_ID_TEXT^HOLDER_TYPE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[TOOLCHANGE]
;TEXT^PROBE_MODE Token acts modally to call code constructors
;TEXT^Use SPEED-DWELL after speed output to calculate and output dwell
;TEXT^Use DYNAMICGCODE next to WORKGCODE to correctly activate modes
%CALL=CODECON_CORETC



%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*
*	*****************************************
*	*	Tab Name	:	Core Toolchange	*
*	*****************************************
*
%PROCEDURE=CODECON_CORETC
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Core Toolchange	*****>
@NO_CON-DEBUG

%CALL=PT_SET_ATTACHMENT

%IF #MANUAL=0 @GO
%IF TOOLMANUAL=1 %THEN %CALL=CODECON_MANUALTC:%GOTO @END
%IF #CURRENTMANUAL=1 %THEN %CALL=CODECON_MANUALTC
@GO

;Sequence Definition^<2042>Core Toolchange^-1^<905>Toolchange^
;Use Tokens^HIGHSPEED BLOCK^RESET_SPINDLE^SPEED-DWELL^PROBE_MODE^DELETE^BLKNUM^SAFEBLKNUM^OPSTOP^ABS-INC^TOOLDESCR^TOOLTYPE^COMMENT^TURRETNO^LENGTHOFFSET^SPEED^NEXTTOOL^COOLANT^COOLANT OFF^COMP OFF^COOLTHROTOOL^SPINDIR^WORKGCODE^DYNAMICGCODE^RAPIDGCODE^PLANEGCODE^PROGID^PROGDESCR^FEEDMODEGCODE^XTOOL^YTOOL^ZTOOL^ZGAUGELENGTH^GEARMCODE^SETTOOLGCODE^TOOLRADIUS^TOOLDIAM^UNITSGCODE^3D_CCR^3D_TR^TSTORE_USER1^TSTORE_USER2^TSTORE_STRING1^TSTORE_STRING2^TOOL-ANGLE^TOOLUNITS^TOOL_GROUP^TOOL_GROUP_NUMBER^TOOL_GROUP_TEXT^TOOL_ID^TOOL_ID_NUMBER^TOOL_ID_TEXT^NEXT_COMMENT^NEXT_DESCRIPTION^NEXT_GROUP^NEXT_GROUP_NUMBER^NEXT_GROUP_TEXT^NEXT_ID^NEXT_ID_NUMBER^NEXT_ID_TEXT^HOLDER_TYPE^WORKPLANECODE^CANCELWORKPLANE^EULER-1^EULER-2^EULER-3^MOUNT-ANGLE^HEAD-ANGLE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[<C>TURRETNO]^[<C>LENGTHOFFSET]^(^[TOOLDESCR]^)
;Default Sequence^[DELETE]^[BLKNUM]^[<C>SPEED]^[<C>SPINDIR]
;TEXT^PROBE_MODE Token acts modally to call code constructors
;TEXT^Use SPEED-DWELL after speed output to calculate and output dwell
;TEXT^Use DYNAMICGCODE next to WORKGCODE to correctly activate modes
%CALL=PT_BINC
%CANCEL=POSITION
%CANCEL=#HCODE
%IF TOOLNUM=0 %THEN $TOOLDESCRIPTION=USERDEFINEDSTRING %ELSE $TOOLDESCRIPTION=TOOLDESCRIPTION
<[#DELETE=29][#BNUM=25][POSITION=15][#HCODE=16]([$TOOLDESCRIPTION])>
%CALL=PT_BINC
%CANCEL=#SPEED
%CANCEL=#DIRECTION
<[#DELETE=29][#BNUM=25][#SPEED=8][#DIRECTION=23]>



@END
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*
*	*****************************************
*	*	Tab Name	:	Manual Toolchange	*
*	*****************************************
*
%PROCEDURE=CODECON_MANUALTC
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Manual Toolchange	*****>
@NO_CON-DEBUG

;Sequence Definition^<3881>Manual Toolchange^-1^<905>Toolchange^
;Use Tokens^HIGHSPEED BLOCK^RESET_SPINDLE^SPEED-DWELL^PROBE_MODE^DELETE^BLKNUM^SAFEBLKNUM^OPSTOP^PROGSTOP^SPINDLE STOP^SPINDLE RESTART^ABS-INC^TOOLDESCR^TOOLTYPE^COMMENT^TURRETNO^LENGTHOFFSET^SPEED^NEXTTOOL^COOLANT^COOLANT OFF^COMP OFF^COOLTHROTOOL^SPINDIR^WORKGCODE^DYNAMICGCODE^RAPIDGCODE^PLANEGCODE^PROGID^PROGDESCR^FEEDMODEGCODE^XTOOL^YTOOL^ZTOOL^ZGAUGELENGTH^GEARMCODE^SETTOOLGCODE^TOOLRADIUS^TOOLDIAM^UNITSGCODE^3D_CCR^3D_TR^TSTORE_USER1^TSTORE_USER2^TSTORE_STRING1^TSTORE_STRING2^TOOL-ANGLE^TOOLUNITS^TOOL_GROUP^TOOL_GROUP_NUMBER^TOOL_GROUP_TEXT^TOOL_ID^TOOL_ID_NUMBER^TOOL_ID_TEXT^NEXT_COMMENT^NEXT_DESCRIPTION^NEXT_GROUP^NEXT_GROUP_NUMBER^NEXT_GROUP_TEXT^NEXT_ID^NEXT_ID_NUMBER^NEXT_ID_TEXT^HOLDER_TYPE^WORKPLANECODE^CANCELWORKPLANE^EULER-1^EULER-2^EULER-3^MOUNT-ANGLE^HEAD-ANGLE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE STOP]^[COOLANT OFF]
;Default Sequence^;CODE:%IF #CURRENTMANUAL=1 @MOVE
;Default Sequence^[DELETE]^[BLKNUM]^ T00 M06 ( Unload ATC )
;Default Sequence^
;Default Sequence^;CODE:@MOVE
;Default Sequence^
;Default Sequence^;CODE:* Move to Manual TC Position
;Default Sequence^[DELETE]^[BLKNUM]^[RAPIDGCODE]^ Y-500
;Default Sequence^[DELETE]^[BLKNUM]^ Z460
;Default Sequence
;Default Sequence^;CODE:%IF #CURRENTMANUAL<>1 @LOAD
;Default Sequence^[DELETE]^[BLKNUM]^ (MANUAL UNLOAD)
;Default Sequence^;CODE:%IF TOOLMANUAL=1 @LOAD
;Default Sequence^[DELETE]^[BLKNUM]^[PROGSTOP]
;Default Sequence^
;Default Sequence^;CODE:* Move to ATC Position, Z First
;Default Sequence^[DELETE]^[BLKNUM]^[RAPIDGCODE]^[ZTOOL]
;Default Sequence^;CODE:%CALL=CODECON_RAPID-TO-TOOLCHANGE
;Default Sequence^[RESET_SPINDLE]
;Default Sequence^;CODE:%GOTO @ENDCODE
;Default Sequence^
;Default Sequence^;CODE:@LOAD
;Default Sequence
;Default Sequence^[DELETE]^[BLKNUM]^ (MANUAL TOOLCHANGE)
;Default Sequence^[DELETE]^[BLKNUM]^ (LOAD ^[TOOLDESCR]^)
;Default Sequence^;CODE:%IF HEADANGLE=0 @NO_HEAD
;Default Sequence^[DELETE]^[BLKNUM]^ (^[HEAD-ANGLE]^ DEG ANGLED HEAD, MOUNTED AT ^[MOUNT-ANGLE]^)
;Default Sequence^;CODE:@NO_HEAD
;Default Sequence^[DELETE]^[BLKNUM]^ (^[COMMENT]^)
;Default Sequence^[DELETE]^[BLKNUM]^[PROGSTOP]
;Default Sequence^
;Default Sequence^[DELETE]^[SAFEBLKNUM]^[<C>UNITSGCODE]^[<C>ABS-INC]^[<C>COMP OFF]^[<C>FEEDMODEGCODE]
;Default Sequence^[DELETE]^[BLKNUM]^[<C>WORKGCODE]
;Default Sequence^[DELETE]^[BLKNUM]^[<C>SPEED]^[<C>SPINDLE RESTART]^[<C>GEARMCODE]^[COOLTHROTOOL]
;Default Sequence^[DELETE]^[BLKNUM]^[PLANEGCODE]
;Default Sequence^[HIGHSPEED BLOCK]
;Default Sequence^;CODE:@ENDCODE
;TEXT^PROBE_MODE Token acts modally to call code constructors
;TEXT^Manual Toolchange called if option checked in NC Style
;TEXT^Note that this structure may change in future releases
;TEXT^Manual Toolchange set at Y-500, Z460 (vertical machine)
;TEXT^Use SPEED-DWELL after speed output to calculate and output dwell
;TEXT^Use DYNAMICGCODE next to WORKGCODE to correctly activate modes
%CALL=PT_BINC
%IF #DIRECTION<>DATA2(4) %THEN #DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4)
#COOLHOLD=#COOL:#COOL=DATA2(10)
<[#DELETE=29][#BNUM=25][#DIRECTION=23][#COOL=23]>
#COOL=#COOLHOLD
%IF #CURRENTMANUAL=1 @MOVE
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] T00 M06 ( Unload ATC )>
@MOVE
* Move to Manual TC Position
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#GCODE=24] Y-500>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] Z460>
< >
%IF #CURRENTMANUAL<>1 @LOAD
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] (MANUAL UNLOAD)>
%IF TOOLMANUAL=1 @LOAD
%CALL=PT_BINC
#STOPMCODE=DATA2(1)
<[#DELETE=29][#BNUM=25][#STOPMCODE=23]>
* Move to ATC Position, Z First
%CALL=PT_BINC
#USEDTOKEN=#TRUE
<[#DELETE=29][#BNUM=25][#GCODE=24][#ZMOVE=2]>
%CALL=CODECON_RAPID-TO-TOOLCHANGE
%CALL=PT_RESET_SPINDLE
%GOTO @ENDCODE
@LOAD
< >
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] (MANUAL TOOLCHANGE)>
%CALL=PT_BINC
%IF TOOLNUM=0 %THEN $TOOLDESCRIPTION=USERDEFINEDSTRING %ELSE $TOOLDESCRIPTION=TOOLDESCRIPTION
<[#DELETE=29][#BNUM=25] (LOAD [$TOOLDESCRIPTION])>
%IF HEADANGLE=0 @NO_HEAD
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] ([#HEADANG=92] DEG ANGLED HEAD, MOUNTED AT [#MOUNTANG=93])>
@NO_HEAD
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] ([USERDEFINEDSTRING])>
%CALL=PT_BINC
#STOPMCODE=DATA2(1)
<[#DELETE=29][#BNUM=25][#STOPMCODE=23]>
%CALL=PT_SBINC
%CANCEL=#UNITSGCODE
%CANCEL=#ABSINC
#COMPGCODE=DATA1(20)
%CANCEL=#COMPGCODE
%CANCEL=#FEEDMODEGCODE
<[#DELETE=29][#SBNUM=26][#UNITSGCODE=24][#ABSINC=24][#COMPGCODE=24][#FEEDMODEGCODE=24]>
%CALL=PT_BINC
%CANCEL=#WORKGCODE
<[#DELETE=29][#BNUM=25][#WORKGCODE=27]>
%CALL=PT_BINC
%CANCEL=#SPEED
#DIRECTION=#DIRHOLD2
%CANCEL=#DIRECTION
%CANCEL=#GEARMCODE
<[#DELETE=29][#BNUM=25][#SPEED=8][#DIRECTION=23][#GEARMCODE=23][#THROUGHTOOL1=23]>
#DIRHOLD=DIRECTION
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#PLANEGCODE=24]>
%IF USERVAR8=3 %THEN %CALL=CODECON_HIGHSPEED-ON:%IF USERVAR8=2 %THEN %CALL=CODECON_HIGHSPEED-OFF
@ENDCODE

* Sequence - All Stop

* Sequence - Unload ATC
* Sequence - Move to Manual TC Position
* Sequence - Unload Manual
* Sequence - Move to ATC Position
* Sequence - Load Manual
* Sequence - Re-Start



#CURRENTMANUAL=TOOLMANUAL ; Current tool is manually loaded

@END
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*****************************************
*	*	Tab Name	:	Spindle				*
*	*****************************************
*
%PROCEDURE=CODECON_SPINDLE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Spindle	*****>
@NO_CON-DEBUG

%IF #SPEED<>#SPEEDHOLD @GO
%IF #COMINED=1 @COMB
%IF #COOL<>#COOLHOLD @GO
@COMB
%IF DIRECTION=#DIRHOLD @END
* manual toolchanges start and restart spindle on their own
* but do not update DIRECTION
* in this unique circumstance try use direction hold
%IF TOOLMANUAL=0 @GO
%IF TOOLMANUAL<>#CURRENTMANUAL @GO
%IF #DIRECTION=#DIRECTIONHOLD @END

@GO
;Sequence Definition^<446>Spindle^-1^<917>Miscellaneous Functions^
;Use Tokens^SPEED-DWELL^DELETE^BLKNUM^STOPMCODE^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPEED]^[SPINDIR]^[GEARMCODE]^[COOLANT]^[COOLTHROTOOL]
;TEXT^Use SPEED-DWELL after speed output to calculate and output dwell
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#SPEED=8][#DIRECTION=23][#GEARMCODE=23][#COOL=23][#THROUGHTOOL1=23]>



#SPEEDHOLD=#SPEED
#DIRHOLD=DIRECTION
* Manual unload resets spindle to off
%IF #CURRENTMANUAL=0 @END
%IF #DIRECTION=DATA2(4) %THEN #DIRHOLD=1
@END
%IF $CONDEBUG=N @NO_CON-DEBUG2
<*     	 End            	:	Spindle	*****>
@NO_CON-DEBUG2
%ENDM
*
*	*****************************************
*	*	Tab Name	:	Program Stop		*
*	*****************************************
*
%PROCEDURE=CODECON_PROGRAM-STOP
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Program Stop	*****>
@NO_CON-DEBUG

;Sequence Definition^<45>Program Stop^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^STOPMCODE^SPINDLE OFF^COOLANT OFF^SPEED^SPINDIR^GEARMCODE^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE OFF]^[COOLANT OFF]
;Default Sequence^[DELETE]^[BLKNUM]^[STOPMCODE]
;Default Sequence^[DELETE]^[BLKNUM]^[COOLANT]^[<C>SPEED]^[SPINDIR]^[<C>GEARMCODE]
%CALL=PT_BINC
#DIRECTIONHOLD=#DIRECTION:#DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4):#SPEEDHOLD=0
#COOLHOLD=#COOL:#COOL=DATA2(10)
<[#DELETE=29][#BNUM=25][#DIRECTION=23][#COOL=23]>
#DIRECTION=#DIRECTIONHOLD:#DIRHOLD=1
#COOL=#COOLHOLD
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#STOPMCODE=23]>
%CALL=PT_BINC
%CANCEL=#SPEED
%CANCEL=#GEARMCODE
<[#DELETE=29][#BNUM=25][#COOL=23][#SPEED=8][#DIRECTION=23][#GEARMCODE=23]>



%ENDM
*
*	*****************************************
*	*	Tab Name	:	Coolant				*
*	*****************************************
*
%PROCEDURE=CODECON_COOLANT
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Coolant	*****>
@NO_CON-DEBUG

;Sequence Definition^<425>Coolant^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^COOLANT^COOLTHROTOOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^


%ENDM
*
*	*****************************************
*	*	Tab Name	:	Exact Stop			*
*	*****************************************
*
%PROCEDURE=CODECON_EXACT-STOP
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Exact Stop	*****>
@NO_CON-DEBUG

;Sequence Definition^<7>Exact Stop^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^EXACTSTOPGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^
;TEXT^Add output line for modal codes, leave blank for single shot



%ENDM
*
*	*****************************************
*	*	Tab Name	:	Feed / min / rev	*
*	*****************************************
*
%PROCEDURE=CODECON_FEED-MIN-REV
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Feed / Min / Rev	*****>
@NO_CON-DEBUG

;Sequence Definition^<447>Feed / Min / Rev^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^FEEDMODEGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[FEEDMODEGCODE]
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#FEEDMODEGCODE=24]>


%ENDM
*
*	*****************************************
*	*	Tab Name	:	Comment				*
*	*****************************************
*
%PROCEDURE=CODECON_COMMENT
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Comment	*****>
@NO_CON-DEBUG

;Sequence Definition^<448>Comment^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^COMMENT^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ (^[COMMENT]^)
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] ([USERDEFINEDSTRING])>


%ENDM



*
*	*****************************************
*	*	Tab Name	:	Insert NC Code		*
*	*****************************************
*
%PROCEDURE=CODECON_INSERT-NC-CODE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Insert Nc Code	*****>
@NO_CON-DEBUG

;Sequence Definition^<449>Insert Nc Code^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^COMMENT^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ ^[COMMENT]
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] [USERDEFINEDSTRING]>


%ENDM
*
*	*****************************************************
*	*	Tab Name	:	Re-Select Tool Length Offset	*
*	*****************************************************
*
%PROCEDURE=CODECON_SELECT-LENGTH-OFFSET
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Select Length Offset	*****>
@NO_CON-DEBUG

;Sequence Definition^<450>Select Length Offset^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^LENGTHOFFSET^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[LENGTHOFFSET]
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#HCODE=16]>


%ENDM
*
*	*****************************************************
*	*	Tab Name	:	High Speed M/c - ON				*
*	*****************************************************
*
%PROCEDURE=CODECON_HIGHSPEED-ON
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	High Speed Mode ON	*****>
@NO_CON-DEBUG

;Sequence Definition^<2896>High Speed Mode On^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^HIGHSPEED TOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G05 P1000 (HPCC mode ON)
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G05 P1000 (HPCC mode ON)>

%ENDM
*
*	*****************************************************
*	*	Tab Name	:	High Speed M/c - OFF			*
*	*****************************************************
*
%PROCEDURE=CODECON_HIGHSPEED-OFF
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	High Speed Mode OFF *****>
@NO_CON-DEBUG

;Sequence Definition^<2897>High Speed Mode Off^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^HIGHSPEED TOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G05 P0 (HPCC mode OFF)
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G05 P0 (HPCC mode OFF)>

%ENDM

*
*	*************************************************
*	*	Tab Name	:	Warnings        			*
*	*************************************************
*
%PROCEDURE=CODECON_WARNING

%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Warnings	*****>
@NO_CON-DEBUG

%IF MASK=0 %THEN #WARNCOUNT=#WARNCOUNT+1

;Sequence Definition^<1011>Warnings^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^WARNING^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^* ^[WARNING]
<* [$WARNING]>


%ENDM

*****************************************************
* Auxiliary Axes
*****************************************************




*
*	*****************************************
*	*	Tab Name	:	Rapid To Toolchange	*
*	*****************************************
*
%PROCEDURE=CODECON_RAPID-TO-TOOLCHANGE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Rapid To Toolchange	*****>
@NO_CON-DEBUG


* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<451>Rapid To Toolchange^-1^<902>General Motion^
;Use Tokens^SECOND_LEG^PROG_STOP^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^COMMENT^ABS-INC^FORCE-INC^RAPIDGCODE^MOVETCREF^X0^Y0^Z0^XTOOL^YTOOL^ZTOOL^XTOOLPOS^YTOOLPOS^ZTOOLPOS^ZINITIAL^COMPGCODE^CRC REGISTER^TURRETNO^NEXTTOOL^COOLANT OFF^COOLTHRTLOFF^COMP OFF^SPINDLE OFF^MC-COORDS^WORKGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence
;TEXT^First leg of move, always called. Add M functions etc here
;TEXT^Second leg called by token, allows more M codes to follow it.
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
;TEXTUSR^[DELETE][BLKNUM][RAPIDGCODE][XTOOL][YTOOL][ZTOOL]
;TEXTUSR^[DELETE][BLKNUM][SPINDLE OFF][COOLANT OFF][COOLTHRTLOFF]
;TEXTUSR^[PROBE_OFF]
;TEXTUSR^[SECOND_LEG]
















%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


%PROCEDURE=CODECON_RAPID-TO-TOOLCHANGE-2
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Rapid To Toolchange 2	*****>
@NO_CON-DEBUG

;Sequence Definition^<2047>Rapid To Toolchange 2^-1^<902>General Motion^
;Use Tokens^PROG_STOP^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^COMMENT^ABS-INC^FORCE-INC^RAPIDGCODE^MOVETCREF^X0^Y0^Z0^XTOOL^YTOOL^ZTOOL^XTOOLPOS^YTOOLPOS^ZTOOLPOS^ZINITIAL^COMPGCODE^CRC REGISTER^TURRETNO^NEXTTOOL^COOLANT OFF^COOLTHRTLOFF^COMP OFF^SPINDLE OFF^MC-COORDS^WORKGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RAPIDGCODE]^[XTOOL]^[YTOOL]^[ZTOOL]
;TEXT^Second leg called by token, allows more M codes to follow it.
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_BINC
#USEDTOKEN=#TRUE
#USEDTOKEN=#TRUE
#USEDTOKEN=#TRUE
<[#DELETE=29][#BNUM=25][#GCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2]>






%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*
*	*********************************************
*	*	Tab Name	:	Feed After Toolchange	*
*	*********************************************
*
%PROCEDURE=CODECON_FE-AFTER-TOOLCHANGE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Feed After Toolchange	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<3519>Feed After Toolchange^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^SAFEBLKNUM^ABS-INC^PLANEGCODE^FEEDMODEGCODE^FEEDGCODE^EXACTSTOPGCODE^PLANEGCODE^XMOVE^YMOVE^ZMOVE^ZINITIAL^TURRETNO^LENGTHOFFSET^NEXTTOOL^COOLANT^COOLTHROTOOL^SPEED^SPINDIR^GEARMCODE^WORKGCODE^CPLNAME^FEED^COMPGCODE^CRC REGISTER^UNITSGCODE^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[FEEDMODEGCODE]^[<C>FEEDGCODE]^[XMOVE]^[YMOVE]^[SPEED]^[GEARMCODE]^[FEED]
;Default Sequence^[DELETE]^[BLKNUM]^ G43^[<C>ZMOVE]^[<C>LENGTHOFFSET]^[<C>COOLANT]^[COOLTHROTOOL]
;Default Sequence^[DELETE]^[BLKNUM]^[PLANEGCODE]
;TEXT^First move after toolchange
;TEXT^Selected for TLO application in NC Style, Tool Change
%CALL=PT_BINC
%IF #EXACTSTOP=2 %THEN #GCODE=DATA1(10)
%CANCEL=#GCODE
<[#DELETE=29][#BNUM=25][#FEEDMODEGCODE=24][#GCODE=24][#XMOVE=0][#YMOVE=1][#SPEED=8][#GEARMCODE=23][#FEED=7]>
%CALL=PT_BINC
%CANCEL=#ZMOVE
%CANCEL=#HCODE
%CANCEL=#COOL
<[#DELETE=29][#BNUM=25] G43[#ZMOVE=2][#HCODE=16][#COOL=23][#THROUGHTOOL1=23]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#PLANEGCODE=24]>













%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

%PROCEDURE=CODECON_Z-AFTER-TC-FEED
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	First Z After Toolchange (Feed)	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<3805>First Z After Toolchange (Feed)^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^SAFEBLKNUM^ABS-INC^FEEDMODEGCODE^FEEDGCODE^EXACTSTOPGCODE^PLANEGCODE^XMOVE^YMOVE^ZMOVE^ZINITIAL^TURRETNO^LENGTHOFFSET^NEXTTOOL^COOLANT^COOLTHROTOOL^SPEED^SPINDIR^GEARMCODE^WORKGCODE^CPLNAME^FEED^COMPGCODE^CRC REGISTER^UNITSGCODE^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[FEEDMODEGCODE]^ G43^[<C>FEEDGCODE]^[XMOVE]^[YMOVE]^[<C>ZMOVE]^[<C>LENGTHOFFSET]^[<C>COOLANT]^[COOLTHROTOOL]^[SPEED]^[GEARMCODE]^[FEED]
;Default Sequence^[DELETE]^[BLKNUM]^[PLANEGCODE]
;TEXT^First Z move after toolchange
;TEXT^Selected for TLO application in NC Style, Tool Change
%CALL=PT_BINC
%IF #EXACTSTOP=2 %THEN #GCODE=DATA1(10)
%CANCEL=#GCODE
%CANCEL=#ZMOVE
%CANCEL=#HCODE
%CANCEL=#COOL
<[#DELETE=29][#BNUM=25][#FEEDMODEGCODE=24] G43[#GCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#HCODE=16][#COOL=23][#THROUGHTOOL1=23][#SPEED=8][#GEARMCODE=23][#FEED=7]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#PLANEGCODE=24]>














%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

*
*	*********************************************
*	*	Tab Name	:	Rapid After Toolchange	*
*	*********************************************
*
%PROCEDURE=CODECON_RA-AFTER-TOOLCHANGE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Rapid After Toolchange	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<452>Rapid After Toolchange^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^SAFEBLKNUM^ABS-INC^RAPIDGCODE^PLANEGCODE^XMOVE^YMOVE^ZMOVE^ZINITIAL^TURRETNO^LENGTHOFFSET^NEXTTOOL^COOLANT^COOLTHROTOOL^SPEED^SPINDIR^GEARMCODE^WORKGCODE^CPLNAME^FEEDMODEGCODE^FEED^COMPGCODE^CRC REGISTER^UNITSGCODE^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[<C>RAPIDGCODE]^[<C>XMOVE]^[<C>YMOVE]^[SPEED]
;Default Sequence^[DELETE]^[BLKNUM]^[<C>ZMOVE]
;TEXT^First move after toolchange
;TEXT^Selected for TLO application in NC Style, Tool Change
%CALL=PT_BINC
%CANCEL=#GCODE
%CANCEL=#XMOVE
%CANCEL=#YMOVE
<[#DELETE=29][#BNUM=25][#GCODE=24][#XMOVE=0][#YMOVE=1][#SPEED=8]>
%CALL=PT_BINC
%CANCEL=#ZMOVE
<[#DELETE=29][#BNUM=25][#ZMOVE=2]>















%CALL=HOLD
@END
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL

%PROCEDURE=CODECON_Z-AFTER-TC-RAPID
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	First Z After Toolchange (Rapid)	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE


;Sequence Definition^<3806>First Z After Toolchange (Rapid)^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^SAFEBLKNUM^ABS-INC^RAPIDGCODE^PLANEGCODE^XMOVE^YMOVE^ZMOVE^ZINITIAL^TURRETNO^LENGTHOFFSET^NEXTTOOL^COOLANT^COOLTHROTOOL^SPEED^SPINDIR^GEARMCODE^WORKGCODE^CPLNAME^FEEDMODEGCODE^FEED^COMPGCODE^CRC REGISTER^UNITSGCODE^MC-COORDS^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[<C>RAPIDGCODE]^ G43^[XMOVE]^[YMOVE]^[<C>ZMOVE]^[<C>LENGTHOFFSET]^[<C>COOLANT]^[COOLTHROTOOL]^[SPEED]^[GEARMCODE]
;Default Sequence^[DELETE]^[BLKNUM]^[PLANEGCODE]
;TEXT^First Z move after toolchange
;TEXT^Selected for TLO application in NC Style, Tool Change
%CALL=PT_BINC
%CANCEL=#GCODE
%CANCEL=#ZMOVE
%CANCEL=#HCODE
%CANCEL=#COOL
<[#DELETE=29][#BNUM=25][#GCODE=24] G43[#XMOVE=0][#YMOVE=1][#ZMOVE=2][#HCODE=16][#COOL=23][#THROUGHTOOL1=23][#SPEED=8][#GEARMCODE=23]>
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#PLANEGCODE=24]>














%CALL=HOLD
@END
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*	*****************************************
*	*	Tab Name	:	Rapid To Home		*
*	*****************************************
*
%PROCEDURE=CODECON_RAPID-TO-HOME
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Rapid To Home	*****>
@NO_CON-DEBUG

* Output speed block ?
%CALL=PT_SPEED_SET
%IF #SPINBLOCK=1 %THEN %CALL=CODECON_SPINDLE

;Sequence Definition^<453>Rapid To Home^-1^<902>General Motion^
;Use Tokens^SECOND_LEG^PROG_STOP^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^COMMENT^OPSTOP^RAPIDGCODE^MOVEHOMEREF^ABS-INC^FORCE-INC^X0^Y0^Z0^XHOME^YHOME^ZHOME^XHOMEPOS^YHOMEPOS^ZHOMEPOS^ZINITIAL^COMPGCODE^CRC REGISTER^TURRETNO^NEXTTOOL^COOLANT OFF^COOLTHRTLOFF^COMP OFF^SPINDLE OFF^MC-COORDS^WORKGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RAPIDGCODE]^[XHOME]^[YHOME]^[ZHOME]
;Default Sequence^[DELETE]^[BLKNUM]^[SPINDLE OFF]^[COOLANT OFF]^[COOLTHRTLOFF]
;Default Sequence^[PROBE_OFF]
;Default Sequence^[SECOND_LEG]
;TEXT^First leg of move, always called. Add M functions etc here
;TEXT^Second leg called by token, allows more M codes to follow it.
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_BINC
#USEDTOKEN=#TRUE
#USEDTOKEN=#TRUE
#USEDTOKEN=#TRUE
<[#DELETE=29][#BNUM=25][#GCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2]>
%CALL=PT_BINC
#DIRECTIONHOLD=#DIRECTION:#DIRHOLD2=#DIRECTION:#DIRECTION=DATA2(4):#SPEEDHOLD=0
#COOLHOLD=#COOL:#COOL=DATA2(10)
#THROUGHTOOL1=#THROUGHTOOL1OFF
<[#DELETE=29][#BNUM=25][#DIRECTION=23][#COOL=23][#THROUGHTOOL1=23]>
#DIRECTION=#DIRECTIONHOLD:#DIRHOLD=1
#COOL=#COOLHOLD
%CALL=PT_PROBE_OFF
%CALL=PT_RAPID_TO_HOME_TOOLCHANGE_2















%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


%PROCEDURE=CODECON_RAPID-TO-HOME-2
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Rapid To Home 2	*****>
@NO_CON-DEBUG

;Sequence Definition^<2048>Rapid To Home 2^-1^<902>General Motion^
;Use Tokens^PROG_STOP^DELETE^BLKNUM^COMMENT^OPSTOP^RAPIDGCODE^MOVEHOMEREF^ABS-INC^FORCE-INC^X0^Y0^Z0^XHOME^YHOME^ZHOME^XHOMEPOS^YHOMEPOS^ZHOMEPOS^ZINITIAL^COMPGCODE^CRC REGISTER^TURRETNO^NEXTTOOL^COOLANT OFF^COOLTHRTLOFF^COMP OFF^SPINDLE OFF^MC-COORDS^WORKGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[RAPIDGCODE]^[XHOME]^[YHOME]^[ZHOME]
;TEXT^Second leg called by token, allows more M codes to follow it.
%CALL=PT_BINC
#USEDTOKEN=#TRUE
#USEDTOKEN=#TRUE
#USEDTOKEN=#TRUE
<[#DELETE=29][#BNUM=25][#GCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2]>






%CALL=HOLD
%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL


*
*
*	*************************************************
*	*	Tab Name	:	Set Work Datums				*
*	*************************************************
*
%PROCEDURE=CODECON_SET-WORK-DATUMS
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Set Work Datums	*****>
@NO_CON-DEBUG

;Sequence Definition^<593>Set Work Datums^-1^<919>Datum Shifting^
;Use Tokens^DELETE^BLKNUM^WORKGCODE^WORKGCODE2^WORKREGISTER^DATUM_TYPE^CPLNAME^XABSORIGIN^YABSORIGIN^ZABSORIGIN^XMCORIGIN^YMCORIGIN^ZMCORIGIN^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence
;TEXT^Use XABSORIGIN etc for Table/Table and XMCORIGIN etc for Head/Head
;TEXT^WORKGCODE holds the calculated work offset
;TEXT^WORKGCODE2 holds the calculated work offset but allows for override
;TEXTUSR^[DELETE][BLKNUM] G10 [DATUM_TYPE][<C>WORKREGISTER][XABSORIGIN][YABSORIGIN][ZABSORIGIN] ([CPLNAME])




%ENDM
;CGXTAB^AX3^3 Axis Mill^3AXMILL
*
*
*	*************************************************
*	*	Tab Name	:	Select Work Datums			*
*	*************************************************
*
%PROCEDURE=CODECON_SELECT-WORK-DATUMS
*
*	Datum Shift- no rotary motion
*   Called from Datum Shift and Index Pallet commands for Absolute Datum setting
*	Index Pallet with Rotary output via Index Pallet Code Constructor.
*
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Select Work Datums	*****>
@NO_CON-DEBUG

%IF #CURRENTCPL=#FUNNY %THEN #CURRENTCPL=1
#TEMPDIR=DIRECTION
%GETCPL=#CURRENTCPL
DIRECTION=#TEMPDIR

;Sequence Definition^<594>Select Work Datums^-1^<919>Datum Shifting^
;Use Tokens^DELETE^BLKNUM^PRESETGCODE^WORKGCODE^DYNAMICGCODE^XABSORIGIN^YABSORIGIN^ZABSORIGIN^XMCORIGIN^YMCORIGIN^ZMCORIGIN^XINC^YINC^ZINC^CPLNAME^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[WORKGCODE]^ (^[CPLNAME]^)
;TEXT^Use XABSORIGIN etc for Table/Table and XMCORIGIN etc for Head/Head
;TEXT^Use DYNAMICGCODE next to WORKGCODE to correctly activate modes
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#WORKGCODE=27] ([$CPLNAME])>



%ENDM

%PROCEDURE=CODECON_INCR_DATUM_SHIFT
*
*	Datum Shift- no rotary motion
*   Called from Datum Shift and Index Pallet commands for Incremental Datum setting
*	Index Pallet with Rotary output via Index Pallet Code Constructor.
*
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Incremental Datum Shift	*****>
@NO_CON-DEBUG

;Sequence Definition^<1770>Incremental Datum Shift^-1^<919>Datum Shifting^
;Use Tokens^DELETE^BLKNUM^PRESETGCODE^WORKGCODE^XABSORIGIN^YABSORIGIN^ZABSORIGIN^XMCORIGIN^YMCORIGIN^ZMCORIGIN^XINC^YINC^ZINC^CPLNAME^XSHIFT^YSHIFT^ZSHIFT^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[PRESETGCODE]^[XINC]^[YINC]^[ZINC]^ (^[CPLNAME]^)
;TEXT^Use XABSORIGIN etc for Table/Table and XMCORIGIN etc for Head/Head
;TEXT^Use XINC for G92, I am here, constructions
;TEXT^Use XSHIFT for G52, shift datum by, from last absolute datum
;TEXT^Increment from Initial Datum can be set in NC Style
%CALL=PT_BINC
%CANCEL=#XMOVE
%CANCEL=#YMOVE
%CANCEL=#ZMOVE
<[#DELETE=29][#BNUM=25][#PRESETGCODE=24][#XMOVE=0][#YMOVE=1][#ZMOVE=2] ([$CPLNAME])>



%ENDM



*
*	*************************************************
*	*	Tab Name	:	Subroutine Start			*
*	*************************************************
*
%PROCEDURE=CODECON_SUBROUTINE-START
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Subroutine Start	*****>

@NO_CON-DEBUG

;Sequence Definition^<454>Subroutine Start^-1^<2898>Subroutines and Repeats^
;Use Tokens^DELETE^BLKNUM^SUBNO^ABS-INC^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[SUBNO]
;Default Sequence^;CODE:* Output mode change for subroutines if different
;Default Sequence^;CODE:%IF #INCRSUBS=#INCRXYZHOLD @END
;Default Sequence^[DELETE]^[BLKNUM]^[ABS-INC]
;Default Sequence^;CODE:@END
<[#SUBROUTINE=19]>
* Output mode change for subroutines if different
%IF #INCRSUBS=#INCRXYZHOLD @END
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#ABSINC=24]>
@END


%ENDM

*
*	*************************************************
*	*	Tab Name	:	Coordinate Rotate			*
*	*************************************************
*
%PROCEDURE=CODECON_COORD_ROTATE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	CODECON_COORDINATE_ROTATION	*****>
#COORDROT=1 ;Flag
@NO_CON-DEBUG

;Sequence Definition^<3940>Coordinate Rotation^-1^<2898>Subroutines and Repeats^
;Use Tokens^DELETE^BLKNUM^ROTATION_X^ROTATION_Y^ROTATION_ANG^XMOVE^YMOVE^ZMOVE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G68^[ROTATION_X]^[ROTATION_Y]^[ROTATION_ANG]
;TEXT^Use ROTATION tokens to build Macro 33 coordinate rotation
;TEXT^Use MOVE tokens to force approach after rotation
%CALL=PT_BINC
#XCENTRE=XCENTRE*#XREVERSE
#YCENTRE=YCENTRE*#YREVERSE
<[#DELETE=29][#BNUM=25] G68[#XCENTRE=85][#YCENTRE=86][#ANGLE2=87]>



@END
%ENDM

%PROCEDURE=CODECON_CANCEL_ROTATE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	CODECON_CANCEL_COORDINATE_ROTATION	*****>

@NO_CON-DEBUG

;Sequence Definition^<3941>Cancel Coordinate Rotation^-1^<2898>Subroutines and Repeats^
;Use Tokens^DELETE^BLKNUM^ROTATION_X^ROTATION_Y^ROTATION_ANG^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G69
;TEXT^Use ROTATION tokens to build Macro 33 coordinate rotation
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G69>



@END
%ENDM


*
*	*************************************************
*	*	Tab Name	:	Subroutine Call				*
*	*************************************************
*
%PROCEDURE=CODECON_SUBROUTINE-CALL
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Subroutine Call	*****>

@NO_CON-DEBUG

%IF #MACRO<>33 @GO1
%IF #COUNT=0 @GO1
%CALL=CODECON_COORD_ROTATE

@GO1

;Sequence Definition^<455>Subroutine Call^-1^<2898>Subroutines and Repeats^
;Use Tokens^DELETE^BLKNUM^SUBCALL^SUBNOCALL^N-SUBSTART^N-SUBEND^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[SUBCALL]^[SUBNOCALL]
%CALL=PT_BINC
#SUBSTARTMCODE=DATA2(34)
<[#DELETE=29][#BNUM=25][#SUBSTARTMCODE=23][#SUBROUTINE=20]>


%IF #MACRO<>33 @GO2
%IF #COUNT=0 @GO2
%CALL=CODECON_CANCEL_ROTATE
@GO2

%ENDM

*
*	*************************************************
*	*	Tab Name	:	Subroutine End				*
*	*************************************************
*
%PROCEDURE=CODECON_SUBROUTINE-END
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Subroutine End	*****>

@NO_CON-DEBUG
;Sequence Definition^<456>Subroutine End^-1^<2898>Subroutines and Repeats^
;Use Tokens^DELETE^BLKNUM^SUBCALL^SUBNO^SUBEND^ABS-INC^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^;CODE:* Output mode change for subroutines if different
;Default Sequence^;CODE:%IF #INCRSUBS=#INCRXYZHOLD @END
;Default Sequence^[DELETE]^[BLKNUM]^[ABS-INC]
;Default Sequence^;CODE:@END
;Default Sequence^[DELETE]^[BLKNUM]^[SUBEND]
* Output mode change for subroutines if different
%IF #INCRSUBS=#INCRXYZHOLD @END
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#ABSINC=24]>
@END
%CALL=PT_BINC
#SUBENDMCODE=DATA2(35)
<[#DELETE=29][#BNUM=25][#SUBENDMCODE=23]>


%ENDM


*	*************************************************
*	*	Tab Name	:	Translate					*
*	*************************************************
*
%PROCEDURE=CODECON_TRANSLATE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Translate	*****>
@NO_CON-DEBUG

;Sequence Definition^<592>Translate^32^<2898>Subroutines and Repeats^
;Use Tokens^DELETE^BLKNUM^XINC^YINC^ZINC^PRESETGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[PRESETGCODE]^[XINC]^[YINC]
%CALL=PT_BINC
%CANCEL=#XMOVE
%CANCEL=#YMOVE
<[#DELETE=29][#BNUM=25][#PRESETGCODE=24][#XMOVE=0][#YMOVE=1]>


#SKIPROT=#TRUE
%CALL=HOLD
#SKIPROT=#FALSE
%ENDM
*

*
*	*************************************************
*	*	Tab Name	:	Spline Parameter   			*
*	*************************************************
*
%PROCEDURE=CODECON_SPLINE-PARAMETER
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	NURB Interpolation	*****>
@NO_CON-DEBUG

;Sequence Definition^<1065>NURB Interpolation^-1^<902>General Motion^
;Use Tokens^DELETE^BLKNUM^CYCLEGCODE^ORDER^KNOT^XMOVE^YMOVE^ZMOVE^WEIGHT^FEED^SPEED^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^[CYCLEGCODE]^[ORDER]^[KNOT]^[XMOVE]^[YMOVE]^[ZMOVE]^[WEIGHT]^[FEED]^[SPEED]
;TEXT^Note that this template outputs a Fanuc style NURB curve
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25][#CYCLEGCODE=30][#ORDER=74][#KNOT=76][#XMOVE=0][#YMOVE=1][#ZMOVE=2][#WEIGHT=75][#FEED=7][#SPEED=8]>



%ENDM




* Following code constructors for MPL support only

* Dummy procedures

%PROCEDURE=CODECON_TOOL_CALL
%ENDM

%PROCEDURE=CODECON_TRANSLATE_RESET
%ENDM

%PROCEDURE=CODECON_SPLINE-POINT
%ENDM

*** Format table
* Note token numbers 0-14 should not be changed
* 10 is null output for initialisation of variables.

* FT_SECONDARYROT2, A,3,2,640,4,2,640,	50		Head - Secondary Setting

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´           Format Table           ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%FORMAT
 X,5,4,640,5,3,640,   ; 0   (!FT_XMOVE)        X Move
 Y,5,4,640,5,3,640,   ; 1   (!FT_YMOVE)        Y Move
 Z,5,4,640,5,3,640,   ; 2   (!FT_ZMOVE)        Z Move
 I,5,4,640,5,3,640,   ; 3   (!FT_IMOVE)        I Arc
 J,5,4,640,5,3,640,   ; 4   (!FT_JMOVE)        J Arc
 K,5,4,640,5,3,640,   ; 5   (!FT_KMOVE)        K Arc
 R,5,4,640,5,3,640,   ; 6   (!FT_RMOVE)        Arc Radius
 F,5,3,640,5,3,640,   ; 7   (!FT_FEED)         Feed Code
 S,5,0,0,5,0,0,       ; 8   (!FT_SPEED)        Speed Code
 P,1,3,20,1,3,20,     ; 9   (!FT_DWELL)        Dwell Time (Non cycle e.g. G04 Ptime)
,0,0,0,0,0,0,         ; 10  (!FT_NULL)         Null output format
,4,3,10,4,3,10,       ; 11  (!FT_INTSETUP)     Set-up Sheet (Integers)
,4,3,2052,4,3,2052,   ; 12  (!FT_REALSETUP)    Set-up Sheet (Reals)
,3,4,0,4,3,0,         ; 13  (!FT_DEBUGREAL)    Variable trace Real
,3,4,0,4,3,0,         ; 14  (!FT_DEBUGINT)     Variable trace Integer
 T,2,0,1,2,0,1,       ; 15  (!FT_TPOSN)        Turret Position
 D,2,0,1,2,0,1,       ; 16  (!FT_TLONO)        Tool Length Offset (Tlo)
 D,2,0,1,2,0,1,       ; 17  (!FT_CRCNO)        Cutter Compensation Register
:,4,0,21,4,0,21,      ; 18  (!FT_PROGID)       Main NC Program Number
:,4,0,21,4,0,21,      ; 19  (!FT_SUBID)        Subprogram Number
 P,4,0,21,4,0,21,     ; 20  (!FT_SUBCALL)      Subprogram Call
 P,4,0,0,4,0,0,       ; 21  (!FT_SSNUM)        Subroutine Block No. Start
 Q,4,0,0,4,0,0,       ; 22  (!FT_SENUM)        Subroutine Block No. End
 M,2,0,0,2,0,0,       ; 23  (!FT_MCODE)        Miscellaneous "M" Codes
 G,3,0,0,3,0,0,       ; 24  (!FT_GCODE)        Preparatory "G" Codes
N,4,0,0,4,0,0,        ; 25  (!FT_BLKNUM)       Block Number
O,4,0,0,4,0,0,        ; 26  (!FT_SAFEBLKNUM)   Safe / Tool Block No.
 G54P,3,3,0,3,3,0,    ; 27  (!FT_WORKGCODE)    Work Coord System / Fixture offset
 G54.2P,3,3,0,3,3,0,  ; 28  (!FT_DYNAMIC)      Dynamic Coord System / Fixture offset
/,0,0,0,0,0,0,        ; 29  (!FT_DELETE)       Block Delete / Skip
 G,3,1,0,3,1,0,       ; 30  (!FT_GCYCLE)       Hole Cycles - G Code
 Z,3,4,640,4,3,640,   ; 31  (!FT_ZCYCLE)       Hole Cycles - Z Depth
 F,3,4,640,4,3,640,   ; 32  (!FT_FCYCLE)       Hole Cycles - Feedrate
 S,4,0,0,4,0,0,       ; 33  (!FT_SCYCLE)       Hole Cycles - Speed Code
 P,4,0,0,4,0,0,       ; 34  (!FT_DWCYCLE)      Hole Cycles - Dwell Time
 Q,3,4,640,4,3,640,   ; 35  (!FT_OFFCYCLE)     Hole Cycles - Bore Stand-off
 Q,3,4,640,4,3,640,   ; 36  (!FT_PECKCYCLE)    Hole Cycles - Peck Depth
 Q,3,4,640,4,3,640,   ; 37  (!FT_PECKCYCLE2)   Hole Cycles - Peck Safe Distance
 D,3,4,640,4,3,640,   ; 38  (!FT_DEGCYCLE)     Hole Cycles - Degression
 Z,3,4,640,4,3,640,   ; 39  (!FT_CLEARCYCLE)   Hole Cycles - Z Clear
 R,3,4,640,4,3,640,   ; 40  (!FT_RETRACTCYCLE) Hole Cycles - Retract plane
 K,3,0,640,3,0,640,   ; 41  (!FT_PITCHCYCLE)   Hole Cycles - Thread / Tap Pitch
 R,3,4,640,4,3,640,   ; 42  (!FT_BACKCLEAR)    Hole Cycles - Back Bore Z Clear
 ,3,4,640,4,3,640,    ; 43  (!FT_BACKLEVEL)    Hole Cycles - Back Bore Z Level
 Z,3,4,640,4,3,640,   ; 44  (!FT_BACKDEPTH)    Hole Cycles - Back Bore Z Depth
 D,3,4,640,4,3,640,   ; 45  (!FT_BACKRELEIF)   Hole Cycles - Back Bore Z Back Off
 ,3,4,640,4,3,640,    ; 46  (!FT_BRDIRN)       Hole Cycles - Back Bore Relief Direction
 Q,3,4,640,4,3,640,   ; 47  (!FT_BSREL)        Hole Cycles - Back Bore Side Relief
 ,3,4,640,4,3,640,    ; 48  (!FT_HELDIAM)      Hole Cycles - Helical Hole Diameter
 ,3,4,640,4,3,640,    ; 49  (!FT_HELCHFR)      Hole Cycles - Helical Chamfer Width
 ,3,4,640,4,3,640,    ; 50  (!FT_HEL2DIAM)     Hole Cycles - Helical Tool Diameter
 ,3,3,640,3,3,640,    ; 51  (!FT_HELANG)       Hole Cycles - Helical Chamfer Angle
 ,3,4,640,4,3,640,    ; 52  (!FT_HELPITCH1)    Hole Cycles - Helical Chamfer Pitch
 ,3,4,640,4,3,640,    ; 53  (!FT_HELPITCH2)    Hole Cycles - Helical Hole Pitch
 ,3,0,640,3,0,640,    ; 54  (!FT_HELFIN)       Hole Cycles - Helical Finish Pass
 ,3,0,640,3,0,640,    ; 55  (!FT_HELDIRN)      Hole Cycles - Helical Mc Direction
,3,4,640,4,3,640,     ; 56  (!FT_TM_DIA)       Thread Mill Nominal Diameter
,3,4,640,4,3,640,     ; 57  (!FT_TM_LEAD)      Thread Mill Lead
,3,4,640,4,3,640,     ; 58  (!FT_TM_PITCH)     Thread Mill Pitch
,3,0,640,3,0,640,     ; 59  (!FT_TM_START)     Thread Mill Starts
,3,4,640,4,3,640,     ; 60  (!FT_TM_DEP)       Thread Mill Z Depth
,3,4,640,4,3,640,     ; 61  (!FT_TM_APP)       Thread Mill Approach Feed
,1,0,0,1,0,0,         ; 62  (!FT_TM_DIR)       Thread Mill Direction
,1,0,0,1,0,0,         ; 63  (!FT_TM_MODE)      Thread Mill Climb or Upcut
,3,0,640,3,0,640,     ; 64  (!FT_TM_RETR)      Thread Mill Retract
,3,0,640,3,0,640,     ; 65  (!FT_TM_LEVEL)     Thread Mill Level
,3,0,640,3,0,640,     ; 66  (!FT_TM_CLEAR)     Thread Mill Z Clear
,3,4,640,4,3,640,     ; 67  (!FT_TM_FEED)      Thread Mill Cutting Feed
,1,0,0,1,0,0,         ; 68  (!FT_TM_TYPE)      Thread Mill Type
 G,2,0,0,2,0,0,       ; 69  (!FT_GCODETSET)    Tooling Data - G Code
 P,4,0,0,4,0,0,       ; 70  (!FT_LOOPTSET)     Offset Store - Loop Number
 R,3,4,640,4,3,640,   ; 71  (!FT_RADTSET)      Tooling Data - Tool Radius
 D,3,4,640,4,3,640,   ; 72  (!FT_DIATSET)      Tooling Data - Tool Diameter
 Z,3,4,640,4,3,640,   ; 73  (!FT_ZGAUGETSET)   Tooling Data - Zgauge Length
 P,4,3,0,4,3,0,       ; 74  (!FT_ORDER)        Spline Order
 R,4,3,0,4,3,0,       ; 75  (!FT_WEIGHT)       Spline Weight
 K,4,3,640,4,3,640,   ; 76  (!FT_KNOT)         Spline Knot
 P,3,0,0,3,0,0,       ; 77  (!FT_TURNS)        Number of Full Turns in Helix
 T,3,4,640,4,3,640,   ; 78  (!FT_HIGHSPEEDTOL) High Speed Tolerance
 M,3,0,0,3,0,0,       ; 79  (!FT_COORDS)       Machine Absolute Coordinate Code
 CCR,2,4,640,2,3,640, ; 80  (!FT_3DCCR)        3D Comp Corner Radius
 TR,2,4,640,2,3,640,  ; 81  (!FT_3DTR)         3D Comp Tool Radius
 I,1,3,640,1,3,640,   ; 82  (!FT_XPARTNORMAL)  X Part normal
 J,1,3,640,1,3,640,   ; 83  (!FT_YPARTNORMAL)  Y Part normal
 K,1,3,640,1,3,640,   ; 84  (!FT_ZPARTNORMAL)  Z Part normal
 X,3,4,640,4,3,640,   ; 85  (!FT_ROTX)         Planar Rotate X Centre
 Y,3,4,640,4,3,640,   ; 86  (!FT_ROTY)         Planar Rotate Y Centre
 R,3,2,640,3,2,640,   ; 87  (!FT_ROTA)         Planar Rotate Angle
 G,3,1,640,3,1,640,   ; 88  (!FT_WPLANECODE)   Work Plane Mode
 I,4,4,640,5,3,640,   ; 89  (!FT_EULER1)       First Euler Angle
 J,4,4,640,5,3,640,   ; 90  (!FT_EULER2)       Second Euler Angle
 K,4,4,640,5,3,640,   ; 91  (!FT_EULER3)       Third Euler Angle
 ,4,4,640,5,3,640,    ; 92  (!FT_HEADANG)      Head Attachment Angle
 ,4,4,640,5,3,640,    ; 93  (!FT_MOUNTANG)     Attachment Mounting Angle
 X,5,4,576,5,3,576,   ; 94  (!FT_PROBE01)      Probe Positioning X Move
 Y,5,4,576,5,3,576,   ; 95  (!FT_PROBE02)      Probe Positioning Y Move
 Z,5,4,576,5,3,576,   ; 96  (!FT_PROBE03)      Probe Positioning Z Move
 F,3,4,576,4,3,576,   ; 97  (!FT_PROBE04)      Probe Positioning Feed
 D,3,4,576,4,3,576,   ; 98  (!FT_PROBE05)      Probe Feature Diameter
 A,3,4,576,4,3,576,   ; 99  (!FT_PROBE06)      Probe First Vector Angle
 B,3,4,576,4,3,576,   ; 100 (!FT_PROBE07)      Probe Second Vector Angle
 C,3,4,576,4,3,576,   ; 101 (!FT_PROBE08)      Probe Third Vector Angle
 X,5,4,576,5,3,576,   ; 102 (!FT_PROBE09)      Probe Feature X
 Y,5,4,576,5,3,576,   ; 103 (!FT_PROBE10)      Probe Feature Y
 Z,5,4,576,5,3,576,   ; 104 (!FT_PROBE11)      Probe Feature Z
 A,3,4,576,4,3,576,   ; 105 (!FT_PROBE12)      Probe Measurement Direction
 D,3,4,576,4,3,576,   ; 106 (!FT_PROBE13)      Probe Distance to Surface
 Z,3,4,576,4,3,576,   ; 107 (!FT_PROBE14)      Probe Absolute Depth
 R,3,4,576,4,3,576,   ; 108 (!FT_PROBE15)      Probe Radial Clearance
 I,3,4,576,4,3,576,   ; 109 (!FT_PROBE16)      Probe X Increment to 2nd Pos
 J,3,4,576,4,3,576,   ; 110 (!FT_PROBE17)      Probe Y Increment to 2nd Pos
 S,3,4,576,4,3,576,   ; 111 (!FT_PROBE18)      Probe Work Offset
 Q,3,4,576,4,3,576,   ; 112 (!FT_PROBE19)      Probe Overtravel
 H,3,4,576,4,3,576,   ; 113 (!FT_PROBE20)      Probe Feature Tolerance
 M,3,4,576,4,3,576,   ; 114 (!FT_PROBE21)      Probe Positionional Tolerance
 U,3,4,576,4,3,576,   ; 115 (!FT_PROBE22)      Probe Upper Tolerance
 B,3,4,576,4,3,576,   ; 116 (!FT_PROBE23)      Probe Angle tolerance
 X,5,4,576,5,3,576,   ; 117 (!FT_PROBE24)      Probe X Distance
 Y,5,4,576,5,3,576,   ; 118 (!FT_PROBE25)      Probe Y Distance
 W,5,4,576,5,3,576,   ; 119 (!FT_PROBE41)      Probe Print
 TSTORE1,3,4,0,3,4,0, ; 120 (!FT_TSTORE1)      ToolStore Numeric (User Defined)
 TSTORE2,3,4,0,3,4,0, ; 121 (!FT_TSTORE2)      ToolStore Numeric (User Defined)
,8,0,0,8,0,0,         ; 122 (!FT_TSTORE3)      Tool Group Number
,8,0,0,8,0,0,         ; 123 (!FT_TSTORE4)      Tool ID Number
 U,5,4,640,5,3,640,   ; 124 (!FT_XMOVE2)       X Ref Point Move
 V,5,4,640,5,3,640,   ; 125 (!FT_YMOVE2)       Y Ref Point Move
 W,5,4,640,5,3,640,   ; 126 (!FT_ZMOVE2)       Z Ref Point Move
 X,5,4,640,5,3,640,   ; 127 (!FT_XHOMEPOS)     X Home Local Address
 Y,5,4,640,5,3,640,   ; 128 (!FT_YHOMEPOS)     Y Home Local Address
 Z,5,4,640,5,3,640,   ; 129 (!FT_ZHOMEPOS)     Z Home Local Address
 X,5,4,640,5,3,640,   ; 130 (!FT_XTOOLPOS)     X Toolchange Local Address
 Y,5,4,640,5,3,640,   ; 131 (!FT_YTOOLPOS)     Y Toolchange Local Address
 Z,5,4,640,5,3,640,   ; 132 (!FT_ZTOOLPOS)     Z Toolchange Local Address
,5,4,0,5,4,0,         ; 133 (!FT_USER-1)       User Numeric Token 1
,5,4,0,5,4,0,         ; 134 (!FT_USER-2)       User Numeric Token 2
,5,4,0,5,4,0,         ; 135 (!FT_USER-3)       User Numeric Token 3
,5,4,0,5,4,0,         ; 136 (!FT_USER-4)       User Numeric Token 4
,5,4,0,5,4,0,         ; 137 (!FT_USER-5)       User Numeric Token 5
,5,4,0,5,4,0,         ; 138 (!FT_USER-6)       User Numeric Token 6
,5,4,0,5,4,0,         ; 139 (!FT_USER-7)       User Numeric Token 7
,5,4,0,5,4,0,         ; 140 (!FT_USER-8)       User Numeric Token 8
,5,4,0,5,4,0,         ; 141 (!FT_USER-9)       User Numeric Token 9
,5,4,0,5,4,0,         ; 142 (!FT_USER-10)      User Numeric Token 10
,5,4,0,5,4,0,         ; 143 (!FT_USER-11)      User Numeric Token 11
,5,4,0,5,4,0,         ; 144 (!FT_USER-12)      User Numeric Token 12
,5,4,0,5,4,0,         ; 145 (!FT_USER-13)      User Numeric Token 13
,5,4,0,5,4,0,         ; 146 (!FT_USER-14)      User Numeric Token 14
,5,4,0,5,4,0,         ; 147 (!FT_USER-15)      User Numeric Token 15
,5,4,0,5,4,0,         ; 148 (!FT_USER-16)      User Numeric Token 16
,5,4,0,5,4,0,         ; 149 (!FT_USER-17)      User Numeric Token 17
,5,4,0,5,4,0,         ; 150 (!FT_USER-18)      User Numeric Token 18
,5,4,0,5,4,0,         ; 151 (!FT_USER-19)      User Numeric Token 19
,5,4,0,5,4,0,         ; 152 (!FT_USER-20)      User Numeric Token 20
%ENDF
*** End of include file A:\Pams\cam\machdef\template\mill-iso.cgi ***


*** Start of include file Mill-Renishaw-Probing.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	mill-Iso-Probing.cgi
*	Author:		Sam Haslar / RHA
*   Date:       22 August 20085
*
* New file for adaptive milling templates derived from earlier multiplane template                                *
**************************************************************************
*   Change History
* Version 2009.1
*          FIRST ISSUE
* Change output procedures to code constructors
* Change macro numbers to 301 series after discussion with SJO
* Remove command details
* 26/08/08 RHA Update logic to latest received mac file
* 11/09/08 RHA Update logic to latest received mac file
* 16/09/08 RHA Trailing comma - macro 304 definition
* 18/09/08 RHA Incorporate latest logic changes from Sam Hasler
* 24/09/08 RHA DEV00024504 Code constructor formatting changes
* 01/10/08 RHA DEV00025060 Force distance positive on 4th axis probe cycles
* Version 2009.1 SP
* 01/10/08 RHA DEV00025318 Correct datum setting for probe cycles
* Version 2010.1
* 05/08/09 RHA WI33007 Fix S word for datum Over-ride
* 05/08/09 RHA WI35305 Add Probing mode control tokens etc
* Version 2010.2
* 04/12/09 RHA W34615 Add Probing first Z for G43 code constructor
* 19/01/10 RHA W37370 Remove PROBEANG tokens from the 4th axis code constructors
* Version 2011.2
* 28/01/11 RHA W42563 Correct corner probe approach
* Version 2013.2
* 29/11/12 RHA W54472 Correct token colour coding, Probe first Z move
* Version 2015.2
* 07/01/15 GST W80110 Implement M&H Probing
* 20/01/15 GST W80110 Separate M&H & Renishaw at tokens/formats levels
* 23/02/15 GST W35486 Add Work Offset functions
* 26/02/15 GST W82041 Call Customisation Breakout from Probing macros
* 04/03/15 GST W32377 Printing function for Renishaw
* Version 2016.1
* 23/06/15 GST ECAM-1548 Implement Probing NC-Gage
*
*************************************************************************************
*         prototype probing macros
*************************************************************************************
*
*	This file implements the following cycles:
*
*	Feed:
*       1       Move probe
*	Bore/Boss:
*       2       Bore 3 Point
*       3       Boss 3 Point
*       4       Bore 4 Point
*       5       Boss 4 Point
*	Surface:
*       6       Probe Surface
*       7       Angled Single surface
*	Web/Pocket
*       8       Probe Web/Pocket
*       9       Angled Web / Pocket
*	Internal/External Corner:
*       10      Internal Corners
*       11      External Corners
*	4th Axis:
*       12      4th Axis X
*       13      4th Axis Y
*
*	Modifier 250 mapped to system variable 62 (PATHTRACE) will be set to one of the above cycle numbers
*	Modifier 233 mapped into 402 (CWNVAR402) - contains Function list
*	Modifier 234 mapped into 403 (CWNVAR403) - contains Print check box
*	Modifier 235 mapped into 404 (CWNVAR404) - contains Work Coordinate list
*	Modifier 236 mapped into 405 (CWNVAR404) - contains extendend Work Coordinate list
*

*************************************************************************************
* Notes
*************************************************************************************
*
*	Find and count (possible) format table references
*	grep -E "=[0-9]+\]" ..\ext\VAB-probe.mxt |sed 's/^.*=\([0-9]\+\)\].*$/\1/g' | C:\cygwin\bin\sort -n | uniq -c
*
*	machdef\error.mpp
*
*	Probing entries in Format Table start at Line 3455 of VAB-probe.mxt

*************************************************************************************
* Internal Variables - NOT exposed to Code Wizard users
*************************************************************************************
* All Cycles (except cycle 1)
%DECLARE=#PROBEON ; Modal status flag
%DECLARE=#QUADRANT,#RadialClrY,#RadialClrX
%DECLARE=#CURX,#CURY,#CURZ,#PROBESTARTX,#PROBESTARTY,#PROBESTARTZ
%DECLARE=#fOverFeature,#fAtProbeStartDepth

* Cycles 2, 3, 4 & 5
%DECLARE=#RETRACT

* Cycle 6
%DECLARE=#PROBEDIRECTION

* Cycle 8
%DECLARE=#WEBPOCKET,#PT1X,#PT1Y,#PT2X,#PT2Y

*************************************************************************************
* Tokens for Code Wizard:
*************************************************************************************
%DECLARE=#FEEDX,#FEEDY,#FEEDZ
%DECLARE=#FEEDRATE
%DECLARE=#PROBEZDEPTH
* %DECLARE=#BOREBOSSZDEPTH
* %DECLARE=#WEBPOCKETZDEPTH
%DECLARE=#ANGLE
%DECLARE=#AngleA
%DECLARE=#AngleB
%DECLARE=#AngleC
%DECLARE=#DIAMETER
%DECLARE=#DISTANCE
%DECLARE=#RADCLEAR
%DECLARE=#SecondX
%DECLARE=#SecondY
%DECLARE=#DATUM
%DECLARE=#OVERTRAVEL
%DECLARE=#TOLERANCE
%DECLARE=#POSITIONTOLERANCE
%DECLARE=#UPPERTOLERANCE
%DECLARE=#ANGULARTOLERANCE
%DECLARE=#PRINT

*					Cycles the Token is output for.		 Below are the Renishaw Inspection Plus definitions of these inputs.
* #FEEDX			1                             	X = The target positions for the probe positioning move.
* #FEEDY			1	                          	Y = The target positions for the probe positioning move.
* #FEEDZ			1	                        	Z = The target positions for the probe positioning move.
* #TRX				          6   |   |  |       	X = The surface position or size.
*					              8   |  |       	X = Nominal size of feature when measured in the X-axis.
*					                  10 11      	X = c.
* #TRY				          6   |   |  |        	Y = The surface position or size.
*					              8   |  |        	Y = Nominal size of feature when measured in the Y-axis.
*					                  10 11     	Y = Nominal corner position Y-axis.
* #TRY				          6                  	Z = The surface position or size.
* #FEEDRATE			1 * * * * * * * * *  *  *  *	F = The modal feedrate for all protected positioning moves. The feedrate will be modal to this macro and subsequent feedrate calls are unnecessary unless a change of feedrate is required. The maximum safe fast feedrate established during installation should not be exceeded.
*														(Note: Cycle 1 is called before and after all the other cycles to perform linking moves)
*													* Feedrate passed to all cycles for TNC support
* #AngleA			  2 3                     		A = The first angle for vector measurement, measured from the X+ axis direction.
* #ANGLE			            7   |           	A = Direction of probe measurement measured from the X+ axis direction.
*						            9          		A = Angle of the surface to be measured from the X+ axis direction.
* #AngleB			  2 3                      		B = The second angle for vector measurement, measured from the X+ axis direction.
* #AngleC			  2 3                      		C = The third angle for vector measurement, measured from the X+ axis direction.
* #DIAMETER			  2 3 4 5                    	D = Nominal size of the feature.
* #DISTANCE			            7   |             	D = Nominal distance to the surface (radial).
*					                9           	D = Nominal size of the feature.
* #?????X			                        12  	X = The X-axis distance between Z1 and Z2 measurement positions.
* #?????Y			                           13 	Y = The Y axis distance between Z1 and Z2 measurement positions.
* #BOREBOSSZDEPTH	  2 3 4 5                     	Z = The absolute Z-axis position when measuring a boss feature. If this is omitted a bore cycle is assumed.
* #WEBPOCKETZDEPTH	              8 9             	Z = The absolute Z axis position when measuring a web feature. If this is omitted a pocket cycle is assumed.
* #4THAXISZDEPTH	                        12 13	Z = The Z-axis expected surface position.
* #RADCLEAR	  2 3 4 5     8 9             	R = This is an incremental dimension that is used in external features, e.g. bosses and webs, to give a radial clearance from the nominal target surface prior to a Z-axis move. Default = 5 mm (0.200 in).
*                     2 3 4 5     | |              	-R= This is similar to Rr, except that the clearance is applied in the opposite direction to force an internal boss cycle. Default = 5 mm (0.200 in).
*					              8 9            	-R= This is similar to Rr, except that the clearance is applied in the opposite direction to force an internal web cycle. Default = 5 mm (0.200 in).
* #SecondX			                  10 11     	I = Incremental distance to the second probe position along the X-axis (positive value is assumed). Default = no move.
* #SecondY			                  10 11     	J = Incremental distance to the second probe position along the Y-axis (positive value is assumed). Default = no move.
* #DATUM			  2 3 4 5 6 7 8 9 10 11 12 13	S = The work offset number which will be set.
*														The work offset number will be updated.
*														S1 to S6 (G54 to G59)
*														S0 (external work offset).
*														S101 to S148 (G54.1 P1 to G54.1 P48) additional offsets option.
*														New work offset = active work offset + error.
*														New external offset = external offset + error.
* #OVERTRAVEL		  2 3 4 5 6 7 8 9 10 11 |  |	Q = The probe overtravel distance for use when the default values are unsuitable. The probe will then travel beyond the expected position when it searches for a surface. Default = 4 mm (0.16 in) in the Z-axis, and 10 mm (0.394 in) in the X and Y axes.
*                                           12 13	Q = The probe overtravel distance for use when the default values are unsuitable. The probe then travels beyond the expected position when it searches for a surface. Default = 10 mm (0.4 in).
* #TOLERANCE		  2 3 4 5 6 7 8 9           	H = Tolerance value of a feature dimension being measured.
*														Example: For dimension 50.0 mm +0.4 mm –0 mm, the nominal
*														tolerance is 50.2 mm with H.2.
*														(For dimension 1.968 in +0.016 in –0 in, the nominal tolerance is 1.976 in
*														with H.008.)
*													(Guy Brown's Description: Size Tolerance – Alarm if incorrect size)
* #POSITIONTOLERANCE  2 3 4 5 6 7 8 9 10 11      	M = True position tolerance of a feature. A cylindrical zone about the theoretical position.
* #UPPERTOLERANCE	  2 3 4 5 6 7 8 9 10 11     	U = Upper tolerance limit. If this value is exceeded there is no work offset updated and the cycle is stopped with an alarm. This tolerance is applied to both size and position where applicable. Example: U2. to set the upper tolerance limit to 2 mm.
* #ANGULARTOLERANCE	                  10 11 |  | 	B = Angle tolerance. This applies to both X and Y surfaces. It is equal to half the total tolerance, e.g. ±0.25 degrees = B.25 tolerance.
*					                        12 13	B = Set a tolerance on the angular position of the feature. It is equal to half the total tolerances, e.g. component dimension 45 degrees (±0.25 degrees) the 4th axis would be positioned to 45 degrees and B.25 tolerance.

* TODO - for Marpos / m&h
* PROBETYPE
* OBSTRUCTION
* CORNER QUADRANT	(top left, top right, bottom left, bottom right)



* Macro allocation
* 301  Probe_Surface
* 302  Probe_Bore/Boss
* 303  Probe_Feed
* 304  Probe_Web/Pocket
* 305  Probe_Corner
* 306  Probe_4th_Axis



*************************************************************************************

%MACRO=303=..=Probe Feed=101|81,
$SPC=" "; Reset trace spacing
#MACRO=303
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT


%IF #NCSUPPRESS=1 %THEN MASK=1

%IF LAST=#FUNNY %THEN LAST=15
%IF LAST=0 %THEN LAST=15
%IF LAST<0 %THEN LAST=15
%IF LAST>15 %THEN LAST=15

#LOOP=1
@NEXT2

#FEEDX=XPOINT(#LOOP):#FEEDY=YPOINT(#LOOP):#FEEDZ=ZPOINT(#LOOP)
* <Check [LAST=0] [#FEEDX=0][#FEEDY=1][#FEEDZ=2]>

*TODO check outut is minimal (i.e. variables only output if changed) See %OUTPUT-IF-CHANGED

%CALL=CODECON_PROBE_FEED

#LOOP=#LOOP+1
%IF #LOOP<=LAST @NEXT2

*<* End of Array>

%ENDM


*************************************************************************************
* Move to start position for measuring moves
*************************************************************************************
%PROCEDURE=MOVE-TO-PROBE-START
%IF #PROCTRACE=1 %THEN $PROCEDURE=MOVE-TO-PROBE-START:%CALL=ENTER_PROCEDURE

%GOTO @SKIPOUTPUT
<* MOVE-TO-PROBE-START Inputs:>
<* #CURX		[#cURX			=12]	(X Position before probe)>
<* #CURY		[#CURY			=12]	(Y Position before probe)>
<* #CURZ		[#CURZ			=12]	(Z Position before probe)>
<* ZCLEAR		[ZCLEAR			=12]	(Clearance)>
<* #PROBESTARTX	[#PROBESTARTX	=12]	(Probe Start X)>
<* #PROBESTARTY	[#PROBESTARTY	=12]	(Probe Start Y)>
<* #PROBESTARTZ	[#PROBESTARTZ	=12]	(Probe Start Z)>
@SKIPOUTPUT

#fOverFeature=1
%IF #CURX<>#PROBESTARTX %THEN #fOverFeature=0
%IF #CURY<>#PROBESTARTY %THEN #fOverFeature=0

#fAtProbeStartDepth=1
%IF #CURZ<>#PROBESTARTZ %THEN #fAtProbeStartDepth=0

%IF #fOverFeature=1 @StartXY
%IF #CURZ<ZCLEAR %THEN			#FEEDX=#FUNNY		:#FEEDY=#FUNNY		:#FEEDZ=ZCLEAR		:%CALL=CODECON_PROBE_FEED	:#fAtProbeStartDepth=0
#FEEDX=#PROBESTARTX	:#FEEDY=#PROBESTARTY:#FEEDZ=#FUNNY		:%CALL=CODECON_PROBE_FEED
@StartXY
%IF #fAtProbeStartDepth=0 %THEN	#FEEDX=#FUNNY		:#FEEDY=#FUNNY		:#FEEDZ=#PROBESTARTZ:%CALL=CODECON_PROBE_FEED

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*************************************************************************************
* Move to clearance plane after measuring moves
*************************************************************************************
%PROCEDURE=MOVE-TO-CLEARANCE
%IF #PROCTRACE=1 %THEN $PROCEDURE=MOVE-TO-CLEARANCE:%CALL=ENTER_PROCEDURE

%IF #PROBESTARTZ<ZCLEAR %THEN 		#FEEDX=#FUNNY			:#FEEDY=#FUNNY		:#FEEDZ=ZCLEAR		:%CALL=CODECON_PROBE_FEED

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*************************************************************************************
* Dialog: Probe Bore/Boss
*************************************************************************************
%MACRO=302=..=Probe Bore Boss=101|81,28,161|95,9,29|176,111|177,112|178,113|179,114|180,204|182,205|167,206|183,207|184,250|62,251|289,252|5,233|402,234|403,235|404,236|405
$SPC=" "; Reset trace spacing
#MACRO=302
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#FEEDRATE			= FEED
*NB FEEDRATE Unused with Fanuc, included for possible TNC support
#PROBEZDEPTH		= ZDEPTH
#DIAMETER			= 2*RADIUS
#DATUM				= #WORKGCODE-#DATUMSTART; Set to work datum pointer not system variable or G code
#DATUM=#DATUM/#DATUMINCR  ; Allow for step>1
%CALL=PROBE_F
#OVERTRAVEL			= FIELD7
#TOLERANCE			= TOLERANCE
#POSITIONTOLERANCE	= FIELD8
#UPPERTOLERANCE		= FIELD9
* See also token mappings for each cycle
************************************

%GOTO @SKIPOUTPUT
<*	 81	FEED		[FEED		=12]	(Feedrate)>
<*	 57	ZCLEAR		[ZCLEAR		=12]	(Clearance	)>
<*	 31	RPLANE		[RPLANE		=12]	(Level + Retract)>
<*	176	FIELD1		[FIELD1		=12]	(Retract)>
<*	 95	ZLEVEL		[ZLEVEL		=12]	(Level)>
<*	 27	ZDEPTH		[ZDEPTH		=12]	(Level + Depth	)>

<*	177	FIELD2		[FIELD2		=12]	(Radial_Clearance)>
<*	178	FIELD3		[FIELD3		=12]	(A)>
<*	179	FIELD4		[FIELD4		=12]	(B)>
<*	180	FIELD5		[FIELD5		=12]	(C)>
<*	181	FIELD6		[FIELD6		=12]	(***NOT USED***)>
<*	182	FIELD7		[FIELD7		=12]	(Overtravel)>
<*	167	TOLERANCE	[TOLERANCE	=12]	(Tolerance)>
<*	183	FIELD8		[FIELD8		=12]	(Position_Tolerance)>
<*	184	FIELD9		[FIELD9		=12]	(Upper_Tolerance)>
<*	185	FIELD10		[FIELD10	=12]	(***NOT USED***)>
<*	186	FIELD11		[FIELD11	=12]	(***NOT USED***)>
<*	187	FIELD12		[FIELD12	=12]	(***NOT USED***)>

<*	 62	PATHTRACE	[PATHTRACE	=12]	(Cycle Type)>
<*	289	WORKDATUMID	[WORKDATUMID=12]    (Datum)>
<*	  5	RADIUS		[RADIUS		=12]	(Radius)>
*%CALL=ARRAY-DUMP
*%CALL=VAR-DUMP
@SKIPOUTPUT


#CURX = XPOINT(1)
#CURY = YPOINT(1)
#CURZ = ZPOINT(1)

#PROBESTARTX = XPOINT(2)
#PROBESTARTY = YPOINT(2)

#RETRACT = ABS(FIELD1)
#PROBESTARTZ=ZLEVEL+#RETRACT

*Bore without obsticle starts at ZDEPTH (fanuc)
%IF #RETRACT=#FUNNY %THEN #PROBESTARTZ=ZDEPTH

%CALL=MOVE-TO-PROBE-START

*Bore without obsticle doesn't need ZDEPTH in gauging NC Code (fanuc)
%IF #RETRACT=#FUNNY %THEN #PROBEZDEPTH=#FUNNY

%IF		PATHTRACE=2 %THEN
%CALL=CODECON_PROBE_BORE3
%ELSEIF PATHTRACE=3 %THEN
%CALL=CODECON_PROBE_BOSS3
%ELSEIF PATHTRACE=4 %THEN
%CALL=CODECON_PROBE_BORE4
%ELSEIF PATHTRACE=5 %THEN
%CALL=CODECON_PROBE_BOSS4
%ENDIF

%CALL=MOVE-TO-CLEARANCE

%ENDM


*************************************************************************************
* Dialog: Probe Surface
*************************************************************************************
%MACRO=301=..=Probe Surface=106|187,101|81,28,161|95,9,29|176,111|177,115|178,204|182,205|167,206|183,207|184,250|62,251|289,233|402,234|403,235|404,236|405
$SPC=" "; Reset trace spacing
#MACRO=301
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#FEEDRATE			= FEED
*NB FEEDRATE Unused with Fanuc, included for possible TNC support
#DATUM				= #WORKGCODE-#DATUMSTART; Set to work datum pointer not system variable or G code
#DATUM=#DATUM/#DATUMINCR  ; Allow for step>1
%CALL=PROBE_F
#OVERTRAVEL			= FIELD7
#TOLERANCE			= TOLERANCE
#POSITIONTOLERANCE	= FIELD8
#UPPERTOLERANCE		= FIELD9
#DISTANCE=FIELD2+((FIELD2/ABS(FIELD2))*TOOLRAD)
#ANGLE				= FIELD3

%GOTO @SKIPOUTPUT
<*	 81	FEED		[FEED		=12]	(Feedrate)>
<*	 57	ZCLEAR		[ZCLEAR		=12]	(Clearance	)>
<*	 31	RPLANE		[RPLANE		=12]	(Level + Retract)>
<*	176	FIELD1		[FIELD1		=12]	(Retract)>
<*	 95	ZLEVEL		[ZLEVEL		=12]	(Level)>
<*	 27	ZDEPTH		[ZDEPTH		=12]	(Level + Depth	)>

<*	177	FIELD2		[FIELD2		=12]	(Radial_Clearance)>
<*	178	FIELD3		[FIELD3		=12]	(Angle)>
<*	179	FIELD4		[FIELD4		=12]	(***NOT USED***)>
<*	180	FIELD5		[FIELD5		=12]	(***NOT USED***)>
<*	181	FIELD6		[FIELD6		=12]	(***NOT USED***)>
<*	182	FIELD7		[FIELD7		=12]	(Overtravel)>
<*	167	TOLERANCE	[TOLERANCE	=12]	(Tolerance)>
<*	183	FIELD8		[FIELD8		=12]	(Position_Tolerance)>
<*	184	FIELD9		[FIELD9		=12]	(Upper_Tolerance)>
<*	185	FIELD10		[FIELD10	=12]	(***NOT USED***)>
<*	186	FIELD11		[FIELD11	=12]	(***NOT USED***)>
<*	187	FIELD12		[FIELD12	=12]	(Probe - In X, In Y, In Z, ANGLED)>

<*	 62	PATHTRACE	[PATHTRACE	=12]	(Cycle Type)>
<*	289	WORKDATUMID	[WORKDATUMID=12]    (Datum)>
<*		#ANGLE		[#ANGLE		=12]>
*%CALL=ARRAY-DUMP
@SKIPOUTPUT

#PROBEDIRECTION = FIELD12

#CURX = XPOINT(1)
#CURY = YPOINT(1)
#CURZ = ZPOINT(1)

#RETRACT 			= ABS(FIELD1)
#RADCLEAR=FIELD2+((FIELD2/ABS(FIELD2))*TOOLRAD)

%IF 	#PROBEDIRECTION = 1 %THEN
#PROBESTARTX = XPOINT(2) + #RADCLEAR
#PROBESTARTY = YPOINT(2)
#PROBESTARTZ = ZDEPTH
%ELSEIF #PROBEDIRECTION = 2 %THEN
#PROBESTARTX = XPOINT(2)
#PROBESTARTY = YPOINT(2) + #RADCLEAR
#PROBESTARTZ = ZDEPTH
%ELSEIF #PROBEDIRECTION = 3 %THEN
#PROBESTARTX = XPOINT(2)
#PROBESTARTY = YPOINT(2)
#PROBESTARTZ = ZLEVEL+#RETRACT
%ELSEIF #PROBEDIRECTION = 4 %THEN
#PROBESTARTX = #DISTANCE * COS(#ANGLE)
#PROBESTARTX = XPOINT(2) - #PROBESTARTX
#PROBESTARTY = #DISTANCE * SIN(#ANGLE)
#PROBESTARTY = YPOINT(2) - #PROBESTARTY
#PROBESTARTZ = ZDEPTH
%ELSE
#PROBESTARTX = XPOINT(2)
<* WARNING - SINGLE SURFACE>
%ENDIF

%CALL=MOVE-TO-PROBE-START

%IF		PATHTRACE=6 %THEN
%CALL=CODECON_PROBE_SURF1
%ELSEIF PATHTRACE=7 %THEN
%CALL=CODECON_PROBE_ANGSURF1
%ENDIF

%CALL=MOVE-TO-CLEARANCE

%ENDM


*************************************************************************************
* Dialog: Probe Web/Pocket
*************************************************************************************
%MACRO=304=..=Probe Web Pocket=106|187,101|81,28,161|95,9,29|176,111|177,204|182,205|167,206|183,207|184,250|62,251|289,252|186,253|185,233|402,234|403,235|404,236|405
$SPC=" "; Reset trace spacing
#MACRO=304
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#RETRACT = ABS(FIELD1)
#WEBPOCKET		= FIELD12
%IF PATHTRACE=9 %THEN #WEBPOCKET =  #WEBPOCKET - 2;

#FEEDRATE			= FEED
*NB FEEDRATE Unused with Fanuc, included for possible TNC support
#PROBEZDEPTH	= ZDEPTH
%IF #RETRACT = #FUNNY %THEN
#RADCLEAR = #FUNNY
#TRZ = #FUNNY
%ELSE
#RADCLEAR = (-1 ^ (#WEBPOCKET+1)) * (TOOLRAD + ABS(FIELD2))
#TRZ = ZDEPTH
%ENDIF
#DATUM				= #WORKGCODE-#DATUMSTART; Set to work datum pointer not system variable or G code
#DATUM=#DATUM/#DATUMINCR  ; Allow for step>1
%CALL=PROBE_F
#OVERTRAVEL			= FIELD7
#TOLERANCE			= TOLERANCE
#POSITIONTOLERANCE	= FIELD8
#UPPERTOLERANCE		= FIELD9
* See also token mappings for each cycle
************************************

%GOTO @SKIPOUTPUT
<*	 81	FEED		[FEED		=12]	(Feedrate)>
<*	 57	ZCLEAR		[ZCLEAR		=12]	(Clearance	)>
<*	 31	RPLANE		[RPLANE		=12]	(Level + Retract)>
<*	176	FIELD1		[FIELD1		=12]	(Retract)>
<*	 95	ZLEVEL		[ZLEVEL		=12]	(Level)>
<*	 27	ZDEPTH		[ZDEPTH		=12]	(Level + Depth	)>

<*	177	FIELD2		[FIELD2		=12]	(Radial_Clearance)>
<*	178	FIELD3		[FIELD3		=12]	(***NOT USED***)>
<*	179	FIELD4		[FIELD4		=12]	(***NOT USED***)>
<*	180	FIELD5		[FIELD5		=12]	(***NOT USED***)>
<*	181	FIELD6		[FIELD6		=12]	(***NOT USED***)>
<*	182	FIELD7		[FIELD7		=12]	(Overtravel)>
<*	167	TOLERANCE	[TOLERANCE	=12]	(Tolerance)>
<*	183	FIELD8		[FIELD8		=12]	(Position_Tolerance)>
<*	184	FIELD9		[FIELD9		=12]	(Upper_Tolerance)>
<*	185	FIELD10		[FIELD10	=12]	(Angle)>
<*	186	FIELD11		[FIELD11	=12]	(Probe Direction - In X, In Y)>
<*	187	FIELD12		[FIELD12	=12]	(Probe - Web / Pocket)>

<*	 62	PATHTRACE	[PATHTRACE	=12]	(Cycle Type)>
<*	289	WORKDATUMID	[WORKDATUMID=12]    (Datum)>
<*	POINT 1 		[XPOINT(2)=12]>
<*	POINT 1 		[YPOINT(2)=12]>
<*	POINT 2 		[XPOINT(3)=12]>
<*	POINT 2 		[YPOINT(3)=12]>
<* #WEBPOCKET		[#WEBPOCKET	=12]>
<* #RADCLEAR		[#RADCLEAR	=12]>
*%CALL=ARRAY-DUMP
*%CALL=VAR-DUMP
@SKIPOUTPUT

#PROBEDIRECTION	= FIELD11

#CURX = XPOINT(1)
#CURY = YPOINT(1)
#CURZ = ZPOINT(1)

#PT1X = XPOINT(2)
#PT1Y = YPOINT(2)
#PT2X = XPOINT(3)
#PT2Y = YPOINT(3)

%IF #RETRACT = #FUNNY %THEN
#PROBESTARTZ = ZDEPTH
%ELSE
#PROBESTARTZ = ZLEVEL + #RETRACT
%ENDIF




%IF		PATHTRACE=8 %THEN
%CALL=CODECON_PROBE_WEB_POCKET
%ELSEIF PATHTRACE=9 %THEN
%CALL=CODECON_PROBE_ANG_WEB_POCKET
%ENDIF

%CALL=MOVE-TO-CLEARANCE

%ENDM

*************************************************************************************
* Dialog: Probe Internal/External Corner
*************************************************************************************
%MACRO=305=..=Probe Corner=106|187,101|81,28,161|95,9,29|176,116|177,117|178,118|179,119|180,204|182,208|167,206|183,207|184,250|62,251|289,233|402,234|403,235|404,236|405
$SPC=" "; Reset trace spacing
#MACRO=305
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#TRX				= XPOINT(2)
#TRY				= YPOINT(2)
#SecondX			= FIELD4
#SecondY			= FIELD5
#DATUM				= #WORKGCODE-#DATUMSTART; Set to work datum pointer not system variable or G code
#DATUM=#DATUM/#DATUMINCR  ; Allow for step>1
%CALL=PROBE_F
#OVERTRAVEL			= FIELD7
#ANGULARTOLERANCE	= TOLERANCE
#POSITIONTOLERANCE	= FIELD8
#UPPERTOLERANCE		= FIELD9
#QUADRANT			= FIELD12
%IF #QUADRANT > 4 %THEN #QUADRANT = #QUADRANT - 4
#CURX = XPOINT(1)
#CURY = YPOINT(1)
#CURZ = ZPOINT(1)
#RadialClrX = TOOLRAD + ABS(FIELD2)
#RadialClrY = TOOLRAD + ABS(FIELD3)
#PROBEDIRECTION = FIELD12
* Internal
%IF #PROBEDIRECTION = 1 %THEN #PROBESTARTX = #TRX+#RadialClrX:	#PROBESTARTY = #TRY+#RadialClrY
%IF #PROBEDIRECTION = 2 %THEN #PROBESTARTX = #TRX-#RadialClrX:	#PROBESTARTY = #TRY+#RadialClrY
%IF #PROBEDIRECTION = 3 %THEN #PROBESTARTX = #TRX-#RadialClrX:	#PROBESTARTY = #TRY-#RadialClrY
%IF #PROBEDIRECTION = 4 %THEN #PROBESTARTX = #TRX+#RadialClrX:	#PROBESTARTY = #TRY-#RadialClrY
*External
%IF #PROBEDIRECTION = 5 %THEN #PROBESTARTX = #TRX-#RadialClrX:	#PROBESTARTY = #TRY-#RadialClrY
%IF #PROBEDIRECTION = 6 %THEN #PROBESTARTX = #TRX+#RadialClrX:	#PROBESTARTY = #TRY-#RadialClrY
%IF #PROBEDIRECTION = 7 %THEN #PROBESTARTX = #TRX+#RadialClrX:	#PROBESTARTY = #TRY+#RadialClrY
%IF #PROBEDIRECTION = 8 %THEN #PROBESTARTX = #TRX-#RadialClrX:	#PROBESTARTY = #TRY+#RadialClrY

#PROBESTARTZ = ZDEPTH

%CALL=MOVE-TO-PROBE-START

%IF		PATHTRACE=10 %THEN
%CALL=CODECON_PROBE_INTERNAL_CORNER
%ELSEIF PATHTRACE=11 %THEN
%CALL=CODECON_PROBE_EXTERNAL-CORNER
%ENDIF

%CALL=MOVE-TO-CLEARANCE

%ENDM


*************************************************************************************
* Dialog: Probe 4th Axis
*************************************************************************************
%MACRO=306=..=Probe 4th Axis=101|81,28,161|95,9,29|176,121|177,204|182,208|167,206|183,250|62,251|289,233|402,234|403,235|404,236|405
$SPC=" "; Reset trace spacing
#MACRO=306
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#TRZ				= ZDEPTH
#DATUM				= #WORKGCODE-#DATUMSTART; Set to work datum pointer not system variable or G code
#DATUM=#DATUM/#DATUMINCR  ; Allow for step>1
%CALL=PROBE_F
#OVERTRAVEL			= FIELD7
#ANGULARTOLERANCE	= TOLERANCE
#RETRACT = ABS(FIELD1)
#PROBESTARTX	= XPOINT(2)
#PROBESTARTY	= YPOINT(2)
#PROBESTARTZ	= ZLEVEL + #RETRACT
#DISTANCE=FIELD2
#PROBEZDEPTH=ZDEPTH
%CALL=MOVE-TO-PROBE-START

%IF		PATHTRACE=12 %THEN
%CALL=CODECON_PROBE_4AX_X
%ELSEIF PATHTRACE=13 %THEN
%CALL=CODECON_PROBE_4AX_Y
%ENDIF

%CALL=MOVE-TO-CLEARANCE

%ENDM

%MACRO=697=..=Probing NC Gage=
$SPC=" "; Reset trace spacing
#MACRO=697
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=CODECON_PROBE_NC_GAGE

@END
%ENDM


*************************************************************************************
* Support procedures - mode control
*************************************************************************************

%PROCEDURE=PROBE_F
%IF #PROCTRACE=1 %THEN $PROCEDURE=PROBE_F:%CALL=ENTER_PROCEDURE

* CWNVAR402= 1     - measure F0
*          = 2     - shift and update actual work coord sys F7
*          = 3     - update actual coord sys F8
*          = 4     - check position F500
*          = 5     - check size F600
*          = 6     - check form F700
*          = 7     - Update Work Coordinate (G54 to G59) F1-F6
*          = 8     - Update Additional Work Coordinate (G54P1 to G54P300) F101-F400
*
* CWNVAR403= 0     - no printing
*          = 1     - print result
*
* CWNVAR404= 0-5   - Update Work coordinate (G54 to G59)
* CWNVAR405= 1-300 - Update Extra Work coordinate

%IF CWNVAR402=1 %THEN #DATUM=0 : %GOTO @PRINT
%IF CWNVAR402=2 %THEN #DATUM=0 : %GOTO @ERROR
%IF CWNVAR402=3 @PRINT
%IF CWNVAR402=4 %THEN #DATUM=0 : %GOTO @ERROR
%IF CWNVAR402=5 %THEN #DATUM=0 : %GOTO @ERROR
%IF CWNVAR402=6 %THEN #DATUM=0 : %GOTO @ERROR
%IF CWNVAR402=7 @WORK-CO

* Update Extended Work coordinate
* Secondary range G54P1 to G54P48
#DATUM=CWNVAR405+100
%IF CWNVAR405>48 %THEN $WARNING="Warning - Addtional Offset must be between 1 and 48 - defaulting to S101":%CALL=CODECON_WARNING:#DATUM=101
%GOTO @PRINT

@WORK-CO
* Update Work coordinate
* Primary range G54 to G59
#DATUM=CWNVAR404+1
%GOTO @PRINT

@ERROR
$WARNING="Warning - Function not implemented - defaulting to S0":%CALL=CODECON_WARNING

@PRINT
%IF CWNVAR403=1 %THEN #PRINT=1 %ELSE #PRINT=#FUNNY

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_PROBE_MODE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_PROBE_MODE:%CALL=ENTER_PROCEDURE
* Called only from token PROBE_MODE (Tool Change)

%IF TOOLTYPE=18 @PROBE
%CALL=PT_PROBE_OFF
%GOTO @END

@PROBE
%CALL=PT_PROBE_ON

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



%PROCEDURE=PT_PROBE_ON
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_PROBE_ON:%CALL=ENTER_PROCEDURE
* Called from token PROBE_ON & PT_PROBE_MODE

%IF TOOLTYPE<>18 @END
%IF #PROBEON=1 @END

%CALL=CODECON_PROBE_ON
#PROBEON=1

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



%PROCEDURE=PT_PROBE_OFF
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_PROBE_OFF:%CALL=ENTER_PROCEDURE
* Called from token PROBE_OFF & PT_PROBE_MODE

%IF #PROBEON=0 @END
%IF #PROBEON=#FUNNY @END

%CALL=CODECON_PROBE_OFF
#PROBEON=0

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*************************************************************************************
*         prototype probing code constructors
*************************************************************************************

%PROCEDURE=CODECON_PROBE_NC_GAGE
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe NC Gage	*****>
@NO_CON-DEBUG


;Sequence Definition^<4575>Probe NC Gage^-1^<3671>Probing Cycles^
;Use Tokens^DELETE^BLKNUM^SUBCALL^GAGE_PROGRAM^COMMENT^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ ^[COMMENT]
;Default Sequence^[DELETE]^[BLKNUM]^[SUBCALL]^ ^[GAGE_PROGRAM]
;TEXT^Used to call Probing commands directly on the controller
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] [USERDEFINEDSTRING]>
%CALL=PT_BINC
#SUBSTARTMCODE=DATA2(34)
<[#DELETE=29][#BNUM=25][#SUBSTARTMCODE=23] [NCGAGEPROGNAME]>



%ENDM

%PROCEDURE=CODECON_PROBE_ON
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Mode On	*****>
@NO_CON-DEBUG

#FEEDRATE=FEED

;Sequence Definition^<3862>Probe Mode On^-1^<3671>Probing Cycles^
;Use Tokens^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9832
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9832>



%ENDM

%PROCEDURE=CODECON_PROBE_OFF
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Mode Off	*****>
@NO_CON-DEBUG

#FEEDRATE=FEED

;Sequence Definition^<3864>Probe Mode Off^-1^<3671>Probing Cycles^
;Use Tokens^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9833
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9833>



%ENDM


*************************************************************************************
* CYCLE 1: Probe Feed
*************************************************************************************

%PROCEDURE=CODECON_PROBE_FEED
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Feed Move	*****>
@NO_CON-DEBUG

%OUTPUT-IF-CHANGED=#FEEDX,#FEEDY,#FEEDZ

%IF #TOOLCHANGE=0 @NOG43
%IF #FEEDZ=#FUNNY @NOG43
#TEMP=#FEEDZ
#FEEDZ=ZTOOL-#ZGAUGE:<[#FEEDZ=10]> ; Initialise
#FEEDZ=#TEMP
* Trap first Z move after toolchange for G43
#TEMP=ZTOOL-#ZGAUGE
%IF #FEEDZ=#TEMP @NOG43
%CALL=CODECON_PROBE_FEED_Z1
%GOTO @END

@NOG43
#FEEDRATE=FEED

;Sequence Definition^<3670>Feed Move^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9810^[PROBEX]^[PROBEY]^[PROBEZ]^[PROBEFEED]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9810[#FEEDX=94][#FEEDY=95][#FEEDZ=96][FEED=97]>



@END
%ENDM

%PROCEDURE=CODECON_PROBE_FEED_Z1
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Feed First Z Move	*****>
@NO_CON-DEBUG

#FEEDRATE=FEED

;Sequence Definition^<3945>Feed First Z Move^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9810^[PROBEX]^[PROBEY]^ G43^[PROBEZ]^[PROBEFEED]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9810[#FEEDX=94][#FEEDY=95] G43[#FEEDZ=96][FEED=97]>



#TOOLCHANGE=0
%ENDM

*************************************************************************************
* CYCLE 2: |_| - Three Point Bore
*************************************************************************************

%PROCEDURE=CODECON_PROBE_BORE3
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe 3 Point Bore	*****>
@NO_CON-DEBUG

#AngleA=FIELD3
#AngleB=FIELD4
#AngleC=FIELD5
@LOOP1
%IF #AngleA <= -360 %THEN #AngleA=#AngleA+360:%GOTO @LOOP1
@LOOP2
%IF #AngleB <= -360 %THEN #AngleB=#AngleB+360:%GOTO @LOOP2
@LOOP3
%IF #AngleC <= -360 %THEN #AngleC=#AngleC+360:%GOTO @LOOP3
@LOOP4
%IF #AngleA >   360 %THEN #AngleA=#AngleA-360:%GOTO @LOOP4
@LOOP5
%IF #AngleB >   360 %THEN #AngleB=#AngleB-360:%GOTO @LOOP5
@LOOP6
%IF #AngleC >   360 %THEN #AngleC=#AngleC-360:%GOTO @LOOP6
#RADCLEAR=0-ABS(FIELD2)
#RADCLEAR=#RADCLEAR-TOOLRAD

;Sequence Definition^<3672>3 Point Bore^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9823^[PROBE_DEPTH]^[PROBE_CLEAR]^[PROBEDATUM]^[PROBEANG_A]^[PROBEANG_B]^[PROBEANG_C]^[PROBEDIAM]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9823[#PROBEZDEPTH=107][#RADCLEAR=108][#DATUM=111][#ANGLEA=99][#ANGLEB=100][#ANGLEC=101][#DIAMETER=98][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM

*************************************************************************************
* CYCLE 3: |¯| - Three Point Boss
*************************************************************************************
%PROCEDURE=CODECON_PROBE_BOSS3
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe 3 Point Boss	*****>
@NO_CON-DEBUG

#AngleA=FIELD3
#AngleB=FIELD4
#AngleC=FIELD5
@LOOP1
%IF #AngleA <= -360 %THEN #AngleA=#AngleA+360:%GOTO @LOOP1
@LOOP2
%IF #AngleB <= -360 %THEN #AngleB=#AngleB+360:%GOTO @LOOP2
@LOOP3
%IF #AngleC <= -360 %THEN #AngleC=#AngleC+360:%GOTO @LOOP3
@LOOP4
%IF #AngleA >   360 %THEN #AngleA=#AngleA-360:%GOTO @LOOP4
@LOOP5
%IF #AngleB >   360 %THEN #AngleB=#AngleB-360:%GOTO @LOOP5
@LOOP6
%IF #AngleC >   360 %THEN #AngleC=#AngleC-360:%GOTO @LOOP6
#RADCLEAR=ABS(FIELD2)
#RADCLEAR=#RADCLEAR+TOOLRAD
************************************


;Sequence Definition^<3673>3 Point Boss^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9823^[PROBE_DEPTH]^[PROBE_CLEAR]^[PROBEDATUM]^[PROBEANG_A]^[PROBEANG_B]^[PROBEANG_C]^[PROBEDIAM]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9823[#PROBEZDEPTH=107][#RADCLEAR=108][#DATUM=111][#ANGLEA=99][#ANGLEB=100][#ANGLEC=101][#DIAMETER=98][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM



*************************************************************************************
* CYCLE 4: |_| - Four Point Bore
*************************************************************************************

%PROCEDURE=CODECON_PROBE_BORE4
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe 4 Point Bore	*****>
@NO_CON-DEBUG

#RADCLEAR=0-ABS(FIELD2)
#RADCLEAR=#RADCLEAR-TOOLRAD

;Sequence Definition^<3674>4 Point Bore^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9814^[PROBEDIAM]^[PROBE_DEPTH]^[PROBE_CLEAR]^[PROBEDATUM]^[PROBEOVER]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9814[#DIAMETER=98][#PROBEZDEPTH=107][#RADCLEAR=108][#DATUM=111][#OVERTRAVEL=112][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM

*************************************************************************************
* CYCLE 5: |¯| - Four Point Boss
*************************************************************************************

%PROCEDURE=CODECON_PROBE_BOSS4
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe 4 Point Boss	*****>
@NO_CON-DEBUG

#RADCLEAR=ABS(FIELD2)
#RADCLEAR=#RADCLEAR+TOOLRAD

;Sequence Definition^<3675>4 Point Boss^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9814^[PROBEDIAM]^[PROBE_DEPTH]^[PROBE_CLEAR]^[PROBEDATUM]^[PROBEOVER]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9814[#DIAMETER=98][#PROBEZDEPTH=107][#RADCLEAR=108][#DATUM=111][#OVERTRAVEL=112][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM

*************************************************************************************
* CYCLE 6: Single Surface
*************************************************************************************

%PROCEDURE=CODECON_PROBE_SURF1
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Single Surface	*****>
@NO_CON-DEBUG

%IF 	#PROBEDIRECTION = 1 %THEN
#TRX = XPOINT(2)
#TRY = #FUNNY
#TRZ = #FUNNY
%ELSEIF #PROBEDIRECTION = 2 %THEN
#TRX = #FUNNY
#TRY = YPOINT(2)
#TRZ = #FUNNY
%ELSEIF #PROBEDIRECTION = 3 %THEN
#TRX = #FUNNY
#TRY = #FUNNY
#TRZ = ZDEPTH
%ELSE
<* WARNING - SINGLE SURFACE>
%ENDIF

;Sequence Definition^<3676>Single Surface^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9811^[PROBE_FX]^[PROBE_FY]^[PROBE_FZ]^[PROBEDATUM]^[PROBEOVER]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9811[#TRX=102][#TRY=103][#TRZ=104][#DATUM=111][#OVERTRAVEL=112][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM

*************************************************************************************
* CYCLE 7: Angled Single Surface
*************************************************************************************

%PROCEDURE=CODECON_PROBE_ANGSURF1
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Angled Single Surface	*****>
@NO_CON-DEBUG

;Sequence Definition^<3677>Angled Single Surface^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9821^[PROBEDIR]^[PROBEDIST]^[PROBEDATUM]^[PROBEOVER]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9821[#ANGLE=105][#DISTANCE=106][#DATUM=111][#OVERTRAVEL=112][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM


*************************************************************************************
* CYCLE 8: Web/Pocket
*************************************************************************************

%PROCEDURE=CODECON_PROBE_WEB_POCKET
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Web Pocket	*****>
@NO_CON-DEBUG

%IF #PROBEDIRECTION = 1 %THEN
#PROBESTARTX = (#PT1X + #PT2X) /2
#PROBESTARTY = YPOINT(2)
%ELSEIF #PROBEDIRECTION = 2 %THEN
#PROBESTARTX = XPOINT(2)
#PROBESTARTY = (#PT1Y + #PT2Y) /2
%ELSE
#PROBESTARTX = #FUNNY
<* WARNING - WEB/POCKET>
%ENDIF

%CALL=MOVE-TO-PROBE-START

%IF 	#PROBEDIRECTION = 1 %THEN
#TRX = ABS(#PT2X - #PT1X)
#TRY = #FUNNY
%ELSEIF #PROBEDIRECTION = 2 %THEN
#TRX = #FUNNY
#TRY = (1 + #PT2Y) - (1 + #PT1Y)
#TRY = ABS(#TRY)
%ELSE
<* WARNING - WEB/POCKET (2)>
%ENDIF

;Sequence Definition^<3678>Web Pocket^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9812^[PROBE_FX]^[PROBE_FY]^[PROBE_FZ]^[PROBE_CLEAR]^[PROBEDATUM]^[PROBEOVER]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9812[#TRX=102][#TRY=103][#TRZ=104][#RADCLEAR=108][#DATUM=111][#OVERTRAVEL=112][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM

*************************************************************************************
* CYCLE 9: Angled Web/Pocket
*************************************************************************************

%PROCEDURE=CODECON_PROBE_ANG_WEB_POCKET
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Angled Web Pocket	*****>
@NO_CON-DEBUG

#PROBESTARTX = (#PT1X + #PT2X) /2
#PROBESTARTY = (#PT1Y + #PT2Y) /2

%CALL=MOVE-TO-PROBE-START

#DISTANCE	= ((#PT1X-#PT2X)^2) + ((#PT1Y-#PT2Y)^2)
#DISTANCE	= SQR(#DISTANCE)
#ANGLE		= FIELD10

;Sequence Definition^<3679>Angled Web Pocket^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9822^[PROBEDIR]^[PROBEDIST]^[PROBE_FZ]^[PROBE_CLEAR]^[PROBEDATUM]^[PROBEOVER]^[PROBE_FTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9822[#ANGLE=105][#DISTANCE=106][#TRZ=104][#RADCLEAR=108][#DATUM=111][#OVERTRAVEL=112][#TOLERANCE=113][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM


*************************************************************************************
* CYCLE 10: Internal Corner
*************************************************************************************

%PROCEDURE=CODECON_PROBE_INTERNAL_CORNER
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe Internal Corner	*****>
@NO_CON-DEBUG

;Sequence Definition^<3680>Internal Corner^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9815^[PROBE_FX]^[PROBE_FY]^[PROBE_2X]^[PROBE_2Y]^[PROBEDATUM]^[PROBEOVER]^[PROBE_ANGTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9815[#TRX=102][#TRY=103][#SECONDX=109][#SECONDY=110][#DATUM=111][#OVERTRAVEL=112][#ANGULARTOLERANCE=116][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM

*************************************************************************************
* CYCLE 11: External Corner
*************************************************************************************

%PROCEDURE=CODECON_PROBE_EXTERNAL-CORNER
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe External Corner	*****>
@NO_CON-DEBUG

;Sequence Definition^<3681>External Corner^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBEANG_A^PROBEANG_B^PROBEANG_C^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9816^[PROBE_FX]^[PROBE_FY]^[PROBE_2X]^[PROBE_2Y]^[PROBEDATUM]^[PROBEOVER]^[PROBE_ANGTOL]^[PROBE_POSTOL]^[PROBE_UPPERTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
<[#DELETE=29][#BNUM=25] G65 P9816[#TRX=102][#TRY=103][#SECONDX=109][#SECONDY=110][#DATUM=111][#OVERTRAVEL=112][#ANGULARTOLERANCE=116][#POSITIONTOLERANCE=114][#UPPERTOLERANCE=115]>



%ENDM

*************************************************************************************
* CYCLE 12: 4th Axis X
*************************************************************************************

%PROCEDURE=CODECON_PROBE_4AX_X
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe 4th Axis X	*****>
@NO_CON-DEBUG

;Sequence Definition^<3682>4th Axis X^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEXDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9817^[<+>PROBEXDIST]^[PROBE_DEPTH]^[PROBEDATUM]^[PROBEOVER]^[PROBE_ANGTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
#DISTANCE=ABS(#DISTANCE)
<[#DELETE=29][#BNUM=25] G65 P9817[#DISTANCE=117][#PROBEZDEPTH=107][#DATUM=111][#OVERTRAVEL=112][#ANGULARTOLERANCE=116]>



%ENDM

*************************************************************************************
* CYCLE 13: 4th Axis Y
*************************************************************************************

%PROCEDURE=CODECON_PROBE_4AX_Y
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Code Constructor	:	Probe 4th Axis Y	*****>
@NO_CON-DEBUG

;Sequence Definition^<3683>4th Axis Y^-1^<3671>Probing Cycles^
;Use Tokens^PROBE_ON^PROBE_OFF^DELETE^BLKNUM^PROBEX^PROBEY^PROBEZ^PROBEFEED^PROBEDIAM^PROBE_FX^PROBE_FY^PROBE_FZ^PROBE_DEPTH^PROBE_CLEAR^PROBE_2X^PROBE_2Y^PROBEDATUM^PROBEOVER^PROBE_PRINT^PROBEDIR^PROBEYDIST^PROBE_FTOL^PROBE_POSTOL^PROBE_UPPERTOL^PROBE_ANGTOL^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^[PROBE_ON]
;Default Sequence^[DELETE]^[BLKNUM]^ G65 P9818^[<+>PROBEYDIST]^[PROBE_DEPTH]^[PROBEDATUM]^[PROBEOVER]^[PROBE_ANGTOL]
;TEXT^Probing cycle formatted for Renishaw Inspection Plus
;TEXT^PROBE_ON PROBE_OFF Tokens act modally to call code constructors
%CALL=PT_PROBE_ON
%CALL=PT_BINC
#DISTANCE=ABS(#DISTANCE)
<[#DELETE=29][#BNUM=25] G65 P9818[#DISTANCE=118][#PROBEZDEPTH=107][#DATUM=111][#OVERTRAVEL=112][#ANGULARTOLERANCE=116]>



%ENDM
*** End of include file A:\Pams\cam\machdef\template\Mill-Renishaw-Probing.cgi ***

*** Start of include file mill-whiteboard-CGX.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	Whiteboard.cgi
*	Author:		RHA
*   Date:       09 December 2005
*
* New file for all adaptive template
**************************************************************************
*   Change History
* Version 10.5
*          FIRST ISSUE
* 14/02/05 RHA DEV00016309 Fix long lines for codecon.txt
* Version 12.5
* 19/02/08 RHA DEV00022469 Add note prohibiting duplicate macros and procedures
* Version 2009.2
* 26/01/09 RHA DEV00025914 Add attribute_extension to macros and whiteboard
* 27/01/09 RHA DEV00025914 Put new procedure in new code constructor - allows CGD compilation
* 17/02/09 RHA DEV00025914 Prevent user deletion of new procedure
* Version 2013.2
* 27/11/12 RHA W54303 CGX variant for milling whiteboard
* 29/11/12 RHA W54439 Make Customisation Whiteboard and PDI attribute user tokens green
* Version 2014.2
* 11/03/14 GST W63762 Add macro breakout
* 13/03/14 RHA W55288 Add Default Sequence to breakout Code Constructor
*
**************************************************************************






*	*****************************************
*	*	Tab Name	:	Hackers Corner	*
*	*****************************************
*
%PROCEDURE=ATTRIBUTE_EXTENSION
%IF #PROCTRACE=1 %THEN $PROCEDURE=ATTRIBUTE_EXTENSION:%CALL=ENTER_PROCEDURE

;Sequence Definition^<3797>PDI Attribute Extension^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^SAFEBLKNUM^ABS-INC^TOOLDESCR^TOOLTYPE^COMMENT^TURRETNO^LENGTHOFFSET^SPEED^NEXTTOOL^COOLANT^COOLANT OFF^COOLTHROTOOL^COMPGCODE^COMP OFF^SPINDIR^WORKGCODE^FEEDMODEGCODE^ZGAUGELENGTH^GEARMCODE^TOOLDIAM^UNITSGCODE^FEEDGCODE^EXACTSTOPGCODE^XMOVE^YMOVE^ZMOVE^COMPGCODE^CRC REGISTER^FEED^SPEED^FEEDMODEGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^;CODE:* Procedure for additional attribute function in connection with PDI customisation
;TEXT^This procedure is called from Macro 71 if SUBFUNCT<200
;TEXT^Allows customisation in connection with PDIs
;TEXT^Note that 5AX uses SUBFUNCT 2,3 and Thread Mill uses 2,10
;TEXT^It is the users responsibility to ensure that TOKENS are correct in the
;TEXT^   context in which they are used.
* Procedure for additional attribute function in connection with PDI customisation






%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;CGXTAB^WHITE3^3 Axis Mill^3AXMILL

%PROCEDURE=CODECON_WHITEBOARD
;Sequence Definition^<2845>Customisation Whiteboard^-1^<917>Miscellaneous Functions^
;Use Tokens^DELETE^BLKNUM^SAFEBLKNUM^ABS-INC^TOOLDESCR^TOOLTYPE^COMMENT^TURRETNO^LENGTHOFFSET^SPEED^NEXTTOOL^COOLANT^COOLANT OFF^COOLTHROTOOL^COMPGCODE^COMP OFF^SPINDIR^WORKGCODE^FEEDMODEGCODE^ZGAUGELENGTH^GEARMCODE^TOOLDIAM^UNITSGCODE^FEEDGCODE^EXACTSTOPGCODE^XMOVE^YMOVE^ZMOVE^COMPGCODE^CRC REGISTER^FEED^SPEED^FEEDMODEGCODE^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^;CODE:* Terminate the procedure defining the code_constructor
;Default Sequence^;CODE:%ENDM
;Default Sequence^;CODE:
;Default Sequence^;CODE:
;Default Sequence^;CODE:%PROCEDURE=NEW_FUNCTION_1
;Default Sequence^;CODE:%IF #PROCTRACE=1 %THEN $PROCEDURE=NEW_FUNCTION_1:%CALL=ENTER_PROCEDURE
;Default Sequence^;CODE:
;Default Sequence^;CODE:* Dummy procedure for customised function
;Default Sequence^;CODE:
;Default Sequence^;CODE:%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
;Default Sequence^;CODE:%ENDM
;Default Sequence^;CODE:
;Default Sequence^;CODE:
;Default Sequence^;CODE:
;Default Sequence^;CODE:* Example declaration
;Default Sequence^;CODE:%DECLARE=#NEWVARIABLE
;Default Sequence^;CODE:
;Default Sequence^;CODE:%PROCEDURE=NEW_FUNCTION_2
;Default Sequence^;CODE:%IF #PROCTRACE=1 %THEN $PROCEDURE=NEW_FUNCTION_2:%CALL=ENTER_PROCEDURE
;Default Sequence^;CODE:
;Default Sequence^;CODE:* Dummy procedure for customised function
;Default Sequence^;CODE:
;Default Sequence^;CODE:%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
;Default Sequence^;CODE:* %ENDM for the last procedure is contained within the code_constructor
;TEXT^Dummy CODE_CONSTRUCTOR for customisation procedures etc.
;TEXT^Not called by any Code Generator functions
;TEXT^Duplicate macro and procedure definitions are not permitted
;TEXT^It is the users responsibility to ensure that TOKENS are correct in the
;TEXT^   context in which they are used.
;TEXT^A CODE_CONSTRUCTOR is a PROCEDURE. The matching of %PROCEDURE and %ENDM
;TEXT^   statements must be preserved.
;TEXT^Instructions such as %DECLARE should only be used between procedures.
* Terminate the procedure defining the code_constructor
%ENDM


%PROCEDURE=NEW_FUNCTION_1
%IF #PROCTRACE=1 %THEN $PROCEDURE=NEW_FUNCTION_1:%CALL=ENTER_PROCEDURE

* Dummy procedure for customised function

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



* Example declaration
%DECLARE=#NEWVARIABLE

%PROCEDURE=NEW_FUNCTION_2
%IF #PROCTRACE=1 %THEN $PROCEDURE=NEW_FUNCTION_2:%CALL=ENTER_PROCEDURE

* Dummy procedure for customised function

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
* %ENDM for the last procedure is contained within the code_constructor






%ENDM
;CGXTAB^WHITE3^3 Axis Mill^3AXMILL


%PROCEDURE=CODECON_BREAKOUT
;Sequence Definition^<4427>Customisation Breakout^-1^<917>Miscellaneous Functions^
;Use Tokens^USER-STRING^USER-STRING-1^USER-STRING-2^USER-STRING-3^USER-STRING-4^USER-STRING-5^USER-1^USER-2^USER-3^USER-4^USER-5^USER-6^USER-7^USER-8^USER-9^USER-10^USER-11^USER-12^USER-13^USER-14^USER-15^USER-16^USER-17^USER-18^USER-19^USER-20
;Default Sequence^
;TEXT^Dummy CODE_CONSTRUCTOR for customisation procedures etc.
;TEXT^Called at MACRO level of processing, structure similar to Whiteboard
;TEXT^Use #MACRO and #EXECMACRO to allocate procedures




%ENDM
;CGXTAB^WHITE3^3 Axis Mill^3AXMILL
*** End of include file A:\Pams\cam\machdef\template\mill-whiteboard-CGX.cgi ***
*** Start of include file mill-iso-macros.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	mill-iso-macros.cgi
*	Author:		RHA
*   Date:       11 November 2005
*
* New file for adaptive milling templates derived from earlier multiplane template                                *
**************************************************************************
*   Change History
* Version 10.5
*          FIRST ISSUE
* 06/02/06 RHA DEV00007742 Single helix option for Thread Mill
* 28/02/06 RHA DEV00016465 Remove macro 101 - old spindle control
* 03/03/06 RHA DEV00016525 Correct longhand drill output
* 07/03/06 RHA DEV00015555 High Speed mode tolerance
* 08/03/06 RHA DEV00016567 Use system var for work datum name override
* Version 11.0
* 18/07/06 RHA DEV00017692 Tidy Code Generator options in hole macros
* 01/08/06 RHA DEV00017489 #Macro not set for hole cycles
* 07/08/06 RHA DEV00012241 Add High speed and coolant controls to Tool Change*
* 08/08/06 RHA DEV00017341 Correct Tool Length Offset setting
* Version 11.5
* 18/07/06 RHA DEV00012692 Correct drill sub output for 1 location
* 26/10/06 RHA DEV00018471 HPCC improvements
* 13/12/06 RHA DEV00018738 Correction for profile start
* Version 11.75
* 03/04/07 RHA DEV00017611 Implement 21 flag in rotary rotate
* 18/05/07 RHA DEV00017611 Change withdrawn, pending other fixes
* Version 12.00
* 03/04/07 RHA DEV00020278 Allow Macro15 access to USERVAR2
* Version 12.25
* 03/12/07 RHA DEV00021534 Enable longhand tapping
* Version 12.50
* 04/02/08 RHA DEV00006310 Allow canned cycles in Rotary Rotate
* Version 2009.1
* 07/07/08 RHA DEV00023548 Implement NC Code Suppression
* 06/08/08 RHA DEV00024310 Back bore and face in milling
* 11/08/08 RHA DEV00024364 Implement helical hole cycles
* 26/08/08 GST DEV00022751 Thread mill depth in canned cycle
* 16/09/08 RHA DEV00024818 Back Bore and Helical parameters - level retract etc.
* Version 2009.2
* 07/11/08 RHA DEV00025098 Make tool angle available in setup & core tool change
* 26/01/09 RHA DEV00025914 Add attribute_extension to macros and whiteboard
* 02/04/09 RHA DEV00023944 Fix unwanted angles from rotary rotate (head/table)
* 14/07/09 RHA WI34873 New Thread Mill - Add new macro and processing
* 17/07/09 RHA WI34873 New Thread Mill - Use Hole cycle point processing
* 18/04/09 RHA W34873 Initialise CRC controls in Macro 675
* Version 2010.1 SP1
* 13/10/09 RHA W32420 Correct setting of stationary angle in rotary rotate
* 08/12/09 RHA W35163 Add FEED modifier to macro 672
* 15/01/10 RHA W37297 Add Single Shot option for Exact Stop
* 29/01/10 RHA W37371 Warn for subroutines if converted to longhand (Thread mill)
* 31/03/10 RHA W38513 Activate canned cycle switches for orthogonal planes
* 11/05/10 RHA W39137 Set #HOLEOFFSET in a procedure and call from Move Angular
* 29/09/10 RHA W40981 Correct incremental datum setting (W40898 error)
* Version 2011.2
* 26/10/10 RHA W32074 Datum Shift, modify GETCPL call in macro 48
* 29/11/10 RHA W33515 Fix incremental angles for rotary rotate
* 15/12/10 RHA W38043 Set FEEDTYPE system var in Macro 21
* 16/12/10 RHA W41997 Implement peck tapping
* 05/04/11 RHA W43835 Force G Code output after Peck call (Macro=35)
* Version 2012.1
* 17/05/11 RHA W43644 Correct dwell code output, back bore etc (Macro=71)
* 21/06/11 RHA Selective threadmill canned cycles
* Version 2012.2
* 25/10/11 RHA W45241 Macro trace fixes
* 06/02/12 RHA W47500 Implement auxiliary Z axes
* 22/02/12 RHA W48595 Make PLANEGCODE more robust
* 19/03/12 RHA W49403 Implement Quill Retract function
* Version 2013.2
* 20/03/13 GST W31039 Implement new coolant system - fase 1
* 20/03/13 GST W55128 Implement Rotary Axial interpolation
* 16/05/13 RHA W54506 Remove [] from Macro=109 definition
* Version 2014.1
* 05/09/13 GST W59942 Fix null index detection
* 07/10/13 GST W60131 Initialise position at Move Angular when in Dynamic mode
* Version 2014.2
* 11/03/14 GST W63762 Add macro breakout
* Version 2015.1
* 07/07/14 GST W61121 Implement Maximum Linear Separation
* 31/07/14 GST W65629 Fix direction assignment
* 31/07/14 GST W66427 Fix angular data after Move Angular
* 08/09/14 GST W61121 Disable Maximum Linear Separation
* Version 2015.2
* 11/02/15 GST W81600 Implement Program Stop on Move to Home/TC
*
**************************************************************************

;
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 1   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=1=RA=Rapid move=1,2,3,
$SPC=" "; Reset trace spacing
#MACRO=1
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


#XMOVE=XMOVE:#YMOVE=YMOVE:#ZMOVE=ZMOVE
%CALL=PT_OUTPUT_RAPID
@END
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 2   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=2=FE=Feed move=1,2,3,5,6,7,
$SPC=" "; Reset trace spacing
#MACRO=2
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-2

%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 3   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=3=CI=Circular feed move=1,2,5,7,
$SPC=" "; Reset trace spacing
#MACRO=3
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

* Force #TOOLCHANGE=#FALSE to prevent SPEEDS lookahead
#TOOLCHANGE=#FALSE


%CALL=C_AXIS_SELECT
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 4   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=4=FM=Face milling cycle=1,2,9,5,6,7,
$SPC=" "; Reset trace spacing
#MACRO=4
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%CALL=C_AXIS_SELECT
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 5   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=5=PR=Profiling cycle=4,5,6,7,9,12,13,21[$Y],22[$N],24,25,
$SPC=" "; Reset trace spacing
#MACRO=5
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


* Suppress CRC calls until Subfunct is set
$COMPOUTPUT=TRUE
#COMPGCODE=DATA1(20)

%CALL=PT_PLANE_INIT

%CALL=C_AXIS_SELECT
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 6   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=6=AC=Area clearance cycle=4,5,6,7,9,12,16,22[$N],
$SPC=" "; Reset trace spacing
#MACRO=6
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%CALL=C_AXIS_SELECT
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 7   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=7=SL=Slot profiling cycle=4,5,6,7,9,
$SPC=" "; Reset trace spacing
#MACRO=7
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%CALL=C_AXIS_SELECT
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 8   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=8=XH=Xhatch area clearance=4,5,6,7,9,12,16,49,
$SPC=" "; Reset trace spacing
#MACRO=8
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%CALL=C_AXIS_SELECT
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = Hole Cycles   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=9=DR=Drill cycle=4,6,7,9,10,23,21,27,28,29,50,53|176,200,201,210,205,206,203,204,
$SPC=" "; Reset trace spacing
#MACRO=9
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
%CALL=DRILL-CYCLE
%ENDM
;
%MACRO=10=CB=Chip break cycle=4,6,7,9,10,23,-21,27,28,29,50,53|176,200,201,210,205,206,203,204,
$SPC=" "; Reset trace spacing
#MACRO=10
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
%CALL=CHIPBREAK-CYCLE
%ENDM

%MACRO=11=RE=Ream/Bore cycle=4,6,7,9,21,27,28,29,50,53|176,200,201,210,205,206,203,204,
$SPC=" "; Reset trace spacing
#MACRO=11
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
%CALL=REAM-CYCLE
%ENDM

%MACRO=12=BO=Bore cycle=4,6,7,9,-21,27,28,29,50,53|176,200,201,210,205,206,203,204,
$SPC=" "; Reset trace spacing
#MACRO=12
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
%CALL=BORE-CYCLE
%ENDM

%MACRO=13=TA=Tapping cycle=4,6,7,9,10,21,27,28,29,200,201,210,205,206,203,204,
$SPC=" "; Reset trace spacing
#MACRO=13
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
%CALL=TAP-CYCLE
%ENDM

;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; Additional hole cycles
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;___________________________________________________________ Macro = 671 __

%MACRO=671=..=Back Bore Face=4,6,7,9,63,10,21,27,28,29,50,76,77,73,203,50,53|176,200,201,210,205,206,203,204,300,301,302,303,304,305,
$SPC=" "; Reset trace spacing
#MACRO=671
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=BACK-BORE-CYCLE

%ENDM


;___________________________________________________________ Macro = 672 __

%MACRO=672=..=Helical Hole=4,5,6,7,9,63,10,21,27,28,29,50,76,77,73,203,50,53|176,200,201,210,205,206,203,204,306,307,308,309,310,311,312,
$SPC=" "; Reset trace spacing
* <HOLEDIAM [HOLEDIAM=0] CHAMFERWIDTH [CHAMFERWIDTH=0] CHAMFERANGLE [CHAMFERANGLE=0] PITCH1 [PITCH1=0] PITCH2 [PITCH2=0] BOTTOMFINISH [BOTTOMFINISH=0] MACHDIR [MACHDIR=0]>

#MACRO=672
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=HELICAL-CYCLE

%ENDM


;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ


%MACRO=14=MR=Move relative to profile=4,9,12,13,59,60,5,6,7,
$SPC=" "; Reset trace spacing
#MACRO=14
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%CALL=C_AXIS_SELECT
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 15  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=15=TL=Toolchange=-8,12,24,47,48,205,203[0.01],208,202,
$SPC=" "; Reset trace spacing
#MACRO=15
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-15

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 21  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=21=FR/FM=Feed per rev / Feed per min=
$SPC=" "; Reset trace spacing
#MACRO=21
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%IF SUBFUNCT=1 %THEN #FEEDMODEGCODE=DATA1(46):FEEDTYPE=2	;	Feed / rev (G95)
%IF SUBFUNCT=2 %THEN #FEEDMODEGCODE=DATA1(45):FEEDTYPE=1	;	Feed / min (G94)
%CALL=CODECON_FEED-MIN-REV
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 22  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=22=DW=Dwell=27,
$SPC=" "; Reset trace spacing
#MACRO=22
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
%IF #SKIPTAP=1 %THEN #SKIPTAP=#FUNNY:%GOTO @END
#DWELLGCODE=DATA1(5)
%CALL=CODECON_DWELL
@END
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 29  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=29=NC/CL/CR=Compensation off/left/right=201,=  COMP OFF/ COMP LEFT/COMP RIGHT
$SPC=" "; Reset trace spacing
#MACRO=29
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-29

%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 30  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=30=MS=Matrix mode on=43,44,38,39,40,41,21[$Y],82,
$SPC=" "; Reset trace spacing
#MACRO=30
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 31  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=31=MO=Matrix mode off=
$SPC=" "; Reset trace spacing
#MACRO=31
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 32  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=32=TR=Translate=43,44,45,14,26,37,21,
%IF MASK=1 @END
$SPC=" "; Reset trace spacing
#MACRO=32
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-32

@END
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 33  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=33=RO=Rotate=1,2,14,26,24,37,21[$N],
$SPC=" "; Reset trace spacing
#MACRO=33
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-33

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 34  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=34=MI=Mirror=1,2,14,26,-21[$Y],
$SPC=" "; Reset trace spacing
#MACRO=34
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#MIRROR=1
%NOCYCLE	;	Longhand only
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 35  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=35=PE=Peck=14,26,45,9,29,21,58,
$SPC=" "; Reset trace spacing
#MACRO=35
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-35
%CANCEL=#GCODE ; Force Gcode on next block
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 36  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=36=TC/TM/TF=SELECT CUT TYPE OVERRIDE=
$SPC=" "; Reset trace spacing
#MACRO=36
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 37  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=37=th=THREAD MILL=7,208,104|176,103|177,143|178,161|179,132|180,129|181,9|182,
$SPC=" "; Reset trace spacing
#MACRO=37
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-37

@END
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 48  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=48=DS=DATUM SHIFT=
$SPC=" "; Reset trace spacing
#MACRO=48
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#DIRHOLD3=DIRECTION ; preserve spindle direction

* %IF STYPE=1 %THEN
%GETCPL=SUBFUNCT
$CPLNAME=GROUPDESCRIPTION
#ZTOOLSUB=ZSUB
%CALL=SELECT_WORK_DATUMS

* Set Holds
#XSUBHOLD=XSUB
#YSUBHOLD=YSUB
#ZSUBHOLD=ZSUB

DIRECTION=#DIRHOLD3 ; retrieve spindle direction

%ENDM




;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 40  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=40=RH=Rapid to home=15,402,
$SPC=" "; Reset trace spacing
#MACRO=40
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-40

%CALL=PT_RAPID_TO_HOME_TOOLCHANGE

%CANCEL=#GCODE,#XMOVE,#YMOVE,#ZMOVE
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 41  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=41=RT=Rapid to tool change=15,402,
$SPC=" "; Reset trace spacing
#MACRO=41
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-41

%CALL=PT_RAPID_TO_HOME_TOOLCHANGE

%CANCEL=#GCODE,#XMOVE,#YMOVE,#ZMOVE
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 42  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=42=RI=Rapid to initial plane=
$SPC=" "; Reset trace spacing
#MACRO=42
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=C_AXIS_SELECT				;	Process through rapid macro
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 43  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=43=IP=Index pallet=57,
$SPC=" "; Reset trace spacing
#MACRO=43
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#DIRHOLD3=DIRECTION ; preserve spindle direction

%GETCPL=SUBFUNCT
$CPLNAME=GROUPDESCRIPTION
#ZTOOLSUB=ZSUB

* #ROTVALS controls use of ROT1/ROT2 values for rotary positioning
* #ROTVALS=#FALSE

%CALL=SELECT_WORK_DATUMS


DIRECTION=#DIRHOLD3 ; retrieve spindle direction

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 46  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=46=MR=Move relative2=4,59,7,5,
$SPC=" "; Reset trace spacing
#MACRO=46
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%NOCYCLE
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 47  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=47=MR=Move Constrain=4,59,7,5,
$SPC=" "; Reset trace spacing
#MACRO=47
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%CALL=C_AXIS_SELECT
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 53  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=CLW
$SPC=" "; Reset trace spacing
#MACRO=53
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#GCODE=DATA1(3)
%CALL=CIRCLE
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 54  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=CCLW
$SPC=" "; Reset trace spacing
#MACRO=54
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

#GCODE=DATA1(4)
%CALL=CIRCLE
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 55  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=SUBSTART
$SPC=" "; Reset trace spacing
#MACRO=55
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
#HOLECYCLE2=0 ; Initialise for cyclesub identification

*				Only applies to Subprogram style NOT inline block number reference.
%IF MASK=1 @END

*Set HOLD values
#XHOLD=XSUB
#YHOLD=YSUB
#ZHOLD=ZSUB

%CALL=PT_OUTPUT_SUBSTART

@END
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 56  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=SUBEND
$SPC=" "; Reset trace spacing
#MACRO=56
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PT_OUTPUT_SUBEND

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 59  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=SUBCALL
$SPC=" "; Reset trace spacing
#MACRO=59
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PT_OUTPUT_SUBCALL

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 60  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=RESET
$SPC=" "; Reset trace spacing
#MACRO=60
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=P-RESET

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 61  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=CYCLSUB
$SPC=" "; Reset trace spacing
#MACRO=61
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1


%IF #CYCLEPOINTS=3 @ALWAYS
%IF LAST<2 @SKIP
@ALWAYS
$OUTPUTSUBS=TRUE

%CALL=PT_OUTPUT_SUBSTART;	Subroutine start
%CALL=PT_HOLE_CYCLES	;	Output hole cycle
%CALL=PT_OUTPUT_SUBEND  ;	Subroutine end

$OUTPUTSUBS=FALSE

@SKIP
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 71  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=71=..=ATTRIBUTE=
$SPC=" "; Reset trace spacing
#MACRO=71
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
%IF SUBFUNCT<200 %THEN %CALL=ATTRIBUTE_EXTENSION:%GOTO @END

#DWELLGCODE=DATA1(5) ; For hole cycle change points
* SF201 Reverse spindle in longhand tapping
%IF SUBFUNCT=201 %THEN %CALL=PT_TAPPING_REVERSE:%GOTO @END
%IF SUBFUNCT=202 %THEN %CALL=PT_BBORE_CHANGE:%GOTO @END
%IF SUBFUNCT=203 %THEN %CALL=PT_BBORE_CHANGE

@END
%ENDM
;
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = SPLINE   ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=SPLINES
$SPC=" "; Reset trace spacing
#MACRO=72
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
;	Parameter		Variable
;
;	X point			XMOVE
;	Y point			YMOVE
;	Z point			ZMOVE
;	Feedrate		FEED
;	Speed			SPEED
;	Order of curve	FIELD1
;	Knott value		FIELD2
;	Weight			FIELD3
;	First point		SUBFUNCT=1
;	Last point 		SUBFUNCT=2
;	Tolerance		TOLERANCE
;Note:- SUBFUNCT will be set to 0 except for the first and last point

#XMOVE=XMOVE:#YMOVE=YMOVE:#ZMOVE=ZMOVE
#FEED=XYFEED:#SPEED=SPEED
%IF #TLOCOMP=#TRUE %THEN %CALL=PT_COMPENSATE_TLO
%CALL=NOMOTION
%CALL=PT_REVERSE_XYZ
%CANCEL=#XMOVE,#YMOVE,#ZMOVE

%CALL=SPLINE

%IF SUBFUNCT<>2 @END

%CALL=HOLD
@END
%ENDM


*************************************************************
*	Miscellaneous "User Defined" Macros : Reserved			*
*	==============================================			*
*															*
*************************************************************
*	101		Spindle				Stop/ CLW/ CCLW/ CLW+Coolant/ CCLW+Coolant
*	102		Reserved (Used by software?)
*	103		Stop Type			Program/ Optional
*	104		Coolant				Flood/ Mist/ Off
*	105		Block Skip			Off/ On
*	106		Exact Stop/Smooth	Off/On
*	107		Reserved (Used by software?)
*	108		Comment				Text string input
*	109		Insert NC Code		NC code literal input
*	110		High Speed M/C		Off/On  ;Located in 3m-START.xxx since its machine specific
*	111		Reserved
*	112		Reserved
*	113		Reserved
*	114		Reserved
*	115		Reserved
*	116		Length Offset		Tool Length Offset
*	117		Reserved
*	118		Reserved
*	119		Reserved
*	120		Reserved
*	121		Reserved
*	122		Reserved
*	123		Reserved
*	124     NC Code Output Suspension  On/Off
*	4001 Swarf Conveyor (turning)
*	4002 Maximum Point Separation (milling) - disabled indefinitely. See w61121.

;
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 103 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=103=..=Stop Type==Program/Optional
$SPC=" "; Reset trace spacing
#MACRO=103
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%IF SUBFUNCT=1 %THEN #STOPMCODE=DATA2(1)			;	M00
%IF SUBFUNCT=2 %THEN #STOPMCODE=DATA2(2)			;	M01
%IF $MACHINE="HEIDENHAIN" %THEN #STOPMCODE=DATA2(1)

%CALL=CODECON_PROGRAM-STOP

%CANCEL=#XMOVE,#YMOVE,#ZMOVE,#SPEED,#FEED
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 104 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=104=../..=Coolant==Flood/Mist/Off
$SPC=" "; Reset trace spacing
#MACRO=104
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%IF SUBFUNCT=1 %THEN #COOL=DATA2(8)		;	Flood
%IF SUBFUNCT=2 %THEN #COOL=DATA2(9)		;	Mist
%IF SUBFUNCT=3 %THEN #COOL=DATA2(10)		;	Off

%CALL=CODECON_COOLANT

@END
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 105 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=105=../..=Block Skip==Off/On
$SPC=" "; Reset trace spacing
#MACRO=105
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%IF SUBFUNCT=2 %THEN #DELETE=0 %ELSE #DELETE=#FUNNY
%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 106 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

;
%MACRO=106=../..=Exact Stop/Smooth==Off/On
$SPC=" "; Reset trace spacing
#MACRO=106
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-106

%ENDM
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 108 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=108=..=Comment=15,
$SPC=" "; Reset trace spacing
#MACRO=108
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=CODECON_COMMENT

@END
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 109 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;
%MACRO=109=..=Insert Nc Code=15,
$SPC=" "; Reset trace spacing
#MACRO=109
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=CODECON_INSERT-NC-CODE
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = HIGH SPEED ÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=110=../..=High Speed M/c=203[0.01],208,
$SPC=" "; Reset trace spacing
#MACRO=110
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1
#HIGHSPEEDTOL=USERVAR3
%IF USERVAR8=3 %THEN %CALL=CODECON_HIGHSPEED-ON
%IF USERVAR8=2 %THEN %CALL=CODECON_HIGHSPEED-OFF
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 116 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%MACRO=116=..=Length Offset=203[0],
$SPC=" "; Reset trace spacing
#MACRO=116
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

TOOLOFFSET=USERVAR3
%CALL=PT_SET_TLO

%CALL=CODECON_SELECT-LENGTH-OFFSET
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 124 ÃÄÄÄ
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿

%MACRO=124=..=NC Code Output==Suspend/Resume
$SPC=" "; Reset trace spacing
#MACRO=124
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

* This macro allows the user to suspend NC code via a misc function
* Note that it relies on MASK being reset by Code Generator for each macro call
* In each macro -  %IF #NCSUPPRESS=1 %THEN MASK=1

%IF SUBFUNCT=2 @RESUME
* Suspend NC Code Output
#NCSUPPRESS=1
%GOTO @END

@RESUME
#NCSUPPRESS=0

@END
%ENDM

;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 4002 ÃÄÄÄ
;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* Disabled indefinitely - see W61121.
* %MACRO=4002=..=Maximum Linear Separation=400,401
* $SPC=" "; Reset trace spacing
* #MACRO=4002
* %IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
* %CALL=CODECON_BREAKOUT

* %IF #NCSUPPRESS=1 %THEN MASK=1

* #4002ACTIVE=CWNVAR400
* #MAXMOVE=CWNVAR401
* %IF #MAXMOVE=#FUNNY %THEN #MAXMOVE=0

* @END
* %ENDM


;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 252 ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%MACRO=252=..=Spindle Control=
$SPC=" "; Reset trace spacing
#MACRO=252
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-252

%ENDM


%MACRO=675=..=Thread Milling=4,5,7,9,10,23,21,27,28,29,50,53|176,306,309,314,326,327,328,329,219,330,331,
$SPC=" "; Reset trace spacing
#MACRO=675
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

%IF #NCSUPPRESS=1 %THEN MASK=1

%CALL=PMACRO-675

@END
%ENDM



;                                                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Macro = 716  ÃÄÄÄ
;                                                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%MACRO=716=..=Coolant=
$SPC=" "; Reset trace spacing
#MACRO=716
%IF NOCYCLE=0 %THEN #EXECMACRO=#MACRO
%CALL=CODECON_BREAKOUT

* New macro drives availability of new coolant options
%IF #NCSUPPRESS=1 %THEN MASK=1


@END
%ENDM



*** End of include file A:\Pams\cam\machdef\template\mill-iso-macros.cgi ***
*** Start of include file mill-procedures-basic.cgi ***
**************************************************************************
*   Machine independant Code Generator include file
*
*   Filename:	mill-procedures-basic.cgi
*	Author:		RHA
*   Date:       11 November 2005
*
* New file for adaptive milling templates derived from earlier multiplane template
**************************************************************************
*   Change History
* Version 10.5
*          FIRST ISSUE
* 16/12/05 RHA DEV00014907 TLO setting
* 16/12/05 RHA DEV00015647 Add R in XY Only Option
* 02/02/06 RHA DEV00012705 Set radius for thread milling
* 06/02/06 RHA DEV00007742 Single helix option for Thread Mill
* 06/02/06 RHA DEV00015578 Thread mill - G40 if G01 followed by G00
* 10/02/06 RHA DEV00016236 Spindle control fixes
* 10/02/06 RHA DEV00016273 Fix G2/3 swap for G18/19
* 10/02/06 RHA DEV00016282 Thread mill move correction
* 15/02/06 RHA DEV00016297 Incremental datum shift
* 20/02/06 RHA DEV00016344 Implement IJK vector for 5 axis cycle
* 27/02/06 RHA DEV00016236 Spindle control fixes
* 27/02/06 RHA DEV00016320 Rapid after toolchange with thread mill canned cycle
* 27/02/06 RHA DEV00016464 Force spindle code out if stop
* 28/02/06 RHA DEV00016465 Correct 2D arc output in thread mill
* 28/02/06 RHA DEV00016369 Fix Convert rapid to feed
* 01/03/06 RHA DEV00016464 Add warning for feed moves at Spindle Stop
* 03/03/06 RHA DEV00016525 Correct longhand drill output
* 08/03/06 RHA DEV00016567 Use system var for work datum name override
* 14/03/06 RHA DEV00016367 Correct spindle control
* 14/03/06 RHA DEV00016464 Correction
* 16/03/06 RHA DEV00016662 Suppress unwanted CRC warning
* 21/03/06 RHA DEV00007321 Correct Datum setting - limits
* 21/03/06 RHA DEV00012705 Correct radius in helix output for thread mill
* 22/03/06 RHA DEV00016714 Remove diagnostic output line for #DATUMMAX
* 24/03/06 RHA DEV00016742 Correct index codecon calls for 4 axis, #AXISTYPE2=#AXISTYPE1
* 28/03/06 RHA DEV00016749 Correct subroutines processing for hole cycles
* Version 10.75
* 16/05/06 RHA DEV00017213 Correct index handling for no rotation cases
* 18/05/06 RHA DEV00017213 Fine tune
* 23/05/06 RHA DEV00017233 Correction for always use radius
* 24/05/06 RHA DEV00017039 Fix spindle directions in tapping
* 06/06/06 RHA DEV00017232 5 Axis check in Nomotion as well at PT_Rotary_Axes
* 13/06/06 RHA DEV00017523 Prevent output of longhand tapping cycles
* Version 11.0
* 12/07/06 RHA DEV00017700 Set #SPEED=NEXTSPEED if SPEED unset
* 25/07/06 RHA DEV00016799 Initialise tool position at toolchange and index
* 26/07/06 RHA			   Correct NEXTZMOVE setting for reversed axes
* 28/07/06 RHA DEV00017797 New MM and MT line switches
* 01/08/06 RHA DEV00017818 Hole cycle clearance and level options
* 01/08/06 RHA DEV00016703 Only process speed and gears if there is a change
* 01/08/06 RHA DEV00017490 Make spindle start warning optional
* 04/08/06 RHA DEV00017771 Number of turns token for ISO, trap and fix exact 360deg helix count
* 07/08/06 RHA DEV00012241 Add High speed and coolant controls to Tool Change
* 09/08/06 RHA DEV00017902 Correct thread mill helix for TNC
* 11/08/06 RHA DEV00012241 Remove diagnostic line, Correct thread mill for reversed axes
* 13/09/06 RHA DEV00018171 Correct initialisation of tool position after datum shift
* Version 11.5
* 25/09/06 RHA DEV00017909 Expand trace options
* 12/10/06 RHA DEV00012692 Correct drill sub output for 1 location
* 13/10/06 RHA DEV00018390 PT_CONVERT_COORDS
* 17/10/06 RHA DEV00018409 Fix Duplicate angle reversal by Rapid to ToolChange
* 03/11/06 RHA DEV00018471 ToolChange HPCC call should only be via a token
* 24/11/06 RHA DEV00017338 Move CPLNAME to a template variable
* 05/12/06 RHA DEV00018738 Fix CRC calls to cancel on arc
* 08/12/06 RHA DEV00018738 Correct calls in circle and intialise variables
* 19/12/06 RHA DEV00018593 Set #PLANEGCODE in Thread Milling
* 21/12/06 RHA DEV00018869 Remove diagnostic code
* 02/01/07 RHA DEV00017909 Remove old thread mill array dump
* 25/01/07 RHA DEV00019078 Correct datum over ride setting
* 15/02/07 RHA DEV00017338 Correction to CPL name in Rapid after TC
* Version 11.75
* 19/03/07 RHA DEV00019554 Correct precision of XCP YCPL ZCPL in use
* 13/04/07 RHA DEV00019730 Correct wrapped drill cycle approach move
* 30/04/07 RHA             Post processing speed up
* 21/05/07 RHA DEV00020096 Implement Maintain Index Option at ToolChange
* 24/05/07 RHA DEV00019981 Orthogonal plane cycle controls
* 29/05/07 RHA DEV00019987 Reverse coordinate after array axis swap
* 30/05/07 RHA DEV00019987 Limit fix to 5 axis rotary
* 01/06/07 RHA DEV00019987 Leave array axis swap but remove sign reversal.
* 01/06/07 RHA DEV00020208 Fix Index after TC (Head Head)
* Version 12.00
* 23/07/07 RHA DEV00020524 Avoid spurious CRC warnings
* 24/07/07 RHA DEV00020524 Comp Fix, Plan B. Set $COMPOUT only when state changed
* 03/08/07 RHA DEV00020524 Fix comp problem in CIRCLE procedure
* 10/08/07 RHA DEV00020285 Add new ISO Datum Shift Tokens
* 28/08/07 RHA DEV00020760 DEV00020742 DEV00019720 Fix approach coordinates
* 29/08/07 RHA DEV00020760 DEV00020742 DEV00019720 Fix axis reversals in toolchange
* 27/09/07 RHA DEV00021172 Correct datum output when index not maintained
* Version 12.25
* 18/10/07 RHA DEV00021382 Correct use of #TMP, Use #COMPTEMP
* 07/11/07 RHA DEV00019365 Additional debug output for holes and thread mill
* 03/12/07 RHA DEV00021534 Enable longhand tapping
* 17/12/07 RHA DEV00021869 Correct Rapid after TC for longhand hole cycles
* Version 12.5
* 21/12/07 RHA DEV00021292 ASIN fails on taper thread
* 24/12/07 RHA DEV00021372 Trap hole cycle level change
* 17/01/08 RHA DEV00022021 Incremental option for Z Clear
* 18/01/08 RHA DEV00021841, DEV00021908 New optional warnings
* 18/02/08 RHA DEV00022063 Fix single helix and tidy call structure
* 19/03/08 RHA DEV00022891 Allow concecutive coincident indexes to CPL
* Version 2009.1
* 07/04/08 RHA DEV00013774 Correct arc centres and streamline arc calculations
* 14/04/08 RHA DEV00023113 Feed after ToolChange code constructor added
* 14/04/08 RHA DEV00018979 Correct BNUM reset
* 22/04/08 RHA DEV00022820 Correct angle at toolchange logic PMACRO-15
* 22/04/08 RHA DEV00022820 Set hold values to #FUNNY in PMACRO-15
* 01/05/08 RHA DEV00023246 Adjust rotary initialisation according to machine type
* 07/05/08 RHA DEV00023285 Set angle output vars at toolchange
* 08/05/08 RHA DEV00020490 Add new hole depth option. Incremental from Retract
* 22/07/08 RHA DEV00024069 Correction to spindle reverse with coolant
* 06/08/08 RHA DEV00024310 Back bore and face in milling
* 11/08/08 RHA DEV00024364 Implement helical hole cycles
* 20/08/08 RHA DEV00024474 Add Feed Type setting to toolchange
* 26/08/08 GST DEV00023989 Helical approach number of turns corrected
* 26/08/08 GST DEV00023205 Correct TLO application if NOMOTION
* 28/08/08 GST DEV00024586 Apply TLO correction to XY arcs
* 28/08/08 RHA DEV00023797 Add tool token and remove chamfer angle restriction
* 08/09/08 RHA DEV00024603 Correct angle setting for Rapid after ToolChange pt_output_rapid
* 11/09/08 RHA DEV00024584 ASIN error on helical profile
* 18/09/08 RHA DEV00024886 Call feed type code constructor from toolchange
* Version 2009.2
* 24/10/08 RHA DEV00025195 Plunge to cycle clearance if needed
* 24/10/08 RHA DEV00025000 Allow Rapid after tool change with null move
* 29/10/08 RHA DEV00025195 Suppress call if already at clearance
* 31/10/08 RHA DEV00025264 Do not reset centre if adjustment fails
* 05/11/08 RHA DEV00025093 Correct spindle with coolant in tapping cycle
* 16/02/09 RHA DEV00026148 Correct first hole location in rotary mode
* 17/02/09 RHA             Correct 3 Axis compilation
* 06/03/09 RHA DEV00026198 Use Job data instead of ASK questions
* 09/03/09 RHA DEV00026198 Fix PROGDESCR with PARTNAME default
* 09/03/09 RHA DEV00026183 Fix radius value in adjust arc centre procedure
* 10/03/09 RHA DEV00026183 Remove rounding of comparitive radius
* 13/03/09 RHA DEV00025238 #TMPCLEAR is wrongly handled in PT_ZCLEAR (Threadmill)
* 13/03/09 RHA DEV00026452 Changes for 3D Z with TLO application
* 18/03/09 RHA DEV00026539 3D approach for hole cycles
* 19/03/09 RHA DEV00026198 Correct PROGID default
* 20/03/09 RHA DEV00026198 Change ASK default behaviour, Programmer & Version
* 02/04/09 RHA DEV00026928 Correct subroutine processing for hole cycles
* 03/04/09 RHA DEV00026928 Correction to subcall logic, for non-hole calls
* Version 2010.1
* 27/05/09 RHA DEV00022849 Lookahead for Rapid move speed set
* 11/06/09 RHA WI33874 Fix Lookahead, use SPEED if NEXTSPEED=#FUNNY
* 15/06/09 RHA WI33580 Move M89/99 setting to TNC.cgi and fix
* 16/06/09 RHA WI32294 Siemens - allow 0 datum increment
* 08/07/09 RHA WI34873 New Thread Mill - Restructure existing canned cycle
* 09/07/09 RHA WI34873 New Thread Mill - Add new code options
* 14/07/09 RHA WI34873 New Thread Mill - Add new macro and processing
* 16/07/09 RHA WI34873 Remove temporary diagnostics
* 17/07/09 RHA WI34873 New Thread Mill - Use Hole cycle point processing
* 22/07/09 RHA WI34814 Correct Z lift when emulating multi-level cycles pt_hole_cycles
* 23/07/09 RHA WI35048 Z lift - adjust for last hole and for subroutines
* 23/07/09 RHA WI34873 New Thread Mill More variables and cycle parameters
* 27/07/09 RHA WI31681 Axis Reversals
* 29/07/09 RHA WI34873 Add signed absolute option for depth
* 05/08/09 RHA WI34754 Make call to Feed Type code constructor optional in toolchange
* 07/08/09 RHA WI24873 Fix thread depth sign options
* 10/08/09 RHA WI31681 Siemens thread mill, remove diagnostic
* 10/08/09 RHA WI31163 Output angles for rotary rotate, Fix nomotion check
* 12/08/09 RHA WI34580 Fix subroutines when #CYCLEPOINTS=3
* 13/08/09 RHA WI34873 Adjust for changed system variables
* 18/08/09 RHA W35155 Adjust arc feeds only if not adjusted by cycle (Thread Mill)
* 19/08/09 RHA W35537 Add Lead and Starts tokens for thread mill
* 20/08/09 RHA W35048 Warn if multi-level holes use subroutines
* 20/08/09 RHA W35450 Add tokens for coordinate rotation to sub call
* 27/08/09 RHA W34873 Move #THREADLEAD calculation up in CANNED675
* 28/08/09 RHA W34873 Fix to above change. Reset #THREADLEAD with sign
* 07/09/09 RHA W35780 Multi depth cycle should be detected using ZLEVEL variable
* 14/09/09 RHA W35898 Correct angle setting for planar rotate - PMACRO-33
* 15/09/09 RHA W35307 Set values for tool angle (angled head) tokens etc
* 17/09/09 RHA W35307 System variables renamed HEADANGLE MOUNTANGLE
* 23/09/09 RHA W35563 Thread mill bottom to top formatting & suppress points call
* 24/09/09 RHA W36102 MCALL cycle definitions for Macro37 thread milling
* 24/09/09 RHA W35563 Force canned cycle every time for thread mill
* 01/10/09 RHA W35498 Use LEADFEED for thread mill approach (675 canned cycle)
* Version 2010.1 SP1
* 13/10/09 RHA W35934 Suppress spindle stop warning at Toolchange
* 23/10/09 RHA W36513 Ask only one time for same variable when not set
* 30/10/09 RHA W35934 Detect spindle stop in sequence
* Version 2010.2
* 13/11/09 RHA W36665 Correct action of planar rotate on rotary angles
* 13/11/09 RHA W36755 Add #MOVE to Mode Flags trace
* 18/11/09 RHA W31914 COMPGCODE suppressed on Z only moves
* 20/11/09 RHA W36665 Correct #Move setting for planar rotate NOMOTION
* 27/11/09 RHA W31718 Trap invalid LEFTRIGHT values in arc feed adjustment
* 08/12/09 RHA W35163 Use XYFEED for Helical hole cycles
* 11/12/09 RHA W36903 Add "Ask Once" to the NC Stlyes > Interactive Startup options
* 04/01/10 RHA W32567 Implement G28 Moves to Home etc. ISO Template
* 15/01/10 RHA W37297 Add Single Shot option for Exact Stop
* 22/01/10 RHA W37441 Hole locations for angled head - Restructure array reading
* 25/01/10 RHA W37441 Hole locations for angled head
* 02/03/10 RHA W37976 Correct #nKEEP settings in P-RESET
* 11/03/10 RHA W38137 Output angled head diagnostics from Toolchange only if modes trace is on.
* 11/03/10 RHA W38139 Angled head, hole cycle approach unsafe in machine coordinates
* 17/03/10 RHA W38176 Allow for angled heads in PT_COMPENSATE_TLO
* 19/03/10 RHA W38304 Correct reversal of move to ZCLEAR in PT_GET_HOLE_POSITION
* 19/03/10 RHA W38305 Correct approach to hole cycles when 3D is off
* 25/03/10 RHA W38435 Old thread mill canned to set KEEP values
* 26/03/10 RHA W38341 Remove #ZMOVE setting for hole cycles in PT_OUTPUT_RAPID
* 29/03/10 RHA W38474 Use CPLPLANE>4 instead of CPLPLANE=5, allow for invalid values.
* 30/03/10 RHA W38341 Allow for traditional fixed XY then Z move after TC
* 31/03/10 RHA W38513 Activate canned cycle switches for orthogonal planes
* 01/04/10 RHA W38341 Allow for traditional fixed XY then Z move after TC
* 06/04/10 RHA W38513 Correct switch use for 3AX with angled head
* 06/04/10 RHA W38474 Reset to use CPLPLANE=5, underlying EC problem has been fixed.
* 08/04/10 RHA W38633 Call PT_COMPENSATE_TLO after NOMOTION in PMACRO-15
* 08/04/10 RHA W38619 Allow MCoords hole array analysis for head-head without angled attachment
* 09/04/10 RHA W38607 Remove %IF #3DAFTERTC=1 @CALLRAP from PT_HOLE_CYCLES
* 13/04/10 RHA W38640 Hole parameters adjusted for TLO and Angled Head
* 14/04/10 RHA W38607 Use %IF #3DAFTERTC=1 @CALLRAP in PT_HOLE_CYCLES if after TC
* 16/04/10 RHA W38640 Correct sign of hole parameter offset
* 04/05/10 RHA W39031 Correct TLO offsetting for gantry machine with machine coordinate output
* 11/05/10 RHA W39137 Set #HOLEOFFSET in a procedure and call from Move Angular
* 14/05/10 RHA W39206 PT_CONVERT_COORDS needs to cater for HeadTable combinations
* Version 2011.1
* 28/05/10 RHA W39270 Suppress spindle warning on back bore approach/retract
* 02/06/10 RHA W38680 Add thread mill and probe to SET_TOOL_TYPE
* 07/06/10 RHA W39270 Reset SPINWARN at Toolchange
* 02/07/10 RHA W37828 Fix arc centre adjustment for reversed axes
* 15/07/10 RHA W39785 Implement tap type setting at toolchange
* 28/07/10 RHA W40156 Allow peck subroutines in machine coordinate output
* 30/07/10 RHA W38672 Correction to coordinate rounding & new procedure
* 04/08/10 RHA W40156 Allow for unset system vars in Peck
* 06/08/10 RHA W40156 Fix when in CPL Coords
* 06/08/10 RHA W40290 Correction for CPLPLANE=6 condition
* 10/08/10 RHA W40156 Remove changes in PT_OUTPUT_SUBSTART
* 12/08/10 RHA W40290 Correct loop in PMACRO-35
* 16/08/10 RHA W39553 Control allowable chamfer for helical hole cycle
* 16/08/10 RHA W38928 Allow both rotary axes on hole cycle approach
* 16/09/10 RHA W31859 Improve use of hole clearance on approach
* 17/09/10 RHA W31859 Don't change approach after tool change
* 20/09/10 RHA W31859 Fix for machine axes. Use #PREVIOUSHEIGHT instead of #TEMP
* 21/09/10 RHA W40897 Implement correct processing for rotary drill in MC coords
* 27/09/10 RHA W39102 Extend rotary hole processing for angled head and machine coordinates
* 29/09/10 RHA W40981 Correct G92 output for Incremental datum shift
* 11/10/10 RHA W39884 Fix DIRECTION corruption by GETCPL
* 13/10/10 RHA W40981 Correct Absolute datum regressions
* 13/10/10 RHA W40981 Change for absolute converted to shift
* 14/10/10 RHA W40981 Change for same datum, different offset
* 14/10/10 RHA W40981 Fix Head-Head (no maintain index) problem
* Version 2011.2
* 22/10/10 RHA W32074 Restructure Datum Shift and Index handling
* 25/10/10 RHA W34915 Allow Datum Override on first tool
* 26/10/10 RHA W41396 Use MAXFEED for Rapid conversion
* 28/10/10 RHA W32074 Fix longhand radial hole approach regression
*                     Fix #XSHIFT etc. remove redundant variables
* 29/10/10 RHA W32074 Axis reversals, #XSHIFT etc.
* 29/10/10 RHA W38135 Alternative incremental datum base
* 01/11/10 RHA W41315 Remove Update_Offset_Registers from absolute datum shift
* 01/11/10 RHA W38135 Alternative incremental datum base
* 02/11/10 RHA W32074 Update temporay annotation in Select_Work_Datums procedure
* 11/11/10 RHA W41606 Avoid Spindle warning for probe tools
* 10/12/10 RHA W33515 Fix incremental angles for hole cycles
* 10/12/10 RHA W38043 Mill TNC and others - support feed type
* 13/12/10 RHA W33515 Fix for hole cycle in rotary rotate
* 10/12/10 RHA W38043 Fix for thread mill and improve efficiency
* 14/12/10 RHA W33291 Fix for incremental angles
* 16/12/10 RHA W41997 Implement peck tapping
* 23/12/10 RHA W41738 New option - Always use IJK with 360deg arcs
* 11/01/11 RHA W42393 New Option - Control for negative radius when angle>180
* 17/01/11 RHA W30504 Incremental angle fixes
* 18/01/11 RHA W41711 Protect DWELL from 0/#FUNNY switching
* 18/01/11 RHA W42408 Angle direction code fix
* 18/01/11 RHA W42463 Suppress direction if no rotation
* 19/11/11 RHA W38043 Corrections & add thread mill cycle option
* 21/01/11 RHA W41711 Protect USERVAR1, PMACRO-29
* 25/01/11 RHA W42393 Signed radius for single turn helix
* 11/02/11 RHA W42866 Correct inc angles in 5 axis approach and subcall
* 16/02/11 RHA W38043 More fixes for thread mill
* 28/02/11 RHA W43151 Tapping reverse with combined coolant codes
* 28/02/11 RHA W38043 Fix for Arcs
* 04/03/11 RHA W43249 Fix absolute datum shift
* 26/04/11 RHA W44169 Tapping feed conversion
* Version 2011.2.2
* 17/05/11 RHA W43899 Fix 3D approach switching for holes (CPL Coords)
* 17/05/11 RHA W43524 Fix TNC arc centre correction (Non G17)
* Version 2012.1
* 02/06/11 RHA W43821 Improve efficiency of arcs and coordinate rounding
* 14/06/11 RHA W44874 Use NEXTSPEED for rapids from TRANSLATE
* 15/06/11 RHA W44874 Re-initialise Feed/Speed in TRANSLATE
* 16/06/11 RHA W44058 Force #PLANEGCODE at start of subroutine
* 21/06/11 RHA W42241 Selective threadmill canned cycles
* 28/07/11 RHA W39982 Trap null arc moves
* 28/07/11 RHA W43985 Implement feedrate multiplier
* 03/08/11 RHA W42241 Improve helical taper warning for 675 cycle
* 10/08/11 RHA W42871 Make use of NEXTSPEED optional
* 10/08/11 RHA W43985 Fix converted FPR value
* 11/08/11 RHA W42871 Make use of NEXTSPEED optional - Improve pt_speed_set
* 31/08/11 RHA W45704 Fix CODECON_TAPPING-CYCLE calls, make Siemens compatible
* 05/09/11 RHA W45704 Fix multilevel retract for thread mill
* Version 2012.2
* 02/11/11 RHA W45241 Improve processing times
* 20/12/11 RHA W47496 Allow G93 through PT_CONTROL_FEEDTYPE
* 17/01/12 RHA W45710 Force Index token on first toolchange
* 15/02/12 RHA W47500 Implement auxiliary Z axes
* 22/02/12 RHA W48740 calculate number of helical turns in G18/19 modes
* 22/02/12 RHA W48595 Make PLANEGCODE more robust
* 22/02/12 RHA W49150 Fix index after head-head toolchange
* 15/03/12 RHA W49473 Option for W (quill) move to be tool tip
* 15/03/12 RHA W49072 Add quill Function for drilling code constructors.
* 20/03/12 RHA W49072 More Quill tokens for drilling code constructors.
* 28/03/12 RHA W49150 Fix index after head-head toolchange
* 20/03/12 RHA W49072 Fix #AUXZDEPTH
* 03/04/12 RHA W49473 Fix Z2MOVE token, use #ZHOLD for unchanged value
* 04/04/12 RHA W49150 Set Angular hold values from rotary drilling
* 11/04/12 RHA W49150 Set Head Angle and Hold values at ToolChange
* 12/04/12 RHA W49745 Quill movements for canned hole cycle
* 17/04/12 RHA W49150 Initialise Head Angle output at ToolChange
* 18/04/12 RHA W49745 Quill movements for canned hole cycle
* 19/04/12 RHA W50157 Head Angle output at First ToolChange
* Version 2013.1
* 31/05/12 RHA W48878 Phantom warnings from Subroutines
* 14/06/12 RHA W50832 Set rotary direction of hole cycles to Shortest
* 29/08/12 RHA W50032 Avoid CG crash when #DATUMMAX=#FUNNY
* 03/10/12 RHA W31018 Correct CPL tool tip option for Rapid to Tool Change
* 26/10/12 RHA W53700 Correct thread mill (37) regression
* Version 2013.2
* 13/03/13 GST W50479 Allow output of parameters =0
* 14/03/13 GST W51693 Round angle, pitch and zrange before use them
* 14/03/13 GST W55888 Round angle, pitch and zrange before use them
* 18/03/13 GST W52689 Fix THISZMOVE output for canned holes
* 20/03/13 GST W31039 Implement new coolant system - fase 1
* 20/03/13 GST W55128 Implement Rotary Axial interpolation
* 20/03/12 GST W54195 Create tokens for NEXT tool parameters
* 20/03/13 GST W55128 Implement Rotary Axial interpolation - second batch
* 21/03/13 GST W55128 Implement Rotary Axial interpolation - fix polar call
* 21/03/13 GST W55128 Implement Rotary Axial interpolation - third batch
* 21/03/13 GST W54191 Force feed for tapping - floating and rigid choice
* 21/03/13 GST W48957 Allow WorkGCode update at toolchange for head machines
* 22/03/13 GST W31039 Implement new coolant system - fase 2
* 25/03/13 GST W56100 Implement Rotary Axial interpolation - hole array
* 25/03/13 GST W50471 Allow WorkGCode override at toolchange for head machines
* 26/03/13 GST W31039 Implement new coolant system - initialise when combined
* 27/03/13 GST W56534 Implement new coolant system - fix auto coolant
* 27/03/13 GST W56100 Implement Rotary Axial interpolation - hole array
* 27/03/13 GST W55128 Implement Rotary Axial interpolation - fourth batch
* 27/03/13 GST W55128 Implement Rotary Axial interpolation - allow arcs and helices
* 28/03/13 GST W55128 Implement Rotary Axial interpolation - implement axis side
* 28/03/13 GST W31039 Implement new coolant system - make autocool override optional
* 10/04/13 GST W56644 Fix spindle stopped warnings
* 19/04/13 GST W56100 Adjust array for holes on negative side
* 23/04/13 GST W57364 Disable auto-coolant for Probe tools
* 23/04/13 GST W57296 Move to Toolchange Home in rotary axial
* 02/05/13 GST W55128 Force nocycle when forcing cartesian
* 13/05/13 GST W57296 Remove changes
* 23/05/13 GST W56952 Add Dwell Time to allow spindle to change speed
* Version 2014.1
* 18/07/13 GST W57793 Correct hold values for hole clearance on mcoords
* 18/07/13 GST W52636 Recalculate number of turns with system variables
* 18/07/13 GST W58113 Force rotary update after IJK_5-axis
* 22/07/13 GST W55730 Implement rotary precision
* 23/07/13 GST W57134 Correct [WORKREGISTER] and make [WORKGCODE] available in Index
* 01/08/13 GST W58567 Fix rotary direction calculation for rationalised angles
* 01/08/13 GST W59347 Radial holes must not be subjected to "Cartesian Output in Rotary Holes"
* 07/08/13 GST W49799 Allow output of datum override in Set Work Datums
* 09/08/13 GST W57148 Make Exact Stop codecons and codes available on TNC
* 16/08/13 GST W59433 Add support for 3D compensation
* 20/08/13 GST W59677 Fix hold angle for #ROTTYPE=4 calculation
* 26/08/13 GST W43623 BackBore/Face cycle points option
* 30/08/13 GST W59852 Add support for Dynamic Offset
* 03/09/13 GST W59929 Fix rotary holes approach moves
* 13/09/13 GST W59942 Fix null index detection
* 19/09/13 GST W60303 Create Move Code for 3D_CRC on TNC
* 14/10/13 GST W60594 Allow CRC off on rapid retracts
* Version 2014.2
* 26/11/13 GST W61216 Fix rotary holes with angled-head
* 28/11/13 GST W61819 Allow mcoords in rotary axial
* 02/12/13 GST W56100 Remove rotary axial holes calculation
* 10/12/13 GST W62088 Fix Warn if not at Toolchange height
* 22/01/14 GST W56100 Use new array pointers for rotary axial holes
* 20/02/14 GST W63124 Improve array output for debug trace
* 24/02/14 GST W62726 Implement Turning on milling
* 26/02/14 GST W62726 Fix Turn rapid after tc and initialisation
* 07/03/14 GST W62726 Fix Move To Tool Change / Home
* 07/03/14 GST W62726 Add feed type for turning
* 12/03/14 GST W62877 Temporarily fix rotary axial holes
* 24/03/14 GST W63923 Document SW 48 and 49 retrieve swap
* 15/04/14 GST W63129 Improve forcing of XYZ on full arcs
* Version 2015.1
* 07/07/14 GST W61121 Implement Maximum Linear Separation
* 08/07/14 GST W64453 Fix Hole cycle unset variables
* 16/07/14 GST W65593 Fix angles at RAT
* 18/07/14 GST W64177 Use system angular direction when available
* 22/07/14 GST W65032 Fix RAT to respect clearance
* 24/07/14 GST W65032 Exclude old thread mill from RAT exceptions
* 25/07/14 GST W66456 Exclude angled heads from reloading current CPL
* 31/07/14 GST W65629 Fix direction assignment
* 31/07/14 GST W66427 Fix angular data after Move Angular
* 31/07/14 GST W62726 Fix machine mode codes
* 06/08/14 GST W62726 Fix RAT for non-axial turning
* 19/08/14 GST W62877 Allow new rotary array in mill+turn
* 19/08/14 GST W64059 Add Force XYZ to 3x posts
* 21/08/14 GST W65032 Fix RAT to respect clearance - exclude null move
* 27/08/14 GST W62726 Fix initialisation for turning on YZ
* 11/09/14 GST W61121 Disable Maximum Linear Separation
* 18/09/14 GST W78273 Fix Hole canned approach regression
* 14/10/14 GST W79061 Fix rapid approach if helix follows
* Version 2015.2
* 18/12/14 GST W79570 Fix Canned/Longhand for ToM drilling
* 09/01/15 GST W79526 Fix initial DIR hold
* 13/01/15 GST W79524 Fix for nutated rotary moves before turning
* 13/01/15 GST W67109 Update nSUB tokens for toolchange
* 05/02/15 GST W80347 Implement support for Simultaneous indexing
* 10/02/15 GST W81600 Implement Program Stop on Move to Home/TC
* 02/03/15 GST W79570 Fix Canned/Longhand for ToM drilling
* Version 2016.1
* 18/06/15 GST ECAM-1158 Fix lift move on rotary axial holes
* 08/07/15 GST ECAM-1560 Fix MTM thread pitch
* 10/07/15 GST ECAM-1524 Correct incremantal axial rotary holes
* 28/07/15 GST ECAM-2343 Implement Angle at Toolchange
* 25/08/15 GST ECAM-127 Bypass maintain index on turn tools
*
***************************************************************************

*							*******************
*                         Initialisation procedures
*							********************

%PROCEDURE=PT_SET_DEFAULTS
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SET_DEFAULTS:%CALL=ENTER_PROCEDURE

* Auxiliary axes
#AUXZMOVE=0
#AUXZACTIVE=0
#AUXZKEEP=0

* ASK variables
$PROGVER=""
$ID=""
#PROGID=#FUNNY
$DESCR=""

%IF #CENTREFIX=#FUNNY %THEN #CENTREFIX=0
#COMPGCODEHOLD=DATA1(20)
$COMPOUTPUT=TRUE
#COMPON=0
*	Initialisation system and user defined variables
#SPINWARNSAVE=#SPINWARN
STARTSUB=0
#BNUMSTART=#BNUM
ENDSUB=0
#TRUE=1:#FALSE=0   ; Retain for ;CODE
#RIGHT=0
#LEFT=1
XYPLANE=0
#FIRSTIME=1
#FUNNY=9989999000000
#PI=3.141593
#CURPLANE=0:#ABS=#FUNNY:#CONARC=0
#CANCELCOMP=1		;	Cutter Radius Comp off on Start-up
#INCRXYZHOLD=0		;	Needed to reset G90 for Incr Subs (See SUBEND)
%IF #G18SWAP=#FUNNY %THEN #G18SWAP=0
%IF #G19SWAP=#FUNNY %THEN #G19SWAP=0
#ZTOOLSUB=0
#PLANEGCODE=DATA1(13)
#TOOLCOUNT=0
#WARNCOUNT=0
TRUEARCOP=1
#AUTOGEAR=1
#EXACTSTOP=1			;	Exact positioning off by default
#FEEDMODEGCODE=DATA1(45)
#G54FROMHOME=0
#HOLECYCLE=0
* Axis Reversal Multipliers
%IF #XREVERSE=1 %THEN #XREVERSE=-1 %ELSE #XREVERSE=1
%IF #YREVERSE=1 %THEN #YREVERSE=-1 %ELSE #YREVERSE=1
%IF #ZREVERSE=1 %THEN #ZREVERSE=-1 %ELSE #ZREVERSE=1

#WPCOORDS=0
#CUBICCOORDS=0
%IF #WPCOORDS=1 %THEN #CUBICCOORDS=1
#CHECKCPLS=1
#ANGDIR=0
#SINDEX=0

#ROTARYCARTESIAN=1
#ROTARYCARTESIANHOLE=0

* Automatic Datum Setting
%IF #DATUMMAX=#FUNNY %THEN #DATUMMAX=1000 ; Runtime protect
%IF #DATUMINCR=0 %THEN #DATUMSTART=#DATUMSTART:%GOTO @ABS
#DATUMSTART=#DATUMSTART-#DATUMINCR ; Adjust for first inc
#DATUMMAX=#DATUMMAX-#DATUMSTART
#DATUMMAX=#DATUMMAX/#DATUMINCR   ; Used as number of datums in loop

@ABS
#ABSCODE=#MCODECPL
%IF #CUBICCOORDS=1 %THEN #ABSCODE=#MCODEMC
*
*	Retrieve from MM & MT lines
#MAXTOOLS1=60
#COMPFACTOR=1.1
**
* See W63923
* MM_48 retrieves switch 49 from the MM line
* If switch 48 is needed we must make it into MM_49
#RAPIDCOMP=0
%IF #USEMAXFEED=1 %THEN #RAPIDFEEDRATE=MAXFEED %ELSE #RAPIDFEEDRATE=30000

* Coolant code output
#COOL=DATA2(10)
#COOLHOLD=DATA2(10)
#THROUGHTOOL1=#THROUGHTOOL1OFF
<[#THROUGHTOOL1=10][#COOL=10]>



* 3D compensation
#3DCRCKEEP=0
CRC3D=0

* Subroutine numbering
%IF #SUBNOSTART=#FUNNY %THEN #SUBNOSTART=#PROGID %ELSE #SUBNOSTART=#SUBNOSTART-#INCRSUBNUMBER	; If user has not specified subroutine start number, use Progid+1 etc.

$PLANAR=YES
$CAXENGAGED=NO

%OUTPUT-IF-CHANGED=STARTSUB,ENDSUB			;	Necessary since can be included in cycle line

* Block numbers
#BNUM=#BNUM-#BNUMINC:#SBNUM=#BNUM						; so that first increment is the user's start number
%IF #USEBNUM=0 %THEN %DONT-OUTPUT=#BNUM,#SBNUM		; suppress both block and safestart blocks
%IF #ONLYSBNUM=1 %THEN %DONT-OUTPUT=#BNUM  			; suppress Blocknum if toolchange only

%IF UNIT=0 %THEN #UNITSGCODE=DATA1(16) %ELSE #UNITSGCODE=DATA1(17)

%IF MASK=1 %THEN #BNUMVAR=0 %ELSE #BNUMVAR=#BNUMINC		;	supress block no. increment when processing subroutines

%IF UNIT=0 %THEN #INCR=#INCHINCR %ELSE #INCR=#MMINCR	;	set smallest machine movement depending on NC Pogram units
*PRECISION=#INCR-(#INCR/100)		;	Set compiler to work to one digit less than machine minimum
PRECISION=#INCR/2
%CALL=FIND_PRECISION
%CALL=FIND_ANGULAR_PRECISION

%IF UNIT=0 %THEN RESOLUTION=#INCHINCR %ELSE RESOLUTION=#MMINCR ; Used for Arc bulge checking
%IF #USERADS=0 %THEN NOBULGECORRECTION=1 ; Suppress correction if IJK arcs
%IF CIRCLE=1 %THEN NOBULGECORRECTION=1 ; Suppress correction if single quadrant arcs

%IF UNIT=0 %THEN #BOREOFFSET=#BOREOFFSETINCH %ELSE #BOREOFFSET=#BOREOFFSETMM	;	Bore Cycle Stand Off amount depending on units
#BOREOFFSETHOLD=#BOREOFFSET

#MINFEEDADJ=1-(#MINFEEDADJ/100)					;	Convert from % to decimal
#MAXFEEDADJ=(#MAXFEEDADJ/100)+1					;	Convert from % to decimal

%IF #RAPDIST=#FUNNY %THEN #RAPDIST=0			;	cater for input for convert moves less than ... being zero or unset

#PECKREVERSE=1

%CALL=PT_RUNTIME_INC

%IF #TOOLSHEET<>3 %THEN %CALL=SET_UP_SHEET

%CALL=PT_INIT_POSITION ; Set initial position, Hold values etc

%IF #INCRXYZ=1 %THEN #ABSINC=DATA1(48) %ELSE #ABSINC=DATA1(47)
#INCRXYZHOLD=#INCRXYZ

* Head operation mode variables
$ALIGNMENTHOLD="W" ; Force alignment on first tool
$TOOLALIGNMENT=Z
#DEPTHMOD=1 ; Cycle depth direction (sign) modifier
#TOOLWAITING=0 ; Control when Toolchange preceeds Index
#DIRHOLD=1 ; direction hold as stopped

* Run-time questions ask once
#GOTPV=0
#GOTID=0
#GOTDE=0
#GOTPR=0

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

********************************************************************************************

%PROCEDURE=PT_RUNTIME_INC
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_RUNTIME_INC:%CALL=ENTER_PROCEDURE

%IF #INCRXYZ<>2 @END
* Select abs/inc at post run time
%OPTIONS=Coordinate Mode^Absolute^Incremental=#INCRXYZ
#INCRXYZ=#INCRXYZ-1
*  Note  #incrxyz is current abs/inc setting
*        #incrxyzhold is main program setting
*        #incrsubs is subroutine setting
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

********************************************************************************************

%PROCEDURE=PT_INIT_POSITION
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_INIT_POSITION:%CALL=ENTER_PROCEDURE
* Called by all START macros to set initial position etc.

%IF #REFSHIFT=1 @REFSHIFT
* Current CPL output values
#XMOVE=XHOME+XSUB
#YMOVE=YHOME+YSUB
#ZMOVE=ZHOME+ZSUB
* %CALL=PT_SET_PRECISION  might need functionality here
#XHOLD=#XMOVE
#YHOLD=#YMOVE
#ZHOLD=#ZMOVE
#XKEEP=#XMOVE
#YKEEP=#YMOVE
#ZKEEP=#ZMOVE
%GOTO @REVERSE

@REFSHIFT
* Machine Datum output values
#XMOVE=XHOME
#YMOVE=YHOME
#ZMOVE=ZHOME
* %CALL=PT_SET_PRECISION  might need functionality here
#XHOLD=#XMOVE+XSUB
#YHOLD=#YMOVE+YSUB
#ZHOLD=#ZMOVE+ZSUB

@REVERSE
#XMOVE=#XMOVE*#XREVERSE
#YMOVE=#YMOVE*#YREVERSE
#ZMOVE=#ZMOVE*#ZREVERSE
* Reset HOLD with reversals if not incremental
%IF #INCRXYZ=1 @TOOLREF
#XHOLD=#XHOLD*#XREVERSE
#YHOLD=#YHOLD*#YREVERSE
#ZHOLD=#ZHOLD*#ZREVERSE

@TOOLREF
* Set CPL offset for moves to Home and TC
#XTOOLREF=XSUB*-1
#YTOOLREF=YSUB*-1
#ZTOOLREF=ZSUB*-1

* Baseline for incremental datum
#XBASE=#XTOOLREF
#YBASE=#YTOOLREF
#ZBASE=#ZTOOLREF

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

********************************************************************************************

%PROCEDURE=PT_CHECK_LONGHAND
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_CHECK_LONGHAND:%CALL=ENTER_PROCEDURE


%IF DWELL=#FUNNY %THEN DWELL=0 ; Protect
%IF DEPTH=#FUNNY %THEN DEPTH=0

%IF USERVAR5=1 @LONGHAND ; Longhand requested
@ToM

* Canned cycle capability checks, Longhand if canned cycle not available
%IF #MACRO=10 @CHIP
%IF #MACRO=11 @REAM
%IF #MACRO=12 @BORE
%IF #MACRO=671 @BACKBORE
%IF #MACRO=672 @HELICAL

*Drill
%IF DEPTH>0 @PECK
%IF DWELL=0 @DRILL
%IF #EXPANDG82=1 @LONGHAND
%GOTO @DONE

@DRILL
%IF #EXPANDG81=1 @LONGHAND
%GOTO @DONE

@PECK
%IF #EXPANDG83=1 @LONGHAND
%GOTO @DONE

@CHIP
%IF #EXPANDG87=1 @LONGHAND
%GOTO @DONE

@REAM
%IF #EXPANDG85=1 @LONGHAND
%GOTO @DONE

@BORE
%IF #EXPANDG86=1 @LONGHAND
%GOTO @DONE

@HELICAL
%IF #HECYCLE=1 @LONGHAND

%IF #HECHAMFER=0 @DONE ; Any Angle
%IF #HECHAMFER=2 @ONLY90  ; 0 or 90
* No chamfer allowed
%IF CHAMFERANGLE>0 @LONGHAND ; 0 only
%GOTO @DONE
@ONLY90
%IF CHAMFERANGLE=0 @DONE
%IF CHAMFERANGLE=90 @DONE
%GOTO @LONGHAND

@BACKBORE
%IF RELIEFDIST=0 @FACE
%IF RELIEFDIST=#FUNNY @FACE
%IF #BBCYCLE=1 @LONGHAND
%GOTO @DONE

@FACE
%IF #BFCYCLE=1 @LONGHAND

@DONE

* Check tool orientation conditions
* Note, checks included in 3ax for angled head use.
* <CPLPLANE=[CPLPLANE=13] MCOORD=[MCOORD=13] #ORTHCYCLES=[#ORTHCYCLES=13]>
%IF MCOORD=0 @CPLCOORDS
%IF CPLPLANE=5 @CPLCOORDS
%IF CPLPLANE=0 @WARN
%IF #ORTHCYCLES=1 @CPLCOORDS
@WARN
$WARNING="Warning - Canned cycle not supported when Head is indexed - Longhand forced":%CALL=CODECON_WARNING
%GOTO @LONGHAND
@CPLCOORDS

* DB12120  Rotary Rotate outputs cycle and expanded equivalent. Suppress cycle to prevent duplicate moves
%IF NOCYCLE=1 %THEN $WARNING="Warning - Canned cycle not supported during Rotary Rotate - Longhand forced":%CALL=CODECON_WARNING
%IF NOCYCLE=1 @LONGHAND
%IF FIELD1=#FUNNY @NORMAL	;	Entry feed not set
%IF FIELD1=0 @NORMAL
* Entry feed set - longhand output only

@LONGHAND
%IF PATHTRACE=1 @LONGHAND3  ; Not Subroutines
%IF #SUBWARN=0 @LONGHAND3 ; No Warning set
$WARNING="Warning - Controller Subroutine Called for Longhand Hole Cycles":%CALL=CODECON_WARNING
@LONGHAND3
%NOCYCLE

@NORMAL
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

********************************************************************************************
*							*******************
*                         Macro support procedures
*							********************
*
%PROCEDURE=DRILL-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=DRILL-CYCLE:%CALL=ENTER_PROCEDURE

%CALL=PT_CHECK_LONGHAND

* <DRILL-CYCLE Peck [DEPTH=0]   Dwell [DWELL=0]>
%IF DEPTH>0 @NOTCBORE2
%IF DWELL=0 @NOTCBORE
*  %IF #EXPANDG82=1 %THEN %NOCYCLE
* Counter bore cycle
$CYCLETYPE=COUNTERBORE
#CYCLEGCODE=DATA1(37)
#DEPTH=#FUNNY:#DWELLGCODE=DATA1(5)
#DEGR=#FUNNY:PITCH=#FUNNY:#BOREOFFSET=#FUNNY
%GOTO @SUBS

@NOTCBORE
%IF DEPTH=0 @NOTPECK
@NOTCBORE2
%IF #EXPANDG83=1 %THEN %NOCYCLE
* Peck Cycle
$CYCLETYPE=PECKDRILL
#CYCLEGCODE=DATA1(38)
#DEPTH=DEPTH*#PECKREVERSE
#DWELLGCODE=#FUNNY
#DEGR=DEGR
PITCH=#FUNNY
#BOREOFFSET=#FUNNY
%GOTO @SUBS

@NOTPECK
%IF #EXPANDG81=1 %THEN %NOCYCLE
* Drill Cycle
$CYCLETYPE=DRILL
#CYCLEGCODE=DATA1(36)
#DEPTH=#FUNNY
DWELL=#FUNNY
#DWELLGCODE=#FUNNY
#DEGR=#FUNNY
PITCH=#FUNNY
#BOREOFFSET=#FUNNY

@SUBS
#DEPTH=#DEPTH*#ZREVERSE

%CALL=PT_HOLE_CYCLES

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=CHIPBREAK-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=CHIPBREAK-CYCLE:%CALL=ENTER_PROCEDURE

%CALL=PT_CHECK_LONGHAND

$CYCLETYPE=CHIPBREAK
#CYCLEGCODE=DATA1(34)
#DWELLGCODE=#FUNNY
#DEGR=DEGR
PITCH=#FUNNY
#BOREOFFSET=#FUNNY
#DEPTH=DEPTH*#ZREVERSE

%CALL=PT_HOLE_CYCLES

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


**************************************************************************
%PROCEDURE=REAM-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=REAM-CYCLE:%CALL=ENTER_PROCEDURE

%CALL=PT_CHECK_LONGHAND

$CYCLETYPE=REAMBORE
#CYCLEGCODE=DATA1(40)
#DWELLGCODE=#FUNNY
#DEGR=#FUNNY
PITCH=#FUNNY
#BOREOFFSET=#FUNNY
#DEPTH=#FUNNY

%CALL=PT_HOLE_CYCLES

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=BORE-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=BORE-CYCLE:%CALL=ENTER_PROCEDURE

%CALL=PT_CHECK_LONGHAND

$CYCLETYPE=BORE
#CYCLEGCODE=DATA1(41)
#DWELLGCODE=#FUNNY
#DEGR=#FUNNY
PITCH=#FUNNY
#BOREOFFSET=#BOREOFFSETHOLD
#DEPTH=#DEPTH*#FUNNY

%CALL=PT_HOLE_CYCLES

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=BACK-BORE-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=BACK-BORE-CYCLE:%CALL=ENTER_PROCEDURE

%CALL=PT_CHECK_LONGHAND

%IF RELIEFDIST=0 @FACE
%IF RELIEFDIST=#FUNNY @FACE

$CYCLETYPE=BACKBORE
#CYCLEGCODE=#BBGCODE
%GOTO @CALL

@FACE
* Back Face
#CYCLEGCODE=#BFGCODE
$CYCLETYPE=BACKFACE

@CALL
%CALL=PT_HOLE_CYCLES

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************

%PROCEDURE=HELICAL-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=HELICAL-CYCLE:%CALL=ENTER_PROCEDURE

%CALL=PT_CHECK_LONGHAND

$CYCLETYPE=HELICAL
#CYCLEGCODE=#HEGCODE

@CALL
%CALL=PT_HOLE_CYCLES

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************


%PROCEDURE=TAP-CYCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=TAP-CYCLE:%CALL=ENTER_PROCEDURE

%CALL=PT_CHECK_LONGHAND

#HANDOFTHREAD=USERVAR4
%IF #HANDOFTHREAD=0 %THEN #CYCLEGCODE=DATA1(39)	;	Unset
%IF #HANDOFTHREAD=1 %THEN #CYCLEGCODE=DATA1(39) ;	Selected Right Hand Threadcycle
%IF #HANDOFTHREAD=2 %THEN #CYCLEGCODE=DATA1(42)	;	Selected Left Hand Thread
*
* Check and reset direction
#TMP1=#DIRECTION
%IF #HANDOFTHREAD=2 @LEFT

* Right hand threads
%IF #DIRECTION=DATA2(5) @END
%IF #DIRECTION=DATA2(14) @END
#DIRECTION=DATA2(5)
%IF #TMP1=DATA2(15) %THEN #DIRECTION=DATA2(14)
%GOTO @END

@LEFT
* Left hand threads
%IF #DIRECTION=DATA2(6) @END
%IF #DIRECTION=DATA2(15) @END
#DIRECTION=DATA2(6)
%IF #TMP1=DATA2(14) %THEN #DIRECTION=DATA2(15)
*
@END
%CALL=PT_CHECK_TAPPING
$CYCLETYPE=TAPPING
* %IF #TAPTYPE=2 %THEN $CYCLETYPE=RIGIDTAPPING
#PITCH=PITCH
#DWELLGCODE=#FUNNY
#DEGR=#FUNNY
#BOREOFFSET=#FUNNY
* #DEPTH=#DEPTH*#FUNNY

%CALL=PT_HOLE_CYCLES

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=PMACRO-2
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-2:%CALL=ENTER_PROCEDURE

* Set CRC output control for profile lead in/out
%IF SUBFUNCT=0 @SKIP
$COMPOUTPUT=FALSE

@SKIP


#XMOVE=XMOVE:#YMOVE=YMOVE:#ZMOVE=ZMOVE
#FEED=FEED
%IF FEED=#FUNNY %THEN #FEED=XYFEED
%CALL=PT_OUTPUT_FEED

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=PMACRO-15
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-15:%CALL=ENTER_PROCEDURE


#DIRECTIONHOLD2=#FUNNY
#SPINWARN=#SPINWARNSAVE ; Reset
#TOOLCHANGE=1
#BADNULL=0
%LOAD=SUBFUNCT                        			 		; load current tooling values

#TOOLDIAM=TOOLRAD*2
#3DCCR=CORNERRAD : #3DTR=TOOLRAD
%IF TOOLTYPE=1 %THEN #3DCCR=TOOLRAD
%IF #3DCCR=#FUNNY %THEN #3DCCR=0

%IF USERVAR2=1 %THEN %GOTO @NOTOOL_WORKSHIFT
%IF USERVAR2=#FUNNY %THEN %GOTO @NOTOOL_WORKSHIFT
%IF USERVAR2=0 %THEN %GOTO @NOTOOL_WORKSHIFT
%IF #SHIFTWARN=0 @NOWARN
*  %IF #G55<>0 %THEN $WARNING="Warning - Workshift in Toolchange not valid with Datum Shift - Option ignored":%CALL=CODECON_WARNING:%GOTO @NOTOOL_WORKSHIFT

@NOWARN
#WORKGCODE=USERVAR2
@NOTOOL_WORKSHIFT

%IF #TLOCOMP=1 %THEN #ADJZMOVE=TOOLEN %ELSE #ADJZMOVE=0		;	If TLOCOMP=True output turret datum else output gauge point
%CANCEL=#DIRECTION,#COOL,#SPEED,#FEED,#GCODE,#HCODE
*
#FIRSTRAPIDZ=NEXTZMOVE+#ADJZMOVE

* Spindle controls - swapped 22/03

%CALL=PMACRO-252
@DONE252

* ToolChange Coolant control - swapped 22/03
%CALL=PT_COOLANT

* Through tool coolant
#THROUGHTOOL1=#THROUGHTOOL1OFF
%IF THROUGHCOOLANT=1 %THEN #THROUGHTOOL1=#THROUGHTOOL1ON
%IF THROUGHCOOLANT=2 %THEN #THROUGHTOOL1=#THROUGHTOOL1HIGH

* Feedtype
#FEEDMODEGCODE=DATA1(46)		;	Feed / rev (G95)
%IF FEEDTYPE=1 %THEN #FEEDMODEGCODE=DATA1(45)	;	Feed / min (G94)
%IF #TOOLFEEDTYPE=1 %THEN %CALL=CODECON_FEED-MIN-REV

* Load next tool parameters
%CALL=PT_LOAD_NEXT

#XKEEP=XCPL
#TEMPROUND=#XKEEP
%CALL=PT_ROUND_VALUE
#XKEEP=#TEMPROUND

#YKEEP=YCPL
#TEMPROUND=#YKEEP
%CALL=PT_ROUND_VALUE
#YKEEP=#TEMPROUND

#ZKEEP=ZCPL
#TEMPROUND=#ZKEEP
%CALL=PT_ROUND_VALUE
#ZKEEP=#TEMPROUND

#XMOVE=#XKEEP
#YMOVE=#YKEEP
#ZMOVE=#ZKEEP

* Position not move, therefore never incremental
#TEMP=#INCRXYZ
#INCRXYZ=0
%CALL=NOMOTION
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ
#INCRXYZ=#TEMP

#TOOLCOUNT=#TOOLCOUNT+1
%CALL=PT_SET_TLO



* Set Hole Depth Offset 11/05/10
%CALL=PT_SET_HOLE_OFFSET

%CALL=PT_PLANE_INIT


* Update for toolchange datum tokens - 1301
#XSUB=XSUB : #YSUB=YSUB : #ZSUB=ZSUB

%IF SUBFUNCT<>1 @GENERAL_TOOLCHANGE

* Removed provisionally for W34915
* IF TEMPLATE=MPLMILL^4AXMILL^5AXMILL
* %CALL=PT_ABS_DATUM_RECALL
* ENDIF

%CALL=CODECON_FIRST-TOOLCHANGE

%GOTO @END


@GENERAL_TOOLCHANGE

* Check correct position
%IF #RAPIDTOOL=1 @CHECKZ
%IF #TOOLRAPWARN=0 @CHECKZ
%IF TOOLMANUAL=1 @CHECKZ ; Manual TC any position

* No Rapid_to_ToolChange call
$WARNING="Warning - Rapid to Toolchange should be performed prior to a Toolchange":%CALL=CODECON_WARNING
$WARNING="          TLO may not be applied correctly & NC code may not reflect toolpaths":%CALL=CODECON_WARNING
%GOTO @CALL

@CHECKZ
%IF #TOOLZWARN=0 @CALL

* Check Z position only, allow for axis reversal
#TMP=ZTOOL-TOOLZSET
%IF #ZKEEP=#TMP @CALL

$WARNING="Warning - Toolchange not at specified Z height":%CALL=CODECON_WARNING

@CALL
%IF SUBFUNCT=NUMTOOLS @LAST_TOOLCHANGE

%CALL=CODECON_GENERAL-TOOLCHANGE

%GOTO @END

@LAST_TOOLCHANGE

%CALL=CODECON_LAST-TOOLCHANGE

@END
%LOAD=SUBFUNCT
#COMPON=0:#FIRSTIME=2:#ABS=DATA1(47)
%CANCEL=#GCODE                      ; Force G code for safety


<[#XMOVE=10][#YMOVE=10][#ZMOVE=10]> ; Initialise position
#WRAPHOLD=#FUNNY				    ; Force Wrap Radius to be re-instated
#RAPIDTOOL=0



#WORKGCODEHOLD=#WORKGCODE

%IF #PROCTRACE=0 @EXIT2
%IF #TRMODE=0 @STARTS
%IF HEADANGLE=0 @STARTS
%IF HEADANGLE=#FUNNY @STARTS
%IF CPLPLANE=5 @STARTS ; Aligned with Spindle

<Angled Head detected CPLPLANE=[CPLPLANE=13]  MOUNTANGLE=[MOUNTANGLE=13]>

#CUBICCOORDS=0 @STARTS
%IF MCOORD=0 @STARTS
<Machine coords for cubic planes>
%IF CPLPLANE=0 @STARTS ; Non-orthogonal
<Orthogonal plane detected>

@STARTS
%IF #TRSTARTS=0 @EXIT
* Output initial position after TC and Index only
#TRX=#XMOVE
#TRY=#YMOVE
#TRZ=#ZMOVE
<* Current position set at [#TRX=0][#TRY=1][#TRZ=2]>
@EXIT
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
@EXIT2
%ENDM


%PROCEDURE=PT_COOLANT
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_COOLANT:%CALL=ENTER_PROCEDURE
* process new coolant options
* but still consider old range (q205) based on some rules
* ***********************************
* Q205  	|New Coolant |Result output
* OFF			 OFF			    = OFF
* FLOOD		 FLOOD
* MIST		 MIST
* AIR			 AIR
* ON/FLOOD OFF			    = FLOOD
* FLOOD		 FLOOD
* MIST		 MIST
* AIR			 AIR
* MIST		 OFF  			  = MIST
* FLOOD		 MIST
* MIST		 MIST
* AIR			 AIR

%IF COOLANT=0 @P-OFF
%IF COOLANT=1 @P-FLOOD
%IF COOLANT=2 @MIST ; if new is "mist", always output mist

* ouput Air M-code
* if new coolant is "air" output will always be "air"
#COOL=DATA2(11)
%GOTO @END

@P-OFF
* off coolant, but check q205
%IF USERVAR5=3 @FLOOD
%IF USERVAR5=4 @MIST
%GOTO @OFF

@P-FLOOD
* flood coolant, but check q205
%IF USERVAR5=4 @MIST
%GOTO @FLOOD

@OFF
* ouput Off M-code
#COOL=DATA2(10)
* AutoCoolant
%IF TOOLTYPE=18 @END  ;  probe tools do not want coolant
%IF #AUTOCOOL>0 %THEN #COOL=DATA2(8)
%GOTO @END

@MIST
* ouput Mist M-code
#COOL=DATA2(9)
%GOTO @END

@FLOOD
* ouput Flood M-code
#COOL=DATA2(8)
%IF #COMINED=0 @END
<[#COOL=10]>


@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_LOAD_NEXT
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_LOAD_NEXT:%CALL=ENTER_PROCEDURE
* Load next tool parameters and reload current tool at the end

#TMP=SUBFUNCT+1
%IF SUBFUNCT=NUMTOOLS %THEN #TMP=1
%LOAD=#TMP
#NEXTTOOL=POSITION
$NEXTGROUP=GROUP
#NEXTGROUPNUMBER=GROUPNUMBER
$NEXTGROUPSTRING=GROUPSTRING
$NEXTID=ID
#NEXTIDNUMBER=IDNUMBER
$NEXTIDSTRING=IDSTRING
$NEXTCOMMENT=USERDEFINEDSTRING
$NEXTDESCRIPTION=TOOLDESCRIPTION

* Always reload current tool before leaving
%LOAD=SUBFUNCT

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


**************************************************************************
%PROCEDURE=PMACRO-29
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-29:%CALL=ENTER_PROCEDURE

*	Cutter compensation will ;
*	1.	Only be active during feedrate moves - not rapid
*	2.	Will not be active during a Z move.  (NOTE! G17=> Z/G18 => Y/G19 => X)
*	Only Feed Code Constructor has Cutter comp Tokens available.
*
*	NOTE! All output is processed is produced from a cut move : feed, clw, cclw
*
*	Subfunct 1=off, 2=left, 3=right
* #WarnCRC = 1  CRC Warn if Used
* #WARNCRC90 = 1  CRC warn if not 90
* #CRCONZ2   =1  Warn if applied with Z move

* #CRCONZ1   =1  Warn if removed with Z move
#COMPSTATE=#COMPON ; Current State
%IF SUBFUNCT>1 %THEN #COMPON=1 %ELSE #COMPON=0			;	Record if compensation is on.
%IF #COMPSTATE=#COMPON @JUMP

%IF #WARNCRC=1 %THEN $WARNING="Warning - Cutter Radius Compensation has been programmed":%CALL=CODECON_WARNING

$COMPOUTPUT=FALSE

@JUMP
#LEADOUTCOUNT=#FUNNY		;	Comp is cancelled when #LEADOUTCOUNT=1

%IF SUBFUNCT=1 %THEN #COMPGCODE=DATA1(20):#LEADOUTCOUNT=1	;	Off
%IF SUBFUNCT=2 %THEN #COMPGCODE=DATA1(21)					;	Left
%IF SUBFUNCT=3 %THEN #COMPGCODE=DATA1(22)					;	Right
*
*		Register number - If Uservar67 set then use else determine dependant on #AUTOREG

*
%IF USERVAR1=#FUNNY %THEN USERVAR1=0 ; Protect
%IF USERVAR1<>0 %THEN #COMPDCODE=USERVAR1:%GOTO @REGISTER_SET

%IF #REGOFFSET<>#FUNNY %THEN #COMPDCODE=POSITION+#REGOFFSET:%GOTO @REGISTER_SET

%IF #AUTOREG=1 %THEN #COMPDCODE=POSITION+#MAXTOOLS1
%IF #AUTOREG=2 %THEN #COMPDCODE=POSITION
%IF #AUTOREG=3 %THEN #COMPDCODE=#MAXTOOLS1+#TOOLCOUNT
@REGISTER_SET
*
*		If mirror is active then need to reverse cutter comp
*
%IF #MIRROR=1 %THEN %CALL=PT_REVERSE_COMP_MIRROR

@END
*	Hold original settings
#COMPGCODEHOLD=#COMPGCODE
#COMPDCODEHOLD=#COMPDCODE

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=PMACRO-32
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-32:%CALL=ENTER_PROCEDURE
* <*Move [XMOVE=0] [YMOVE=1] [Zmove=2] >  ; End pt of orig subroutine
* <*Inc  [XINC=0] [YINC=1] [ZINC=2] >     ; Tot increments this level of nesting
* <*Sub  [XSUB=0] [YSUB=1] [ZSUB=2] >     ; Start point of orig subroutine
* <*Hold [#XHOLD=0] [#YHOLD=1] [#ZHOLD=2] > ; Start point this level of nesting
* Note: This routine now uses #XTSUB etc to avoid corruption of #XSUB

%IF NOCYCLE=1 @ALLPASSES

* First pass only - Initialise start point
* First pass through translate is second call of subroutine.
#XTSUB=XEND
#YTSUB=YEND
#ZTSUB=ZEND

@ALLPASSES
*
%IF PATHTRACE=1 %THEN %NOCYCLE


#SPEED=SPEED:<[#SPEED=10]>  ; Re-initialise in case changed in subroutine
#FEED=FEED:<[#FEED=10]>

*	Rapid to position of next move

#GCODE=DATA1(1)

%IF #INCRSUBS=0 @APPROACH1
* Incremental Subroutines
#XTSUB=#XTSUB+XINC
#YTSUB=#YTSUB+YINC
#ZTSUB=#ZTSUB+ZINC
#XMOVE=#XTSUB
#YMOVE=#YTSUB
#ZMOVE=#ZTSUB
%IF #INCRXYZ=0 @APPROACH

#XMOVE=XINC+#XHOLD
#YMOVE=YINC+#YHOLD
#ZMOVE=ZINC+#ZHOLD
%GOTO @APPROACH

@APPROACH1
* Absolute approach
#XMOVE=XEND+XINC
#YMOVE=YEND+YINC
#ZMOVE=ZEND+ZINC

@APPROACH
%CALL=PT_OUTPUT_RAPID

* prevent output of null effect G92 block
%IF XEND<>#XHOLD @APPLY
%IF YEND<>#YHOLD @APPLY
%IF ZEND=#ZHOLD @SUBCALL

@APPLY
*	Apply translation - G92 will reset registers
#XMOVE=XEND
#YMOVE=YEND
#ZMOVE=ZEND
#PRESETGCODE=DATA1(23)

@OUTPUT
%IF #INCRSUBS=0 %THEN %CALL=CODECON_TRANSLATE

@SUBCALL
*	Call Subroutine
%CALL=PT_OUTPUT_SUBCALL

@END

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=PMACRO-33
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-33:%CALL=ENTER_PROCEDURE

%IF PATHTRACE=1 %THEN %NOCYCLE ; Longhand

%IF #COUNT=#FUNNY %THEN #COUNT=0
#COUNT=#COUNT+1
#ANGLE2=ANGLE*#COUNT

* Set Angle2 correctly
* Reverse direction of 0 -> 360 if required
%IF #REVANGDIR=1 %THEN #ANGLE2=360-#ANGLE2

* Reset within 0-360
%IF #LIMIT360=0 @SET1
@LOOP1a
%IF #ANGLE2>=360 %THEN #ANGLE2=#ANGLE2-360:%GOTO @LOOP1a
%IF #ANGLE2<0 %THEN #ANGLE2=#ANGLE2+360:%GOTO @LOOP1a
@SET1

%IF #ANGLE2=360 %THEN #ANGLE2=0
* Accommodate -0 by setting zero angle to 0.0000001 and calculating sign
* This will truncate to 0 on output with correct +/- sign
%IF #ANGLE2=0 %THEN #ANGLE2=0.0000001

%CALL=PMACRO-32

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



**************************************************************************

%PROCEDURE=PMACRO-35
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-35:%CALL=ENTER_PROCEDURE

%IF PATHTRACE=1 %THEN %NOCYCLE
*
* Retract first if requested
#XMOVE=#FUNNY
#YMOVE=#FUNNY
#ZMOVE=#FUNNY
%IF PECKRETRACT=0 @SKIPZCLEAR       ;	Test for rapid plane required
%IF MCOORD=0 %THEN #ZMOVE=RPLANE:%GOTO @MOVE1
%IF CPLPLANE=0 %THEN #ZMOVE=RPLANE:%GOTO @MOVE1
%IF CPLPLANE=1 %THEN #XMOVE=RPLANE:%GOTO @MOVE1
%IF CPLPLANE=2 %THEN #XMOVE=RPLANE:%GOTO @MOVE1
%IF CPLPLANE=3 %THEN #YMOVE=RPLANE:%GOTO @MOVE1
%IF CPLPLANE=4 %THEN #YMOVE=RPLANE:%GOTO @MOVE1
%IF CPLPLANE=5 %THEN #ZMOVE=RPLANE:%GOTO @MOVE1
%IF CPLPLANE=6 %THEN #ZMOVE=RPLANE
*
@MOVE1
*	Rapid to Rplane
%CALL=PT_OUTPUT_RAPID
*
@SKIPZCLEAR
* Move 2 axes to start point
#XMOVE=#FUNNY
#YMOVE=#FUNNY
#ZMOVE=#FUNNY
%IF MCOORD=0 %THEN #XMOVE=XSUB:#YMOVE=YSUB:%GOTO @MOVE2
%IF CPLPLANE=0 %THEN #XMOVE=XSUB:#YMOVE=YSUB:%GOTO @MOVE2
%IF CPLPLANE=1 %THEN #ZMOVE=ZSUB:#YMOVE=YSUB:%GOTO @MOVE2
%IF CPLPLANE=2 %THEN #ZMOVE=ZSUB:#YMOVE=YSUB:%GOTO @MOVE2
%IF CPLPLANE=3 %THEN #ZMOVE=ZSUB:#XMOVE=XSUB:%GOTO @MOVE2
%IF CPLPLANE=4 %THEN #ZMOVE=ZSUB:#XMOVE=XSUB:%GOTO @MOVE2
%IF CPLPLANE=5 %THEN #XMOVE=XSUB:#YMOVE=YSUB:%GOTO @MOVE2
%IF CPLPLANE=6 %THEN #XMOVE=XSUB:#YMOVE=YSUB
*
@MOVE2
%CALL=PT_OUTPUT_RAPID
*
@THERE
* Plunge to start point
* NB Only the active INC value is set for PECK
#XMOVE=XSUB:#YMOVE=YSUB:#ZMOVE=ZSUB
%IF MCOORD=0 %THEN #ZMOVE=ZSUB+ZINC:%GOTO @MOVE3
%IF CPLPLANE=0 %THEN #ZMOVE=ZSUB+ZINC:%GOTO @MOVE3
%IF CPLPLANE=1 %THEN #XMOVE=XSUB+XINC:%GOTO @MOVE3
%IF CPLPLANE=2 %THEN #XMOVE=XSUB+XINC:%GOTO @MOVE3
%IF CPLPLANE=3 %THEN #YMOVE=YSUB+YINC:%GOTO @MOVE3
%IF CPLPLANE=4 %THEN #YMOVE=YSUB+YINC:%GOTO @MOVE3
%IF CPLPLANE=5 %THEN #ZMOVE=ZSUB+ZINC:%GOTO @MOVE3
%IF CPLPLANE=6 %THEN #ZMOVE=ZSUB+ZINC

@MOVE3
%IF FEED=#FUNNY %THEN #FEED=XYFEED %ELSE #FEED=ZFEED
%CALL=PT_OUTPUT_FEED
*
%CALL=PT_OUTPUT_SUBCALL
*
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=PMACRO-37
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-37:%CALL=ENTER_PROCEDURE

%IF #TRTHREAD<>1 @JUMP

************  Diagnostic printout
< >
<* Thread Mill Parameters>
< >
<* Clearance       [FIELD1=13]>
<* Retract         [FIELD2=13]>
<* Thread Diameter [FIELD3=13]>
<* Level           [FIELD4=13]>
<* Thread Depth    [FIELD5=13]>
<* Pitch           [FIELD6=13]>
< >
<* Array Content>
<* Loop   XPOINT  YPOINT  RADIUS>
#LOOP=1
@NEXT1
< >
%IF #LOOP>LAST @JUMP
#TYPE=XPOINT(#LOOP)
#TMP1=2
%IF #TYPE>1 %THEN #TMP1=#TMP1+1
%IF #TYPE>3 %THEN #TMP1=#TMP1+1
%IF #TYPE=0 %THEN <* Rapid>
%IF #TYPE=1 %THEN <* Feed>
%IF #TYPE=2 %THEN <* 2D Arc>
%IF #TYPE=3 %THEN <* 2D Arc>
%IF #TYPE=4 %THEN <* Helix>
%IF #TYPE=5 %THEN <* Helix>
@NEXT2
#TRX=XPOINT(#LOOP):#TRY=YPOINT(#LOOP):#TRZ=RADIUS(#LOOP)
<* [#LOOP=14]     [#TRX=0] [#TRY=1] [#TRZ=2]>
#LOOP=#LOOP+1
#TMP1=#TMP1-1
%IF #TMP1>0 @NEXT2
%GOTO @NEXT1
************
@JUMP

#THRDPOSFEED=#FUNNY ; Set on first lead move
#PLANEGCODE=DATA1(13)
%IF XYPLANE=1 %THEN #PLANEGCODE=DATA1(14)
%IF XYPLANE=2 %THEN #PLANEGCODE=DATA1(15)

; #THREADCANNED=0 No canned cycle available
;               1 Single block helix
;               2 Full canned cycle
#BEFORECYCLE=1
#THREADSINGLE=0
%IF USERVAR8=0 @CALL ; Normal operation
%IF #THREADCANNED=0 %THEN USERVAR8=0:%GOTO @CALL
#THREADSINGLE=1
%IF #THREADCANNED=1 %THEN USERVAR8=0   ; Reset for multiple helix
* Full canned cycle USERVAR8=1. #THREADCANNED=2

* Canned cycle preparation
#THRDPLUNGE=#FUNNY
#THRDSTARTZ=#FUNNY
#THRDENDZ=#FUNNY
#CYCOUT=0
@CALL
%CALL=PT_THREAD_MILL
* Canned cycle output
%IF USERVAR8=0 @END ; Canned not requested
%IF #THREADCANNED<2 @END ; Canned not available

* True canned cycle only
%IF #CYCOUT=1 @END2  ; Canned already output
%CALL=PT_THRD_CANNED37
#BEFORECYCLE=0
#XMOVE=#THRDXPLUNGE
#YMOVE=#THRDYPLUNGE
#ZMOVE=FIELD1
%CALL=CODECON_HOLE-CYCLEPOINTS

@END2
%CALL=CODECON_CANCEL-CANNED-CYCLE
@END
%IF #KEEPPOINTS<>#FUNNY %THEN #CYCLEPOINTS=#KEEPPOINTS ; S840
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************
%PROCEDURE=PT_THREAD_MILL
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_THREAD_MILL:%CALL=ENTER_PROCEDURE

%IF USERVAR8<>1 %THEN USERVAR8=0 ; Safety check - full canned cycle flag
#CYCOUT=0

#THRDSTARTZ=#FUNNY
#THRDCLEAR=#FUNNY
%IF #MACRO=37 @FEEDLATER
#THRDTEMP=#FEED ; Temp keep
#FEED=LEADFEED ; For Lead Feed Type conversion
%CALL=PT_CONTROL_FEEDTYPE
#THRDPOSFEED=#FEED

#FEED=#THRDTEMP ; For Cutting Feed Type conversion
%CALL=PT_CONTROL_FEEDTYPE
#THRDFEED=#FEED

@FEEDLATER

*If no comp requested ensure output flag is true
%IF #COMPON=0 %THEN $COMPOUTPUT=TRUE
#COMPCYCLE=#COMPON ; Global and local control of CRC
#THRDCOMPCODE=#COMPGCODE
%IF #COMPGCODE<>DATA1(20) %THEN #COMPGCODE=#FUNNY
#HELIXCOUNT=0
#OUTPUTCYCLE=0
#OUTPUTPOINT=1
* Check for helical interpolation
* %IF PATHTRACE=1 %THEN %NOCYCLE

*Check for array data.
%IF LAST<5 @END

#BLOCKSMISSED=0 ;Initialise helical block count
#SPEED=SPEED
#THREADMOVE=1
#LOOP=1
@LOOP
* #TMP=XPOINT(#LOOP):#TMP1=YPOINT(#LOOP):#TMP2=RADIUS(#LOOP)
* <Loop [#LOOP=0] . [#TMP=0] [#TMP1=1] [#TMP2=2] >

%IF #LOOP>LAST @ELOOP

*look for lift out on NEXT move
%IF XPOINT(#LOOP)<=1 %THEN #NEXTLOOP=#LOOP+2:%GOTO @CHECK
%IF XPOINT(#LOOP)<=3 %THEN #NEXTLOOP=#LOOP+3:%GOTO @CHECK
%IF XPOINT(#LOOP)<=5 %THEN #NEXTLOOP=#LOOP+4
@CHECK
#TMP=XPOINT(#NEXTLOOP)
%IF #TMP<>0 @NOT-LIFT

* <* Loop [#LOOP=0] Next [#NEXTLOOP=0]>
#TMP=#LOOP+1
#TMP1=ZPOINT(#TMP) ; This Z

#NEXTLOOP=#NEXTLOOP+1
#TMP2=ZPOINT(#NEXTLOOP) ; next Z

%IF #TMP1>=#TMP2 @NOT-LIFT

* <Lift Next From [#TMP1=2] To [#TMP2=2]>
#COMPGCODE=DATA1(20)
%IF #COMPON=1 %THEN $COMPOUTPUT=FALSE
#COMPON=0
#THREADMOVE=2
@NOT-LIFT


* Look for last leg and cancel compensation
%IF #TYPE>3 %THEN #TMP=#LOOP+4 %ELSE #TMP=#LOOP+3
%IF #TMP>LAST %THEN %GOTO @LAST %ELSE %GOTO @NOT-LAST

@LAST
%IF #COMPON=1 %THEN $COMPOUTPUT=FALSE
#COMPON=0
#THREADMOVE=2

@NOT-LAST
%IF XPOINT(#LOOP)<=1 %THEN %CALL=PT_THRD_MOVE:%GOTO @LOOP
%IF XPOINT(#LOOP)<=3 %THEN %CALL=PT_THRD_ARC:%GOTO @LOOP
%IF XPOINT(#LOOP)<=5 %THEN %CALL=PT_THRD_ARC_HELICAL:%GOTO @LOOP
%IF XPOINT(#LOOP)>5  %THEN %CALL=PT_SKIP_RECORD:%GOTO @LOOP
@ELOOP
#THREADMOVE=0

@END
#COMPON=#COMPCYCLE ; Reset to original condition
#COMPGCODE=#THRDCOMPCODE

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************

%PROCEDURE=PMACRO-40
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-40:%CALL=ENTER_PROCEDURE


* Through Tool Coolant
#THROUGHTOOL1=#THROUGHTOOL1OFF

* Adjust tool/home position to current CPL if required
%IF #REFSHIFT=0 @SHIFT
%IF #REFSHIFT=2 @NEWSHIFT
#XMOVE=XHOME
#YMOVE=YHOME
#ZMOVE=ZHOME
%GOTO @END

@SHIFT
#XMOVE=XHOME-#XTOOLREF
#YMOVE=YHOME-#YTOOLREF
#ZMOVE=ZHOME-#ZTOOLREF
%GOTO @END

@NEWSHIFT
#XMOVE=XMOVE
#YMOVE=YMOVE
#ZMOVE=ZMOVE

*;IF TEMPLATE=MPLMILL^4AXMILL^5AXMILL
*%IF MILLMODE=1 @END
*%IF CAXIS<>1 @END
** Holes differ from mill - use separate flags to determine
** if the move to tc should be rotary or planar
*%IF #HOLECYCLE3=1 @HOLES
** Milling
*%IF #ROTARYCARTESIAN=1 @END
*%GOTO @MILLING
*@HOLES
*%IF #ROTARYCARTESIANHOLE=1 @END
*@MILLING
*%IF ACTIVELINEARAXIS<1 @END
*%IF ACTIVELINEARAXIS>2 @END
*#TMP=XMOVE*XMOVE : #TMP1=YMOVE*YMOVE
*#TMP=#TMP+#TMP1 : #TMP1=SQR(#TMP)
*%IF ACTIVELINEARAXIS=1 %THEN #XMOVE=#TMP1*ACTIVELINEARAXISSIDE : #YMOVE=0 %ELSE #XMOVE=0 : #YMOVE=#TMP1*ACTIVELINEARAXISSIDE
*;ENDIF

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************

%PROCEDURE=PMACRO-41
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-41:%CALL=ENTER_PROCEDURE


* Through Tool Coolant
#THROUGHTOOL1=#THROUGHTOOL1OFF

* Adjust tool/home position to current CPL if required
%IF #REFSHIFT=0 @SHIFT
%IF #REFSHIFT=2 @NEWSHIFT
#XMOVE=XTOOL
#YMOVE=YTOOL
#ZMOVE=ZTOOL
%GOTO @CONTINUE

@SHIFT
#XMOVE=XTOOL-#XTOOLREF
#YMOVE=YTOOL-#YTOOLREF
#ZMOVE=ZTOOL-#ZTOOLREF
%GOTO @CONTINUE

@NEWSHIFT
#XMOVE=XMOVE
#YMOVE=YMOVE
#ZMOVE=ZMOVE

*;IF TEMPLATE=MPLMILL^4AXMILL^5AXMILL
*%IF MILLMODE=1 @CONTINUE
*%IF CAXIS<>1 @CONTINUE
** Holes differ from mill - use separate flags to determine
** if the move to tc should be rotary or planar
*%IF #HOLECYCLE3=1 @HOLES
** Milling
*%IF #ROTARYCARTESIAN=1 @CONTINUE
*%GOTO @MILLING
*@HOLES
*%IF #ROTARYCARTESIANHOLE=1 @CONTINUE
*@MILLING
*%IF ACTIVELINEARAXIS<1 @CONTINUE
*%IF ACTIVELINEARAXIS>2 @CONTINUE
*#TMP=XMOVE*XMOVE : #TMP1=YMOVE*YMOVE
*#TMP=#TMP+#TMP1 : #TMP1=SQR(#TMP)
*%IF ACTIVELINEARAXIS=1 %THEN #XMOVE=#TMP1*ACTIVELINEARAXISSIDE : #YMOVE=0 %ELSE #XMOVE=0 : #YMOVE=#TMP1*ACTIVELINEARAXISSIDE
*;ENDIF

@CONTINUE
#RAPIDTOOL=1

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


**************************************************************************
%PROCEDURE=P-RESET
%IF #PROCTRACE=1 %THEN $PROCEDURE=P-RESET:%CALL=ENTER_PROCEDURE
* <*Move [XMOVE=0] [YMOVE=1] [Zmove=2] >  ; End pt of orig subroutine
* <*Inc  [XINC=0] [YINC=1] [ZINC=2] >     ; Tot increments this level of nesting
* <*Sub  [XSUB=0] [YSUB=1] [ZSUB=2] >     ; Start point of orig subroutine
* <*Hold [#XHOLD=0] [#YHOLD=1] [#ZHOLD=2] > ; Start point this level of nesting

#COUNT=0
#ROTROTFLAG=0
%IF SUBFUNCT=3 %THEN #MIRROR=0:%CALL=PT_REVERSE_COMP_MIRROR:%GOTO @END
%IF SUBFUNCT=2 %THEN %GOTO @END

%IF PATHTRACE=1 @END			;	Skip Datum Reset if processing longhand

*	Translate Reset
#GCODE=DATA1(1)

* Reset is only needed if absolute subroutines have been used with G92 datum setting
%IF #INCRSUBS=1 @END

* Update stored end point (XINC etc in Reset are TOTAL increments for this level)
#XHOLD=#XHOLD+XINC
#YHOLD=#YHOLD+YINC
#ZHOLD=#ZHOLD+ZINC
*<*HOLD2 [#XHOLD=0] [#YHOLD=1] [#ZHOLD=2] >

* Final G92 position.
#XMOVE=#XHOLD ;+(XMOVE-XSUB)
#YMOVE=#YHOLD ;+(YMOVE-YSUB)
#ZMOVE=#ZHOLD ;+(ZMOVE-ZSUB)
%IF NEXTMACRO=48 @END ;Skip Datum Reset if next macro is Shift Datum
#GCODE=DATA1(23)
%CALL=CODECON_TRANSLATE

@END
* Update Keep values
%IF #XMOVE<>#FUNNY %THEN #XKEEP=#XMOVE*#XREVERSE
%IF #YMOVE<>#FUNNY %THEN #YKEEP=#YMOVE*#YREVERSE
%IF #ZMOVE<>#FUNNY %THEN #ZKEEP=#ZMOVE*#ZREVERSE
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************

%PROCEDURE=PMACRO-106
* Processing logic called by macro 106, Exact Stop
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-106:%CALL=ENTER_PROCEDURE

#EXACTSTOP=SUBFUNCT
%IF #EXACTMODE=1 @MODAL
* Single shot, G code set in linear move
*	If On then G09 will be output in Feed Macro instead of FeedGcode
%IF SUBFUNCT=2 %THEN %ALWAYS-OUTPUT=#GCODE
%IF SUBFUNCT=1 %THEN %OUTPUT-IF-CHANGED=#GCODE
%GOTO @CALL

@MODAL
* Mode setting
#EXACTSTOP=1  ; Suppress G09 on linear blocks
%IF $MACHINE="TNC" @TNC
%IF SUBFUNCT=2 %THEN #EXACTGCODE=DATA1(10)   ; Mode ON
%IF SUBFUNCT=1 %THEN #EXACTGCODE=DATA1(9) ; Mode OFF
%GOTO @CALL

@TNC
* TNCs have output through M-code
%IF SUBFUNCT=2 %THEN #EXACTGCODE=DATA2(42)   ; Mode ON
%IF SUBFUNCT=1 %THEN #EXACTGCODE=DATA2(43) ; Mode OFF
%IF #EXACTGCODE<=0 %THEN #EXACTGCODE=#FUNNY

@CALL
%CALL=CODECON_EXACT-STOP

@END
*
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************

%PROCEDURE=PMACRO-252
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-252:%CALL=ENTER_PROCEDURE

%IF DIRECTION=1 %THEN #DIRECTION=DATA2(4) : %GOTO @GEAR ; Stop
%IF DIRECTION=2 %THEN #DIRECTION=DATA2(5) : %GOTO @NOT-STOP ; Fwd
%IF DIRECTION=3 %THEN #DIRECTION=DATA2(6) : %GOTO @NOT-STOP ; Rev
%IF DIRECTION=4 %THEN #DIRECTION=DATA2(14)
%IF DIRECTION=5 %THEN #DIRECTION=DATA2(15)
%IF #COMINED=0 @NO-INIT
#COOL=DATA2(8) : <[#COOL=10]>
@NO-INIT

%IF #COMINED=1 @EXTRA
* processing non combined with mist
%IF DIRECTION=4 %THEN #DIRECTION=DATA2(5) : #COOL=DATA2(9) ; Fwd Cool
%IF DIRECTION=5 %THEN #DIRECTION=DATA2(6) : #COOL=DATA2(9) ; Rev Cool
%IF COOLANT<>1 @EXTRA
* processing non combined with flood
%IF DIRECTION=4 %THEN #DIRECTION=DATA2(5) : #COOL=DATA2(8) ; Fwd Cool
%IF DIRECTION=5 %THEN #DIRECTION=DATA2(6) : #COOL=DATA2(8) ; Rev Cool

@EXTRA
%IF COOLANT<>3 @GEAR
* processing air coolant (never combined)
%IF DIRECTION=4 %THEN #DIRECTION=DATA2(5) : #COOL=DATA2(11)
%IF DIRECTION=5 %THEN #DIRECTION=DATA2(6) : #COOL=DATA2(11)

@GEAR
* reprocess spindle stopped + coolant
%IF DIRECTION>1 @NOT-STOP
%IF COOLANT=2 %THEN #COOL=DATA2(9) %ELSE #COOL=DATA2(11)
@NOT-STOP
* if at the very end coolant is 0, make it off
* old range will be consider later on
%IF COOLANT=0 %THEN #COOL=DATA2(10)
%IF COOLANT<>0 @NO-AUTO
%IF TOOLTYPE=18 @NO-AUTO  ;  probe tools do not want coolant
%IF #AUTOCOOL=1 %THEN #COOL=DATA2(8)
@NO-AUTO

* May be comming from a manual toolchange
%IF #MACRO<>15 @CONT1
%IF #CURRENTMANUAL=0 @CONT1
%IF COOLANT<>0 @CONT1
* Reinstate auto coolant if necessary
%IF TOOLTYPE=18 @CONT1  ;  probe tools do not want coolant
%IF #AUTOCOOL=1 %THEN #COOL=DATA2(8)

@CONT1

* Now find Gear
#AUTOGEAR=0
%IF GEAR=0 %THEN #AUTOGEAR=1:%GOTO @CALL
#GEAR=GEAR-1

@CALL
* Spindle control
%IF DIRECTION>1 @MISSCOOL
* #COOLHOLD=#COOL 22/03
* #THROHOLD=#THROUGHTOOL1 22/03
%IF #AUTOCOOL=1 %THEN #COOL=DATA2(10)
#THROUGHTOOL1=#THROUGHTOOL1OFF
@MISSCOOL
%IF #MACRO=15 @END
%IF DIRECTION=1 %THEN %CALL=CODECON_SPINDLE:%GOTO @JUMP
%IF #SPINBLOCK=0 @JUMP
#SPEED=NEXTSPEED
%CALL=PT_GEAR_MCODE
%CALL=CODECON_SPINDLE

@JUMP
%IF DIRECTION>1 @END
* Reset old values if stopped
* #COOL=#COOLHOLD 22/03
#THROUGHTOOL1=#THROHOLD

#COOLHOLD=#COOL ; 22/03
%IF DIRECTION<4 @T1 ; 22/03
#COOL=#COOLHOLD ; 22/03
@T1 ; 22/03

@END

* If we are generating speeds on a separate block
* dirhold must only be updated upon them
* otherwise update here
%IF #SPINBLOCK=0 %THEN #DIRHOLD=DIRECTION

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

**************************************************************************

%PROCEDURE=PMACRO-675
%IF #PROCTRACE=1 %THEN $PROCEDURE=PMACRO-675:%CALL=ENTER_PROCEDURE

; The new thread milling cycle uses the following system variables in addition to all the standard hole cycle ones (level, depth etc):
; HOLEDIAM        306
; PITCH1          309
; INCLUDED_ANGLE  314 taper angle, degrees
; THREADDEPTH     326
; THREADINOUT     327
; HANDOFTHREAD    328
; STARTS          329 number of starts
; START_ANGLE     219
; FEEDADJUSTED    330
; THREADCANNED    331 canned cycle

#TMP=0
%IF #TMP=0 @NOTAPER ; No helical arcs
* Helix inaccurate for Taper thread
%IF INCLUDEDANGLE=0 @NOTAPER
%IF #TAPERWARN=0 @NOTAPER
$WARNING="Warning - Helix for taper threading may be inaccurate":%CALL=CODECON_WARNING
@NOTAPER

* Suppress CRC calls until Subfunct is set
$COMPOUTPUT=TRUE
#COMPGCODE=DATA1(20)

%IF THREADCANNED=0 @LONGHAND ; Longhand, depends on helical setting in post

* Canned cycle requested
; #THREADCANNED = 0 for None, 1 for Multi Turn Helix, 2 for Canned Cycle
%IF #THREADCANNED<>2 @LONGHAND ; Canned option supported

#TEMPCOUNT=0
* Check thread attributes
%IF #ALLOWSTANG=1 @TAPER ; Allow Non-Zero Start Angle
%IF STARTANGLE=0 @TAPER
$WARNING="Warning - Canned cycle not supported for start angle - Longhand forced":%CALL=CODECON_WARNING:#TEMPCOUNT=#TEMPCOUNT+1

@TAPER
%IF #ALLOWTAPER=1 @STARTS ; Allow Taper Angle
%IF INCLUDEDANGLE=0 @STARTS
$WARNING="Warning - Canned cycle not supported for taper thread - Longhand forced":%CALL=CODECON_WARNING:#TEMPCOUNT=#TEMPCOUNT+1

@STARTS
%IF #ALLOWMSTART=1 @TOOL ; Allow Multi-Start Thread
%IF STARTS=1 @TOOL
$WARNING="Warning - Canned cycle not supported for multi starts - Longhand forced":%CALL=CODECON_WARNING:#TEMPCOUNT=#TEMPCOUNT+1

@TOOL
* Check tool orientation conditions
%IF MCOORD=0 @CPLCOORDS
%IF CPLPLANE>4 @CPLCOORDS
%IF CPLPLANE=0 @WARN
%IF #ORTHMILLCYCLES=1 @CPLCOORDS

@WARN
$WARNING="Warning - Canned cycle not supported when Head is indexed - Longhand forced"
@CALLWARN
%CALL=CODECON_WARNING
%GOTO @LONGHAND

@CPLCOORDS
%IF #TEMPCOUNT>0 @LONGHAND3

$CYCLETYPE=THREAD

%CALL=PT_HOLE_CYCLES
%GOTO @END

@LONGHAND
%IF PATHTRACE=1 @LONGHAND3  ; Not Subroutines
%IF #SUBWARN=0 @LONGHAND3 ; No Warning set
$WARNING="Warning - Controller Subroutine Called for Longhand Hole Cycles":%CALL=CODECON_WARNING
@LONGHAND3
%NOCYCLE

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


**************************************************************************
*							*******************
*							  Debug Trace Procedures
*							*******************
*
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ENTER_PROCEDURE                  ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=ENTER_PROCEDURE
%IF #PROCTRACE2=0 @END
%IF $SPC="              " %THEN $SPC="               "     ;1
%IF $SPC="             "  %THEN $SPC="              "	   ;2
%IF $SPC="            "   %THEN $SPC="             "	   ;3
%IF $SPC="           "    %THEN $SPC="            "		   ;4
%IF $SPC="          "     %THEN $SPC="           "		   ;5
%IF $SPC="         "      %THEN $SPC="          "		   ;6
%IF $SPC="        "       %THEN $SPC="         "		   ;7
%IF $SPC="       "        %THEN $SPC="        "			   ;8
%IF $SPC="      "         %THEN $SPC="       "			   ;9
%IF $SPC="     "          %THEN $SPC="      "			   ;10
%IF $SPC="    "           %THEN $SPC="     "			   ;11
%IF $SPC="   "            %THEN $SPC="    "				   ;12
%IF $SPC="  "             %THEN $SPC="   "				   ;13
%IF $SPC=" "              %THEN $SPC="  "				   ;14
%IF $SPC=""               %THEN $SPC=" "				   ;15
<* [$SPC][$SPC]{62} [$PROCEDURE]>
@END
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ EXIT_PROCEDURE                   ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=EXIT_PROCEDURE
%IF #PROCTRACE2=0 @END
<* [$SPC][$SPC]{60} >
%IF $SPC=" "               %THEN $SPC=""	      			;1
%IF $SPC="  "              %THEN $SPC=" "		  			;2
%IF $SPC="   "             %THEN $SPC="  "		  			;3
%IF $SPC="    "            %THEN $SPC="   "		  			;4
%IF $SPC="     "           %THEN $SPC="    "	  			;5
%IF $SPC="      "          %THEN $SPC="     "	  			;6
%IF $SPC="       "         %THEN $SPC="      "	  			;7
%IF $SPC="        "        %THEN $SPC="       "	  			;8
%IF $SPC="         "       %THEN $SPC="        "	  		;9
%IF $SPC="          "      %THEN $SPC="         "			;10
%IF $SPC="           "     %THEN $SPC="          "			;11
%IF $SPC="            "    %THEN $SPC="           "			;12
%IF $SPC="             "   %THEN $SPC="            "		;13
%IF $SPC="              "  %THEN $SPC="             "		;14
%IF $SPC="               " %THEN $SPC="              "		;15
@END
%ENDM


%PROCEDURE=SET_TOOL_TYPE
%IF #PROCTRACE=1 %THEN $PROCEDURE=SET_TOOL_TYPE:%CALL=ENTER_PROCEDURE

* Called from token TOOLTYPE

%IF TOOLTYPE=0 %THEN $TYPE=ENDMILL:%GOTO @END
%IF TOOLTYPE=1 %THEN $TYPE=BALLNOSE:%GOTO @END
%IF TOOLTYPE=2 %THEN $TYPE=TAP:%GOTO @END
%IF TOOLTYPE=3 %THEN $TYPE=DRILL:%GOTO @END
%IF TOOLTYPE=4 %THEN $TYPE=TAPER:%GOTO @END
%IF TOOLTYPE=5 %THEN $TYPE=OTHER:%GOTO @END
%IF TOOLTYPE=6 %THEN $TYPE=T-SLOT:%GOTO @END
%IF TOOLTYPE=7 %THEN $TYPE=LOLLIPOP:%GOTO @END
%IF TOOLTYPE=8 %THEN $TYPE=THREADMILL:%GOTO @END
%IF TOOLTYPE=18 %THEN $TYPE=PROBE


@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*							*******************
*							  Program Runtime Questions
*							*******************
*
%PROCEDURE=PT_ASK_PROGVERSION
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ASK_PROGVERSION:%CALL=ENTER_PROCEDURE
* Handle User Input, Token PROGVERSION
* Options - Always Ask (1), Ask if Not Set (2), Never Ask (3), Ask Only Once (4)
%IF #QUESTION<4 @CONTINUE
* Ask Only Once
%IF #GOTPV=0 @ALWAYS
%GOTO @ALREADY_SET

@CONTINUE
%IF #QUESTION=1 @ALWAYS
%IF $PROGVER<>"" @ALREADY_SET
$PROGVER=JOBREV

%IF #QUESTION=3 @ALREADY_SET
%IF $PROGVER<>"" @ALREADY_SET

@ALWAYS
%ASK=Program Version Number=$PROGVER
%IF $PROGVER="" %THEN $PROGVER=JOBREV
#GOTPV=1

@ALREADY_SET
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*                               **********************************

%PROCEDURE=PT_ASK_PROGRAMMER
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ASK_PROGRAMMER:%CALL=ENTER_PROCEDURE
* Handle User Input, Token PROGRAMMER
* Options - Always Ask (1), Ask if Not Set (2), Never Ask (3), Ask Only Once (4)
%IF #QUESTION<4 @CONTINUE
* Ask Only Once
%IF #GOTPR=0 @ALWAYS
%GOTO @ALREADY_SET

@CONTINUE
%IF #QUESTION=1 @ALWAYS
%IF $ID<>"" @ALREADY_SET
$ID=JOBPROG

%IF #QUESTION=3 @ALREADY_SET
%IF $ID<>"" @ALREADY_SET

@ALWAYS
%ASK=Programmer's Name=$ID
%IF $ID="" %THEN $ID=JOBPROG
#GOTPR=1

@ALREADY_SET
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*                               **********************************

%PROCEDURE=PT_ASK_PROGDESCR
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ASK_PROGDESCR:%CALL=ENTER_PROCEDURE
* Handle User Input, Token PROGDESCR
* Options - Always Ask (1), Ask if Not Set (2), Never Ask (3), Ask Only Once (4)
%IF #QUESTION<4 @CONTINUE
* Ask Only Once
%IF #GOTDE=0 @ALWAYS
%GOTO @ALREADY_SET

@CONTINUE
%IF #QUESTION=1 @ALWAYS
%IF $DESCR<>"" @ALREADY_SET
$DESCR=PARTNAME

%IF #QUESTION=3 @ALREADY_SET
%IF $DESCR<>"" @ALREADY_SET

@ALWAYS
%ASK=Program Description=$DESCR
%IF $DESCR="" %THEN $DESCR=PARTNAME
#GOTDE=1

@ALREADY_SET
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*                               **********************************

%PROCEDURE=PT_ASK_PROGID
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ASK_PROGID:%CALL=ENTER_PROCEDURE
* Handle User Input, Token PROGID
* Options - Always Ask (1), Ask if Not Set (2), Never Ask (3), Ask Only Once (4)
%IF #QUESTION<4 @CONTINUE
* Ask Only Once
%IF #GOTID=0 @ALWAYS
%GOTO @ALREADY_SET

@CONTINUE
%IF #QUESTION=1 @ALWAYS
%IF #PROGID<>#FUNNY @ALREADY_SET
#PROGID=JOBPROGID1

%IF #QUESTION=3 @ALREADY_SET
%IF #PROGID<>#FUNNY @ALREADY_SET

@ALWAYS
%ASK=Enter program ID number=#PROGID
%IF #PROGID=#FUNNY %THEN #PROGID=JOBPROGID1
#GOTID=1

@ALREADY_SET
%IF #PROGID=#FUNNY %THEN #PROGID=1
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


*	*****************************************
*	*	Test Profile Lead conditions		*
*	*****************************************
*
%PROCEDURE=PT_CHECK_LEAD
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_CHECK_LEAD:%CALL=ENTER_PROCEDURE
* Check for arc move
%IF #WARNCRCARC=0 @LINEAR
%IF #MACRO=53 @ARCMOVE
%IF #MACRO=54 @ARCMOVE
%IF #MACRO<>37 @LINEAR
* Thread Milling
%IF #GCODE=DATA1(3) @ARCMOVE
%IF #GCODE=DATA1(4) @ARCMOVE
%GOTO @LINEAR

@ARCMOVE
$WARNING="Warning - Cutter Compensation changed on arc move":%CALL=CODECON_WARNING

@LINEAR

* #WarnCRC = 0  No warnings
*            1  CRC Warn if Used only
*            2  CRC warn if not 90 only
*            3  Both above warnings

%IF #WARNCRC90=0 @CHECKZ				;	If Code Wizard option to warn not set then miss warning message
%IF FIELD1=#FUNNY @LEAD_NOT_90
%IF FIELD1<>90 @LEAD_NOT_90
%GOTO @CHECKZ
@LEAD_NOT_90
$WARNING="Warning - Cutter Compensation active - Lead move not 90 degree":%CALL=CODECON_WARNING

@CHECKZ
%IF #MOVE<4 @END			; Move doesn't include Z axis
*
%IF #COMPMODE=1 @LEADIN
%IF #CRCONZ1=0 @END       ; Check for CRC on Z allowed
* Warn for CRC application on Z move
$WARNING="Warning - Cutter Compensation removed with Z component":%CALL=CODECON_WARNING

%GOTO @END

@LEADIN
%IF #CRCONZ2=0 @END       ; Check for CRC on Z allowed
* Warn for CRC cancellation on Z move
$WARNING="Warning - Cutter Compensation applied with Z component":%CALL=CODECON_WARNING

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*
%PROCEDURE=PT_OUTPUT_RAPID			;	Called for all rapid motion - single code constructor
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_RAPID:%CALL=ENTER_PROCEDURE

*
*		Global output Rapids as high feedrates if #FEEDRAPIDS set to Yes - use #FEED to force re-instate of cut feed
*

#GCODE=DATA1(1)
#FEED=NEXTFEED

%IF #TOOLCHANGE=0 @NOTOOL
* Changed 26/03 dont set zmove here (mc coords etc)
%IF #HOLECYCLE=1 @NOTOOL ; NEXTZMOVE cannot be used when using a hole cycle
%IF #MACRO=37 @NOTOOL ; NEXTZMOVE cannot be used with thread mill
* Don't use NEXTZ if FEED move follows
%IF NEXTMACRO=2 %THEN #ZMOVE=ZMOVE:%GOTO @NOTOOL
%IF NEXTMACRO=53 %THEN #ZMOVE=ZMOVE:%GOTO @NOTOOL
%IF NEXTMACRO=54 %THEN #ZMOVE=ZMOVE:%GOTO @NOTOOL
*
* If the first move after is in xy only then z should be next z
#TMP=#ZKEEP+#ADJZMOVE
* %IF #MACRO=37 @NOSET ; Don't over-ride  removed 24/10


#ZMOVE=ZMOVE


@NOSET
%IF #3DAFTERTC=2 @NOTOOL

* Certain occasions in planar mill create a null move after index
* this attempts to skip it
%IF MILLMODE=0 @NOTPLANAR
%IF #BADNULL=1 @NOTOOL
@NOTPLANAR
%IF #FIRSTRAPIDZ=#TMP %THEN #ZMOVE=NEXTZMOVE
*
@NOTOOL
%IF #FEEDRAPIDS=1 %THEN #FEED=#RAPIDFEEDRATE:#CONVERTEDMOVE=1:%CALL=PT_OUTPUT_FEED:%GOTO @END	; Rapids converted to feed
%IF #RAPDIST<>0 %THEN %CALL=PT_CALC_VECTOR_DISTANCE	;	Convert small moves to Rapid - calc vector distance

@ALLFEEDS


* Keep nKEEP for possible reset
#XMOVEW=#XKEEP : #YMOVEW=#YKEEP : #ZMOVEW=#ZKEEP

%CALL=NOMOTION


%IF #MACRO=37 @NOTZ ; exclude old thread mill
%IF MILLMODE=0 @NOTZ
%IF #TOOLCHANGE=0 @CHECK

* Check if milling RAT is Z only
* On which nextzmove usage is unwanted
%IF #MOVE<>4 @NOTZ
%IF #HOLECYCLE=1 @NOTZ
* Force current Z
* And redo nomotion with reset nKEEP
#XKEEP=#XMOVEW : #YKEEP=#YMOVEW : #ZKEEP=#ZMOVEW
#XMOVE=XMOVE : #YMOVE=YMOVE : #ZMOVE=ZMOVE

@DOTURN2

%CALL=NOMOTION

#BADNULL=0

@NOTZ

%IF #TOOLCHANGE=0 @CHECK
%IF #HOLECYCLE=1 @NOTBAD
%IF #BADNULL=1 @CHECK
@NOTBAD
%IF #FORCEAFTERTC=1 @CHECK2
@CHECK
%IF #MOVE=0 @END
@CHECK2


@COMP
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ

* Allow compensation Off on rapid retracts
* Dependent on machine parameter
%IF #RAPIDCOMP=0 @NOG40
%IF SUBFUNCT<>2 @NOG40
%IF #COMPON=0 %THEN $COMPOUTPUT=TRUE
#LEADOUTCOUNT=#LEADOUTCOUNT-1  ;countdown to G40 for profile cycle
%CALL=CRC_HANDLER
@NOG40

%IF #TOOLCHANGE=1 @AFTER

%CALL=CODECON_RAPID-MOVE
%GOTO @END

@AFTER
* Keep current Z for THIZMOVE token
#THISZMOVE=ZCPL
%IF RAPID3D=0 @NO3D
%IF #HOLECYCLE=1 %THEN #THISZMOVE=ZCLEAR
@NO3D
*Set CPL Parameters
* 28/10/10
* %IF MILLMODE=0 @NOCPL
* %IF #ROTROTFLAG=1 @NOCPL ; No reset for rotary rotate
* %IF FIVEAXIS=1 @NOCPL ; No reset for 5 axis
* %GETCPL=#CURRENTCPL  ; 16/07 w65593
@NOCPL
%IF #3DAFTERTC=1 %THEN %CALL=CODECON_RA-AFTER-TOOLCHANGE:%GOTO @G43DONE
* Output G43 on first Z
#TEMP=#MOVE
%IF #TEMP>16 %THEN #TEMP=#TEMP-16 ; Remove rotary
%IF #TEMP>8 %THEN #TEMP=#TEMP-8
%IF #TEMP<4 %THEN %CALL=CODECON_RAPID-MOVE:%GOTO @END
* Z Component in move
%CALL=CODECON_Z-AFTER-TC-RAPID

@G43DONE
#TOOLCHANGE=0


@END

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*
%PROCEDURE=PT_SPEED_LOOKAHEAD
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SPEED_LOOKAHEAD:%CALL=ENTER_PROCEDURE
*Look ahead
%IF #LOOKAHEAD=1 @LOOK ; First Rapid, default
%IF #LOOKAHEAD=0 @END ; Never
* #LOOKAHEAD=2 Last Rapid
%IF NEXTMACRO=1 @END

@LOOK
#SPEED=NEXTSPEED
%IF NEXTSPEED=#FUNNY %THEN #SPEED=SPEED
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*

%PROCEDURE=PT_SPEED_WARN
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SPEED_WARN:%CALL=ENTER_PROCEDURE

%IF #DIRECTION=#DIRECTIONHOLD2 @END
*
%IF NEXTMACRO=101 @END                     ;Spindle Direction
%IF NEXTMACRO=110 @END                     ;Gear Select
%IF NEXTMACRO=15 @END                      ;Tool Change

@WARN
%IF #DIRECTION<>DATA2(4) @END2
%IF TOOLTYPE=18  @END ; Probe tool, no spindle movement
$WARNING="Warning - Spindle is Not Running":%CALL=CODECON_WARNING
*
@END2
#DIRECTIONHOLD2=#DIRECTION
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*

%PROCEDURE=PT_SPEED_SET
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SPEED_SET:%CALL=ENTER_PROCEDURE
* procedure to set and check spindle speed
#SPEED=SPEED
%IF SPEED=#FUNNY %THEN #SPEED=NEXTSPEED

* Note following IFs ordered for efficient processing
%IF #MACRO=2 @MAC2 ; Feed
%IF #MACRO=53 @MAC54_53 ; Arc
%IF #MACRO=54 @MAC54_53 ; Arc
%IF TOOLTYPE=18 @END ; Probe tool, no spindle movement
%IF #MACRO=1 @MAC1 ; Rapid
%IF #MACRO=15 @MAC15 ; Toolchange
%IF #MACRO=252 @MAC252 ; Spindle Control
%IF #MACRO=40 @END ; Move Toolchange
%IF #MACRO=41 @END ; Move Home
%IF #MACRO=9 @DRILL ; Drill
%IF #MACRO=10 @DRILL ; Chipbreak
%IF #MACRO=11 @DRILL ; Ream
%IF #MACRO=13 @DRILL ; Tap
%IF #MACRO=671 @DRILL ; Backbore
%IF #MACRO=672 @DRILL ; Helical
%IF #MACRO=675 @DRILL ; Thread Mill
%IF #MACRO=32 @MAC32 ; Translate
%IF #MACRO=37 @DRILL ; Thread Mill
%IF #MACRO=61 @DRILL ; Drill Cyclesub
%GOTO @NOTSTOP

@MAC2
* %IF #SPEED=#SPEEDHOLD @END ; 01/04
#FEEDWARN=1
%IF #SPINWARN>0 %THEN %CALL=PT_SPEED_WARN
#FEEDWARN=0
%GOTO @NOTSTOP

@MAC1
%CALL=PT_SPEED_LOOKAHEAD
* %IF #SPEED=#SPEEDHOLD @END ; 01/04
%IF #SPINWARN=2 %THEN %CALL=PT_SPEED_WARN
%GOTO @NOTSTOP

@MAC54_53
* %IF #SPEED=#SPEEDHOLD @END ; 01/04
#FEEDWARN=1
%IF #SPINWARN>0 %THEN %CALL=PT_SPEED_WARN
#FEEDWARN=0
%GOTO @NOTSTOP

@MAC32
%CALL=PT_SPEED_LOOKAHEAD
* %IF #SPEED=#SPEEDHOLD @END ; 01/04
%IF #SPINWARN=2 %THEN %CALL=PT_SPEED_WARN
%GOTO @NOTSTOP

@MAC15
%CALL=PT_SPEED_LOOKAHEAD
%GOTO @NOTSTOP2

@MAC252
%CALL=PT_SPEED_LOOKAHEAD
* %IF #SPEED=#SPEEDHOLD @END ; 01/04
%IF #SPINWARN=2 %THEN %CALL=PT_SPEED_WARN
%GOTO @NOTSTOP

@DRILL
* %IF #SPEED=#SPEEDHOLD @END ; 01/04
%IF #SPINWARN>0 %THEN %CALL=PT_SPEED_WARN

@NOTSTOP
%IF #SPEED=#SPEEDHOLD @END
@NOTSTOP2
%CALL=PT_GEAR_MCODE

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*
%PROCEDURE=PT_OUTPUT_FEED				;	Called for all feedrate motion.
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_FEED:%CALL=ENTER_PROCEDURE
#GCODE=DATA1(2)


* Fix for thread mill lead out
%IF SUBFUNCT=0 @CONTINUE ; Not Set
%IF #MACRO=37 @THREAD_MILL

%IF SUBFUNCT=2 @OFF
* Comp On
$COMPOUTPUT=FALSE
%IF #COMPON=0 %THEN $COMPOUTPUT=TRUE
%GOTO @CONTINUE

@OFF
* Comp Off
%IF #COMPON=0 %THEN $COMPOUTPUT=TRUE
#LEADOUTCOUNT=#LEADOUTCOUNT-1  ;countdown to G40 for profile cycle
%GOTO @CONTINUE

* Fix for thread mill lead out, Thread mill always sets SUBFUNCT to 1
@THREAD_MILL
%IF #THREADMOVE<>2 @CONTINUE
%IF #COMPON=1 %THEN $COMPOUTPUT=FALSE

@CONTINUE


* Disabled indefinitely - see W61121.
* %IF #MACRO<>2 @NOTFEED
* %IF #4002ACTIVE=1 %THEN %CALL=PT_BREAK_MOVE
* @NOTFEED

%CALL=NOMOTION

%IF #TOOLCHANGE=0 @CHECK
%IF #FORCEAFTERTC=1 @CHECK2
@CHECK
%IF #MOVE=0 @END
@CHECK2


@COMP
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ

* Checks for CRC
%IF $COMPOUTPUT=TRUE @NO_COMP


%IF #MOVE<>4 @CALL

* W31914 DCODE always suppressed. Now GCODE is also suppressed
* This could have an NCStyle switch but is it needed?
#COMPDCODE=#FUNNY
%IF #COMPGCODE<>DATA1(20) %THEN #COMPGCODE=#FUNNY ; G41/42 held
%GOTO @NO_COMP  ;Never on Z only move, hold for next move

@CALL
%CALL=CRC_HANDLER

@NO_COMP

*	Output Feed move
#COMPTEMP=#COMPDCODE
%IF #COMPGCODE=DATA1(21) @OUTPUT
%IF #COMPGCODE=DATA1(22) @OUTPUT
#COMPDCODE=#FUNNY


@OUTPUT
%IF #TOOLCHANGE=1 @AFTER
%CALL=CODECON_LINEAR-INTERPOLATION
%GOTO @MVCHECK

@AFTER
%IF #3DAFTERTC=1 %THEN %CALL=CODECON_FE-AFTER-TOOLCHANGE:%GOTO @G43DONE
* Output G43 on first Z
#TEMP=#MOVE
%IF #TEMP>16 %THEN #TEMP=#TEMP-16 ; Remove rotary
%IF #TEMP>8 %THEN #TEMP=#TEMP-8
%IF #TEMP<4 %THEN %CALL=CODECON_LINEAR-INTERPOLATION:%GOTO @MVCHECK
* Z Component in move
%CALL=CODECON_Z-AFTER-TC-FEED


@G43DONE
#TOOLCHANGE=0

@MVCHECK
%IF #MOVE=4 %THEN #COMPDCODE=#COMPTEMP

*	Cancel cutter compensation via CodeCon_cancel-cutter-comp
*	Code Constructor must be empty if output is with move otherwise blank block will be produced

@END

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*

%PROCEDURE=CRC_HANDLER
%IF #PROCTRACE=1 %THEN $PROCEDURE=CRC_HANDLER:%CALL=ENTER_PROCEDURE

* Handles cutter compensation in all situations
*  #COMPON signals the state requested by the cycle
*  Subfunct signals state for this move
*  $COMPOUTPUT signals whether it has been output

*****************************
*	Profile Cycle			*
*****************************

%IF #THREADMOVE=1 @LEAD_IN			;	Apply cutter comp during first valid thread mill move
%IF #THREADMOVE=2 @LEAD_OUT			;	Cancel cutter comp during last valid thread mill move
%IF #MACRO=37 @END

* IF SUBFUNCT=0 @END                     ; Not lead move
%IF SUBFUNCT=1 @LEAD_IN				;	Apply cutter comp during 90 degree lead in move
%IF SUBFUNCT=2 %THEN %CALL=PT_LEAD_OUT	;	Start count down to cancel cutter compensation during lead out
%IF #LEADOUTCOUNT=1 @LEAD_OUT			;	Processing 90 degree (last) move in lead out sequence
%IF #LEADOUTCOUNT=#FUNNY @LEAD_IN
%IF #LEADOUTCOUNT>1 @END

%IF #COMPGCODE=DATA1(20) @LEAD_OUT	;	Cancel comp (G40)
%IF $COMPOUTPUT=TRUE @END
%IF #COMPON=0 @LEAD_OUT

@LEAD_IN

*********************************************
*	Handles apply compensation in all cases	*
*********************************************
#COMPMODE=1

*	Retrieve original compensation Gcode
#COMPGCODE=#COMPGCODEHOLD

*	Retrieve current compensation Dcode (register)
#COMPDCODE=#COMPDCODEHOLD
%CANCEL=#COMPDCODE

%IF $COMPOUTPUT=TRUE @ONE
%CALL=PT_CHECK_LEAD
%CALL=CODECON_CUTTER-COMPENSATION

$COMPOUTPUT=TRUE			;	Avoid multiple output calls until Comp Cancelled / Suspended
@ONE
#THREADMOVE=0
%GOTO @END


@LEAD_OUT

*************************************************
*	Handles cancel compensation in all cases	*
*************************************************
#COMPMODE=0
*	Set Cancel GCode
#COMPGCODE=DATA1(20)
*		Output is from motion procedure since is either with or after move
* Call codecon for machines needing separate G40 block
%IF $COMPOUTPUT=TRUE @TWO
%CALL=PT_CHECK_LEAD
%CALL=CODECON_CANCEL-CUTTER-COMP
$COMPOUTPUT=TRUE
@TWO
#LEADOUTCOUNT=0

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*
*	Reverse G41/G42 if processing mirror image longhand
*
%PROCEDURE=PT_REVERSE_COMP_MIRROR
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_REVERSE_COMP_MIRROR:%CALL=ENTER_PROCEDURE

*	After Mirror, Compensation may be cancelled due to final Rapid.  Need to retrieve last
*	active Comp GCode.
*	reverse G41/G42 is processing mirror image
*
%IF #COMPGCODE=DATA1(21) %THEN #COMPGCODE=DATA1(22):%GOTO @FINISH
%IF #COMPGCODE=DATA1(22) %THEN #COMPGCODE=DATA1(21)

@FINISH
#COMPGCODEHOLD=#COMPGCODE


%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = ARC_NEG_ZERO         ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=ARC_NEG_ZERO
%IF #PROCTRACE=1 %THEN $PROCEDURE=ARC_NEG_ZERO:%CALL=ENTER_PROCEDURE

* This procedure is to trap variables which when formatted are output as -0
%IF UNIT=0 %THEN #NEGINCR=-.00009 %ELSE #NEGINCR=-.0009
%IF #IVALUE>0 @J
%IF #IVALUE>#NEGINCR %THEN #IVALUE=0
@J
%IF #JVALUE>0 @K
%IF #JVALUE>#NEGINCR %THEN #JVALUE=0
@K
%IF #KVALUE>0 @END
%IF #KVALUE>#NEGINCR %THEN #KVALUE=0
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_OUTPUT_ARC        ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_OUTPUT_ARC
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_ARC:%CALL=ENTER_PROCEDURE

%CALL=ARC_NEG_ZERO
%IF #MACRO=37 %THEN %CALL=NOMOTION
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ

* Suppress COMPDCODE if no COMPGCODE
#COMPTEMP=#COMPDCODE
%IF #COMPGCODE=DATA1(21) @DCODE
%IF #COMPGCODE=DATA1(22) @DCODE
#COMPDCODE=#FUNNY
@DCODE

* Suppress too small moves in single quad case only
%IF CIRCLE<>1 %THEN %GOTO @CARRY-ON
%IF #MOVE=0 @END

@CARRY-ON
*	Radial Rotary Arcs output via Procedure=Radial_circle
%IF #ROTARYTYPE=2 @PLANAR		;	Rotary machine which requires unwrapped output
%IF $PLANAR=NO @END				;	Processing rotary arc
*	Process planar arc
@PLANAR
*
*
@OUTPUT
%CALL=CODECON_2D_CIRCULAR

@END
* Reset CRC Register
#COMPDCODE=#COMPTEMP
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;
;
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_OUTPUT_HELIX   ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_OUTPUT_HELIX
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_HELIX:%CALL=ENTER_PROCEDURE

%CALL=ARC_NEG_ZERO
%IF #MACRO=37 %THEN %CALL=NOMOTION
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ

* Suppress COMPDCODE if no COMPGCODE
#COMPTEMP=#COMPDCODE
%IF #COMPGCODE=DATA1(21) @DCODE
%IF #COMPGCODE=DATA1(22) @DCODE
#COMPDCODE=#FUNNY
@DCODE

* Suppress too small moves in single quad case only
%IF CIRCLE<>1 %THEN %GOTO @CARRY-ON
%IF #MOVE=0 @END

@CARRY-ON
*	Radial Rotary Arcs output via Procedure=Radial_circle
%IF #ROTARYTYPE=2 @PLANAR		;	Rotary machine which requires unwrapped output
%IF $PLANAR=NO @END				;	Processing rotary arc
*	Process planar arc
@PLANAR
*
*
@OUTPUT
%CALL=CONTROL_HELICAL

@END
* Reset CRC Register
#COMPDCODE=#COMPTEMP
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;
;

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = CIRCLE               ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=CIRCLE
%IF #PROCTRACE=1 %THEN $PROCEDURE="CIRCLE":%CALL=ENTER_PROCEDURE

#FULLARCNOW=0
* Set flag for 360 degree arc
%IF INCANGLE=0 %THEN #FULLARCNOW=1 : %GOTO @PITCH0
%IF INCANGLE=360 %THEN #FULLARCNOW=1 : %GOTO @PITCH0
* Fluctuate angle around angular precision as well
#TEMPROUND=INCANGLE+#ANGINCR
%CALL=PT_ROUND_ANGLE
%IF #TEMPROUND=360 %THEN #FULLARCNOW=1 : %GOTO @PITCH0
#TEMPROUND=INCANGLE-#ANGINCR
%CALL=PT_ROUND_ANGLE
%IF #TEMPROUND=360 %THEN #FULLARCNOW=1

@PITCH0
%IF PITCH=0 %THEN PITCH=#FUNNY
* Adjust Feedrate if required
#FEED=FEED
%IF FEEDADJUSTED=1 @ALREADY  ; Adjusted by Thread Mill Cycle
%IF #ADJARCFEED=1 %THEN %CALL=PT_COMP_ARC_FEED
@ALREADY

#XMOVE=XEND ; Set move to arc end
#YMOVE=YEND
#ZMOVE=ZEND


%CALL=NOMOTION

*
* Check for null move
%IF INCANGLE=0 @NOTNULL
%IF INCANGLE>10 @NOTNULL
%IF #MOVE>0 @NOTNULL
; Null arc detected
%IF #TRMODE=1 %THEN <Null Circular Arc Detected #MOVE=[#MOVE=13] INCANGLE=[INCANGLE=13]>
%GOTO @END ; No movement
*
@NOTNULL
* Setvar^#USERADS^Use Radius: 0 Never, 1 When Possible, 2 When Possible (XY), 3 Always, 4 Always except 360
#USERADSKEEP=#USERADS
%IF #USERADS<>2 @CONTINUE
* Use rads if XY plane only
%IF XYPLANE=0 %THEN #USERADS=1 %ELSE #USERADS=0 ; Will reset at end

@CONTINUE
* Check CRC lead conditions
$COMPOUTPUT=TRUE
%IF SUBFUNCT=0 @CRC2
%IF SUBFUNCT=1 @SF1

@SF2
* Lead Out
%IF #COMPON=1 %THEN $COMPOUTPUT=FALSE
#LEADOUTCOUNT=#LEADOUTCOUNT-1
%GOTO @CRC

@SF1
* Lead in
%IF #COMPON=1 %THEN $COMPOUTPUT=FALSE
@CRC

@CRC2
* Set plane G code
#PLANEGCODE=13+XYPLANE
#PLANEGCODE=DATA1(#PLANEGCODE)

%IF XYPLANE=0 %THEN %GOTO @OUTPUT
%IF XYPLANE=2 @G19

%IF #G18SWAP=0 %THEN %GOTO @OUTPUT
%GOTO @ARCSWAP
@G19
%IF #G19SWAP=0 %THEN %GOTO @OUTPUT

@ARCSWAP
#TMP=DATA1(4)+DATA1(3)
#GCODE=#TMP-#GCODE	;Reverse G02/G03

@OUTPUT
* <INCANGLE=[INCANGLE=13]>
#INCANGLE=INCANGLE


@CHECKRAD

* < Set Centre>
%CALL=PT_ARC_CENTRE
#ABSRADIUS=ABS(RADIUS) ; Used in TNC centre correction

%IF #USERADS=0 @IJK ; Never
%IF #USERADS=3 @SETRAD    ; Always

* Check for full circle (0 or 360)
%IF #FULLARCNOW=1 @IJK	;I&J forced 360 arc move

%IF #USERADS=4 @SETRAD  ; Always except 360

%IF PITCH<>#FUNNY  @IJK ;I&J forced for helix
%IF #OUTPUTRADS=0 @IJK ;I&J forced by logic e.g. 360 arc move

@SETRAD
* <SETRAD>
#IVALUE=#FUNNY:#JVALUE=#FUNNY:#KVALUE=#FUNNY ;Radius output
* Set Radius Sign & precision
#RADIUS=#ABSRADIUS
#RADIUS=#RADIUS/RESOLUTION
#RADIUS=#RADIUS+0.5
#RADIUS=INT(#RADIUS)
#RADIUS=#RADIUS*RESOLUTION
*
%IF #NEGRAD180=0 @NOTNEG
* Round angle
#TEMPROUND=#INCANGLE
%CALL=PT_ROUND_ANGLE
#INCANGLE=#TEMPROUND
%IF #INCANGLE>180 %THEN #RADIUS=#RADIUS*-1 ; Negate Radius
%IF #INCANGLE=0 %THEN #RADIUS=#RADIUS*-1   ; Full Circle

@NOTNEG
%IF #CENTREFIX=1 @OUTPUTARC
*
* Radius bulge check
%CALL=RADIUS_ROUNDED_CENTRE
%IF #OUTPUTRADS=1 @OUTPUTARC ; Centre OK

@IJK
* <Set IJK>
#RADIUS=#FUNNY
%CALL=PT_ARC_IJK

@OUTPUTARC
* <OUTPUT>
* Check centre accuracy and correct
%CALL=CENTRE_TOL

%IF #FULLARCXYZ=0 @OUTPUTARC2
%IF #FULLARCNOW=0 @OUTPUTARC2
* XYPLANE is set as 0, 1 and 2 for XY, ZX and ZY respectively
%IF XYPLANE=0 %THEN %CANCEL=#XMOVE,#YMOVE:%GOTO @OUTPUTARC2
%IF XYPLANE=1 %THEN %CANCEL=#XMOVE,#ZMOVE:%GOTO @OUTPUTARC2
%IF XYPLANE=2 %THEN %CANCEL=#YMOVE,#ZMOVE

@OUTPUTARC2
* Apply user defined axis reversals
%CALL=PT_REVERSE_XYZ_ARC
*
%IF $COMPOUTPUT=FALSE %THEN %CALL=CRC_HANDLER
%IF PITCH=#FUNNY @OUTARC
* Helix
@PITCH
#TMP=PITCH
%IF #NOPITCH=1 %THEN #TMP=#FUNNY
* ZEND set for G17 helical arcs. G18/9 not set because of DEV00011313
* <XYPLANE= [XYPLANE=0]>
%IF XYPLANE=0 %THEN #KVALUE=#TMP*#ZREVERSE:#ZCENTRE=#FUNNY:%GOTO @OUTPUTHELIX ;XY
%IF XYPLANE=1 %THEN #JVALUE=#TMP*#YREVERSE:#YCENTRE=#FUNNY:%GOTO @OUTPUTHELIX ;XZ
%IF XYPLANE=2 %THEN #IVALUE=#TMP*#XREVERSE:#XCENTRE=#FUNNY ;YZ

@OUTPUTHELIX
%CALL=PT_OUTPUT_HELIX
%GOTO @RESET

@OUTARC
%CALL=PT_OUTPUT_ARC

@RESET
#USERADS=#USERADSKEEP
#OUTPUTRADS=#USERADS				;Reset
#LEADOUTCOUNT=#LEADOUTCOUNT-1		;Countdown to cancel crc for profile

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=RADIUS_ROUNDED_CENTRE
%IF #PROCTRACE=1 %THEN $PROCEDURE="RADIUS_ROUNDED_CENTRE":%CALL=ENTER_PROCEDURE

#OUTPUTRADS=1  ; Default to OK
%IF #USERADS=3 @END ; Always Radius, TNC etc.
%IF #FULLARCNOW=1 @END
%IF INCANGLE<300 @END

* Check accuracy of centre point
%IF XYPLANE=0 @G17
%IF XYPLANE=1 @G18
@G19
#XTEMP1=#YSTART
#XTEMP2=#YMOVE
#YTEMP1=#ZSTART
#YTEMP2=#ZMOVE
#TEMPXCENTRE=#YCENTRE
#TEMPYCENTRE=#ZCENTRE
%GOTO @READY

@G18
#XTEMP1=#XSTART
#XTEMP2=#XMOVE
#YTEMP1=#ZSTART
#YTEMP2=#ZMOVE
#TEMPXCENTRE=#XCENTRE
#TEMPYCENTRE=#ZCENTRE
%GOTO @READY

@G17
#XTEMP1=#XSTART
#XTEMP2=#XMOVE
#YTEMP1=#YSTART
#YTEMP2=#YMOVE
#TEMPXCENTRE=#XCENTRE
#TEMPYCENTRE=#YCENTRE

@READY

#XDIST=#XTEMP2-#XTEMP1
#TMP1=#XDIST*#XDIST
#YDIST=#YTEMP2-#YTEMP1
#TMP2=#YDIST*#YDIST

#CHORD=#TMP1+#TMP2
#CHORD=SQR(#CHORD)
#CHORD=#CHORD/2

* <* 1/2CHORD = [#CHORD=0] Rad [#RADIUS=0]>
#TMP1=#RADIUS*#RADIUS
#TMP2=#CHORD*#CHORD

%IF #YDIST=0 %THEN #ANG1=90 %ELSE #ANG1=#XDIST/#YDIST:#ANG1=ATAN(#ANG1)
#ANG1=90+#ANG1

#LEN=#TMP1-#TMP2
#LEN=ABS(#LEN):#LEN=SQR(#LEN)

#XDIST2=SIN(#ANG1):#XDIST2=#XDIST2*#LEN
#YDIST2=COS(#ANG1):#YDIST2=#YDIST2*#LEN
#XDIST=#XDIST/2
#YDIST=#YDIST/2

#XDIST=ABS(#XDIST):#XDIST2=ABS(#XDIST2)
#YDIST=ABS(#YDIST):#YDIST2=ABS(#YDIST2)

%IF #XTEMP1>#XTEMP2 %THEN #XDIST=#XDIST*-1
%IF #YTEMP1>#YTEMP2 %THEN #YDIST=#YDIST*-1

#XROUNDCENTRE=#XTEMP1+#XDIST
#YROUNDCENTRE=#YTEMP1+#YDIST

%IF #XROUNDCENTRE>#TEMPXCENTRE %THEN #XDIST2=#XDIST2*-1
%IF #YROUNDCENTRE>#TEMPYCENTRE %THEN #YDIST2=#YDIST2*-1

#XROUNDCENTRE=#XROUNDCENTRE+#XDIST2
#YROUNDCENTRE=#YROUNDCENTRE+#YDIST2
#XCENTREERROR=#TEMPXCENTRE-#XROUNDCENTRE:#XCENTREERROR=ABS(#XCENTREERROR)
#YCENTREERROR=#TEMPYCENTRE-#YROUNDCENTRE:#YCENTREERROR=ABS(#YCENTREERROR)

* Force IJK if calculated centre out of position
%IF #XCENTREERROR>RESOLUTION %THEN #OUTPUTRADS=0
* <******  RADIUS AXIS CENTRE ERROR [#XCENTREERROR=0]   - TRUE CENTRE [#TEMPXCENTRE=0] ROUNDED CENTRE [#XROUNDCENTRE=0]>
%IF #YCENTREERROR>RESOLUTION %THEN #OUTPUTRADS=0
*<******  RADIUS AXIS CENTRE ERROR [#YCENTREERROR=1]   - TRUE CENTRE [#TEMPYCENTRE=1] ROUNDED CENTRE [#YROUNDCENTRE=1]>

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



***************************************************************************

%PROCEDURE=PT_ARC_TURN_BRG_HH
*Set up parameters and call standard procedure to
*calculate angle bearings for TNC helical arc moves
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ARC_TURN_BRG_HH:%CALL=ENTER_PROCEDURE


* DEV00012570 undo previous change to correct thread mill regression
%IF #MACRO=37 @THREADMILL
* #RADIUS=ABS(RADIUS)
#INCANGLE=ABS(INCANGLE)
%GOTO @NOTHREAD

@THREADMILL
* Set arc parameter system variables
XSTART=#XHOLD
YSTART=#YHOLD
ZSTART=#ZHOLD
XCENTRE=#XCENTRE
YCENTRE=#YCENTRE
ZCENTRE=#ZCENTRE
XEND=#XSTOREABS*#XREVERSE
YEND=#YSTOREABS*#YREVERSE
ZEND=#ZSTOREABS*#ZREVERSE
* #RADIUS=ABS(#STARTRAD)

%CALL=PT_ARC_TURN_BRG; Sets start angle and possibly other values
* Multiple turns, Note that complete circle can have included angle of 0 or 360
%IF #INCANGLE=0 %THEN #INCANGLE=360
%IF #MACRO<>37 @NOTHREAD
* Thread Mill, multiple turn arc has only 0-360 included angle, derive from pitch and Z move
* ZSTART ZEND are not available in thread milling
#TURNS=#HELIXCOUNT
#HELIXCOUNT=0
%IF #THREADSINGLE=0 @END
* Check for last helix full 360 degrees
%IF #XMOVE<>#XHOLD %THEN #TURNS=#TURNS-1:%GOTO @CONTINUE2
%IF #YMOVE<>#YHOLD %THEN #TURNS=#TURNS-1:%GOTO @CONTINUE2
%GOTO @CONTINUE2


@NOTHREAD
%IF XYPLANE=0 %THEN #TURNS=ZEND-ZSTART:%GOTO @TURNS
%IF XYPLANE=1 %THEN #TURNS=YEND-YSTART:%GOTO @TURNS
#TURNS=XEND-XSTART

@TURNS
#TURNS=#TURNS/PITCH
#TMP=ABS(#TURNS)
#TURNS=INT(#TMP)

@CONTINUE2
%IF #TURNS=0 @END
#TMP=#TURNS*360
#INCANGLE=#INCANGLE+#TMP
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=PT_ARC_TURN_BRG			;	Calculate the angle between start and end positions.
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ARC_TURN_BRG:%CALL=ENTER_PROCEDURE
* Still needed for thread milling
*
%IF XYPLANE=0 %THEN #XINC=XSTART-XCENTRE:#YINC=YSTART-YCENTRE:%GOTO @MARK
%IF XYPLANE=1 %THEN #XINC=XSTART-XCENTRE:#YINC=ZSTART-ZCENTRE:%GOTO @MARK
%IF XYPLANE=2 %THEN #XINC=YSTART-YCENTRE:#YINC=ZSTART-ZCENTRE

@MARK
#BEARING=#YINC
#RADIUS2=ABS(#STARTRAD)
************* NEED TO USE XINC.YINC IN ASIN_BEARING
%CALL=ASIN_BEARING:#BEARING1=#BEARING
%IF XYPLANE=0 %THEN #XINC=XEND-XCENTRE:#YINC=YEND-YCENTRE:%GOTO @MARK2
%IF XYPLANE=1 %THEN #XINC=XEND-XCENTRE:#YINC=ZEND-ZCENTRE:%GOTO @MARK2
%IF XYPLANE=2 %THEN #XINC=YEND-YCENTRE:#YINC=ZEND-ZCENTRE

@MARK2
#BEARING=#YINC
#RADIUS2=#ENDRAD
%CALL=ASIN_BEARING:#BEARING2=#BEARING
@CALC_ANGLE

%IF XYPLANE<>1 @NORMAL
%IF #GCODE=DATA1(3) %THEN #INCANGLE=#BEARING2-#BEARING1 %ELSE #INCANGLE=#BEARING1-#BEARING2
%GOTO @FIN_INCLUDE
@NORMAL
%IF #GCODE=DATA1(4) %THEN #INCANGLE=#BEARING2-#BEARING1 %ELSE #INCANGLE=#BEARING1-#BEARING2
@FIN_INCLUDE

%IF #INCANGLE<=0.000001 %THEN #INCANGLE=#INCANGLE+360  		;If less than zero then add 360 degrees
#BEARING=#INCANGLE

*Double check for 360 case
%IF #INCANGLE<359 @END
%IF XSTART<>XEND @END
%IF YSTART<>YEND @END
%IF ZSTART<>ZEND @END
* Full circle
#INCANGLE=360

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=ASIN_BEARING
%IF #PROCTRACE=1 %THEN $PROCEDURE=ASIN_BEARING:%CALL=ENTER_PROCEDURE
#BEARING=#BEARING/#RADIUS2
#BEARING=ASIN(#BEARING)
%IF #YINC=>0 @QUAD_CHECK_X
%IF #XINC>0 %THEN #BEARING=360+#BEARING;:<* QUAD 4>
%IF #XINC=<0%THEN #BEARING=180-#BEARING;:<* QUAD 3>
%GOTO @QUAD_CHECK_OVER
@QUAD_CHECK_X
%IF #XINC<0 %THEN #BEARING=180-#BEARING;:<* QUAD 2> %ELSE <* QUAD 1>
@QUAD_CHECK_OVER

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_COMP_ARC_FEED     ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_COMP_ARC_FEED
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_COMP_ARC_FEED:%CALL=ENTER_PROCEDURE

*	*************************************************
*	Compensate feedrates for arcs if option selected
*	*************************************************
*
%IF LEFTRIGHT=#FUNNY @END
%IF LEFTRIGHT<0 @END ; Trap invalid result from optimised profiling
*
#FEED=FEED
%IF XYPLANE<>0 @END ; Don't adjust arc in the XZ / YZ planes
*  #TMP=ABS(RADIUS):%IF #TMP=TOOLRAD @END				;	Avoid division by zero for Faster

%IF #MIRROR=1 %THEN #RADIUS=RADIUS*-1 %ELSE #RADIUS=RADIUS
%IF #RADIUS<0 @CLW
%IF LEFTRIGHT=0 %THEN %GOTO @FASTER %ELSE %GOTO @SLOWER
@CLW
%IF LEFTRIGHT=1 %THEN %GOTO @FASTER %ELSE %GOTO @SLOWER

*	External Corners
@FASTER
#TMP=XYFEED*#MAXFEEDADJ
#TMP1=ABS(RADIUS)
#TMP2=#TMP1
%IF PATHTRACE=1 %THEN #TMP1=#TMP1-TOOLRAD:%GOTO @CONTROL_FASTER
%IF #COMPON=0 %THEN #TMP1=#TMP1-TOOLRAD:%GOTO @CONTROL_FASTER
#TMP2=#TMP2+TOOLRAD
@CONTROL_FASTER
* Following check safer in two lines because of precision checking
%IF #TMP1=0 %THEN #FEED=XYFEED:%GOTO @END		;Check to see if machining small arc with large tool i.e. calc results in -ve value
%IF #TMP1<0 %THEN #FEED=XYFEED:%GOTO @END		;Check to see if machining small arc with large tool i.e. calc results in -ve value
#FEED=(#TMP2/#TMP1)*XYFEED

%IF #FEED>#TMP %THEN #FEED=#TMP	;	If result is outside adjustment percentage then use upper limit
%GOTO @END

*	Internal Corners
@SLOWER
#TMP=XYFEED*#MINFEEDADJ
#TMP1=ABS(RADIUS)
#TMP2=#TMP1
%IF PATHTRACE=1 %THEN #TMP1=#TMP1+TOOLRAD:%GOTO @CONTROL_SLOWER
%IF #COMPON=0 %THEN #TMP1=#TMP1+TOOLRAD:%GOTO @CONTROL_SLOWER
#TMP2=#TMP2-TOOLRAD
@CONTROL_SLOWER
#FEED=(#TMP2/#TMP1)*XYFEED

%IF #FEED<#TMP %THEN #FEED=#TMP   ;	If result is outside adjustment percentage then use upper limit

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_HOLE_CYCLES       ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=PT_HOLE_CYCLES
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_HOLE_CYCLES:%CALL=ENTER_PROCEDURE

*	Output all Hole cycles Drill, Chipbreak, Ream and Bore as Canned Cycles - coords are held in the XYZPOINT array
*   Called from each cycle macro and cyclsub for subroutines
*	Code Wizard will present the cycle definition line which will be in the loop expand and thus output-if-changed
*	will, typically, produce the XY points list previously separated into PROCEDURE=LOOPEXPAND
*   If called from CYCLSUB, points are expanded from 2nd point (Loop=2)- cycle line is outside subroutine.
*	This inhibits the ability to support the format whereby the cycle parameters are variables e.g. Seimens
*

%IF #TRHOLE<>1 @JUMP

************  Diagnostic printout
< >
<* Hole Cycle Parameters>
<* Z Clear=     [ZCLEAR=13]>
<* R Plane=     [RPLANE=13]>
%IF ZLEVEL=#FUNNY %THEN <* Multi-Level-Depth> %ELSE <* Z Level=     [ZLEVEL=13]>
<* Total Depth= [ZDEPTH=13]>
<* Peck Depth=  [DEPTH=13]>
<* Degression=  [DEGR=13]>
%IF MILLMODE=1 %THEN <* Planar Mode> %ELSE <* Rotary Mode>
<* CAXIS=       [CAXIS=13]>
<* ACTIVELINEARAXIS=     [ACTIVELINEARAXIS=13]>
<* ACTIVELINEARAXISSIDE= [ACTIVELINEARAXISSIDE=13]>
< >
<* Array Content>
<* Loop  XPOINT    YPOINT    ZPOINT    MZDEPTH   MRPLANE   PRADIUS   PANGLE>

#LOOP=1
@NEXT2
#TRX=XPOINT(#LOOP):#TRY=YPOINT(#LOOP):#TRZ=RADIUS(#LOOP)
#TRDEPTH=MZDEPTH(#LOOP)
#TRPLANE=MRPLANE(#LOOP)
#TRRADIUS=PRADIUS(#LOOP)
#TRANGLE=PANGLE(#LOOP)
<* [#LOOP=14]     [#TRX=12][#TRY=12][#TRZ=12][#TRDEPTH=12][#TRPLANE=12][#TRRADIUS=12][#TRANGLE=12]>
#LOOP=#LOOP+1
%IF #LOOP<=LAST @NEXT2
< >
************

@JUMP
* Status Flags in use
#HOLECYCLE=1  ; Processing a hole cycle
#EMULATION=0 ;

* Option flags in use
* #XREVERSE,#YREVERSE,#ZREVERSE Axis reversals
* $OUTPUTSUBS
* #ROTARYTYPE=2  1 for
* MILLMODE  0 for rotary, 1 for planar
* #TOOLCHANGE =1 if previous instruction was toolchange
* #PREPOSITION: 0 never; 1 Always; 2 After Tool Change


* Keep move parameters
#FEEDMODEGCODEHOLD=#FEEDMODEGCODE
#HCODEHOLD=#HCODE
#COOLHOLD=#COOL
#DIRECTIONHOLD=#DIRECTION

*	Rapid to first XY position then to Zclear with Tool Length Offset.  Call procedure for single Code Constructor
*	Could put this on a switch e.g. Call Rapid After toolchange ?
#LOOP=1
%CALL=PT_GET_HOLE_POSITION ;	First Hole position

%IF $OUTPUTSUBS=TRUE @DEFINE_CYCLE

*************************************************
* <   Approach Moves CPLPLANE=[CPLPLANE=0] Keep [#XKEEP=0][#YKEEP=1][#ZKEEP=2]>
*************************************************

#XAPP=#XMOVE
#YAPP=#YMOVE
#ZAPP=#ZMOVE
#XMOVE=#XKEEP
#YMOVE=#YKEEP

*
* Lift to clearance
%IF CPLPLANE=#FUNNY %THEN CPLPLANE=0
#PREVIOUSHEIGHT=#ZKEEP
%IF MCOORD=0 @LIFT
%IF CPLPLANE=0 @LIFT
%IF CPLPLANE=5 @LIFT
%IF CPLPLANE=1 %THEN #PREVIOUSHEIGHT=#XKEEP:#ZMOVE=#ZKEEP:#YMOVE=#YKEEP:#XMOVE=ZCLEAR:%GOTO @LIFT
%IF CPLPLANE=2 %THEN #PREVIOUSHEIGHT=#XKEEP:#ZMOVE=#ZKEEP:#YMOVE=#YKEEP:#XMOVE=ZCLEAR:%GOTO @LIFT2
%IF CPLPLANE=3 %THEN #PREVIOUSHEIGHT=#YKEEP:#ZMOVE=#ZKEEP:#XMOVE=#XKEEP:#YMOVE=ZCLEAR:%GOTO @LIFT
%IF CPLPLANE=4 %THEN #PREVIOUSHEIGHT=#YKEEP:#ZMOVE=#ZKEEP:#XMOVE=#XKEEP:#YMOVE=ZCLEAR:%GOTO @LIFT2
%IF CPLPLANE=6 @LIFT2
@LIFT
* <LIFT #PREVIOUSHEIGHT=[#PREVIOUSHEIGHT=13] ZCLEAR=[ZCLEAR=13]>
%IF #PREVIOUSHEIGHT<ZCLEAR @LIFTNOW
%GOTO @NOLIFT
@LIFT2
* <LIFT2 #PREVIOUSHEIGHT=[#PREVIOUSHEIGHT=13] ZCLEAR=[ZCLEAR=13]>
%IF #PREVIOUSHEIGHT>ZCLEAR @LIFTNOW
%GOTO @NOLIFT
*
@LIFTNOW
%CALL=PT_OUTPUT_RAPID ; Lift clear
%GOTO @NOLIFT2 ; Now at new clearance
*
@NOLIFT
%IF #TOOLCHANGE=1 @NOLIFT2
%IF #PREVIOUSHEIGHT<>ZCLEAR @MOVEXY ; XY move if Clearance reduces
@NOLIFT2
%IF #PREPOSITION=0 @DEFINE_CYCLE
%IF #PREPOSITION=1 @MOVEXY
%IF #TOOLCHANGE=0 @DEFINE_CYCLE

@MOVEXY
* Approach to first point - Rapid in XY
#XMOVE=#XAPP ; Saved approach position
#YMOVE=#YAPP
#ZMOVE=#ZAPP
%IF RAPID3D=1 @CALLRAP
* CHANGE 14/04
%IF #TOOLCHANGE=0 @MOVE2
%IF #3DAFTERTC=1 @CALLRAP
*
@MOVE2
* Not Rapid 3D, maintain clearance axis
%IF MCOORD=0 %THEN #ZMOVE=#ZKEEP:%GOTO @CALLRAP ; W43899
%IF CPLPLANE=0 %THEN #ZMOVE=#ZKEEP:%GOTO @CALLRAP
%IF CPLPLANE=5 %THEN #ZMOVE=#ZKEEP:%GOTO @CALLRAP
%IF CPLPLANE=1 %THEN #XMOVE=#XKEEP:%GOTO @CALLRAP
%IF CPLPLANE=2 %THEN #XMOVE=#XKEEP:%GOTO @CALLRAP
%IF CPLPLANE=3 %THEN #YMOVE=#YKEEP:%GOTO @CALLRAP
%IF CPLPLANE=4 %THEN #YMOVE=#YKEEP:%GOTO @CALLRAP
%IF CPLPLANE=6 %THEN #ZMOVE=#ZKEEP

@CALLRAP
#GCODE=0
%CALL=PT_OUTPUT_RAPID

%IF #ZKEEP=ZCLEAR @DEFINE_CYCLE
* Plunge to Clearance, Nomotion will prevent null move
#XMOVE=#XAPP
#YMOVE=#YAPP
#ZMOVE=#ZAPP
%IF #ROTTYPE=3 %THEN #FIRSTANGLE=#FUNNY : #SECONDANGLE=#FUNNY
%CALL=PT_OUTPUT_RAPID

*************************************************
*   DEFINE CYCLE
*************************************************
@DEFINE_CYCLE

#TOOLCHANGE=0
%IF #SUPPORTG98G99=0 %THEN #RETRACTGCODE=#FUNNY					;	Suppress from output if not supported
%IF ZCLEAR=RPLANE %THEN #RETRACTGCODE=DATA1(50) %ELSE #RETRACTGCODE=DATA1(49)	;	G99 / G98

#FEED=ZFEED		;	If tapping then Feed = revs*pitch
%IF $CYCLETYPE=HELICAL %THEN #FEED=XYFEED

#LOOP=1
* Branch on $OUTPUTSUBS.  =null if PATHTRACE expansion
%IF $OUTPUTSUBS<>TRUE @LOOP

* Set HOLD values for incremental calculations in subroutines
#XHOLD=XPOINT(#LOOP)
#YHOLD=YPOINT(#LOOP)
#ZHOLD=ZPOINT(#LOOP)
#LOOP=2 		;	If subroutines, expand from 2nd point

%IF #CYCLEPOINTS<>3 @LOOP

*Include first position in expansion
%IF DRILLSUB<>1 @LOOP
#LOOP=1
%CALL=PT_GET_HOLE_POSITION
*
%CALL=PT_MULTI_LEVEL
%CALL=NOMOTION
#ZDEPTHOUT=#ZDEPTH*#ZREVERSE
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ
#ZLEVEL=#ZLEVEL*#ZREVERSE
#RPLANE=#RPLANE*#ZREVERSE

%CALL=PT_CYCLEPOINTS  ; First point

#LOOP=2
@LOOP
* <******** LOOP START ********* #LOOP=[#LOOP=23] LAST=[LAST=23]
*
*************************************************
* Processing loop for cycle point 2 onwards
*************************************************
*
%IF #LOOP>LAST @ELOOP

%CALL=PT_GET_HOLE_POSITION

%CALL=PT_MULTI_LEVEL

*Check for Zdepth/level change and respecify cycle
#DEPTHCHANGE=0
#CYCLEGCODESAVE=#CYCLEGCODE
%IF #SUPPORTMDEPTH=1 @NOCHANGE      ; True multi-level in use
%IF #LOOP=1 @NOCHANGE
%IF #ZDEPTH<>#ZDEPTHHOLD @CHANGE
%IF #ZLEVELHOLD=#ZLEVEL @NOCHANGE

@CHANGE
#DEPTHCHANGE=1
%IF ZLEVEL<>#FUNNY @NOCHANGE        ; Not needed for constant height
%IF ZCLEAR=RPLANE @NOCHANGE			; Not using return to Initial Level
*	Emulate return to Initial level : G98/G99 not supported
*	Cancel Canned Cycle
#EMULATION=1
#TMP=#CYCLEGCODE
#CYCLEGCODE=DATA1(35)
%CALL=CODECON_CANCEL-CANNED-CYCLE  ; Cancel canned cycle for change
#BEFORECYCLE=0
#CYCLEGCODE=#TMP

*	Rapid to clearance height
%IF #SUPPORTG98G99=1 @NOCHANGE      ; Z move if no G98G99
#GCODE=DATA1(1)
#ZMOVE=ZCLEAR
#XTEMP=#XMOVE
#YTEMP=#YMOVE
#XMOVE=#XHOLD
#YMOVE=#YHOLD
%CALL=NOMOTION
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ
%CANCEL=#GCODE,#ZMOVE
%CALL=CODECON_RAPID-MOVE ; rapid to clearance
#XMOVE=#XTEMP
#YMOVE=#YTEMP

@NOCHANGE
#ZDEPTHHOLD=#ZDEPTH ; Save z Depth
#ZLEVELHOLD=#ZLEVEL ; Save z Level
*
%CALL=NOMOTION
#ZDEPTHOUT=#ZDEPTH*#ZREVERSE
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ
#ZLEVEL=#ZLEVEL*#ZREVERSE
#RPLANE=#RPLANE*#ZREVERSE
*
%IF #DEPTHCHANGE=1 @FORCEG
%IF #LOOP>1 @G81-2
*
* First point or depth change
@FORCEG
#CYCLEGCODE=#CYCLEGCODESAVE
*
%CALL=PT_CYCLDEF 	;	Output CYCLDEF Header
#DEPTHCHANGE=0
%IF DRILLSUB=1 @LOOPEXPAND
%IF #CYCLEPOINTS=3 %THEN %CALL=PT_CYCLEPOINTS
%GOTO @LOOPEXPAND

@G81-2
* Normal cycle point output
%IF #CYCLEPOINTS>1 %THEN %CALL=PT_CYCLEPOINTS:%GOTO @LOOPEXPAND
%CALL=PT_CYCLDEF

@LOOPEXPAND
*  <@LOOPEXPAND  Last=[LAST=0]  DSUB=[DRILLSUB=0] $OUTPUTSUBS=[$OUTPUTSUBS]>

%IF DRILLSUB<>1 @NEXTPOINT		; Output points if not in a subroutine
%IF #CYCLEPOINTS=3 @ALWAYS
%IF LAST=1 @ELOOP 				; Output G80 if only 1 point
@ALWAYS
%IF $OUTPUTSUBS=TRUE @NEXTPOINT
%GOTO @END
@NEXTPOINT

#LOOP=#LOOP+1
%GOTO @LOOP  ;	Load next point

@ELOOP       ;	End canned cycle output

************************************************************

*	G80 Cancel Canned Cycle
%CALL=CODECON_CANCEL-CANNED-CYCLE
#FEEDMODEGCODE=#FEEDMODEGCODEHOLD:#HCODE=#HCODEHOLD:#COOL=#COOLHOLD:#DIRECTION=#DIRECTIONHOLD
* Cycle finishes at ZCLEAR
#ZMOVE=ZCLEAR
* Unless it is machine coordinates
%IF CPLPLANE=5 @JUMP5 ; Aligned with Spindle
%IF CPLPLANE=6 @JUMP5
*%IF #CUBICCOORDS=0 @JUMP5
%IF MCOORD=0 @JUMP5
%IF CPLPLANE=0 @JUMP5 ; Non-orthogonal
* For angled heads and MC coordinates
* XY axes may be XZ or YZ on machine
#TMP=LAST ; load last point
%IF CPLPLANE=1 %THEN #ZMOVE=XPOINT(#TMP) : #XMOVE=ZCLEAR*#XREVERSE : %GOTO @JUMP5
%IF CPLPLANE=2 %THEN #ZMOVE=XPOINT(#TMP) : #XMOVE=ZCLEAR*#XREVERSE : %GOTO @JUMP5
%IF CPLPLANE=3 %THEN #ZMOVE=YPOINT(#TMP) : #YMOVE=ZCLEAR*#YREVERSE : %GOTO @JUMP5
%IF CPLPLANE=4 %THEN #ZMOVE=YPOINT(#TMP) : #YMOVE=ZCLEAR*#YREVERSE
@JUMP5

%CALL=NOMOTION
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ
#ZHOLD=#ZMOVE
<[#ZMOVE=10]>; Initialise
************************************************************

@END
* #HOLECYCLE2 is now used to suppress sub call approach moves
* Set 0 if not using drill subroutines
#HOLECYCLE2=1
* #HOLECYCLE3 is used on move to tc/home to decide between rotary and planar
* Is needed because holes differ from other milling cycles
#HOLECYCLE3=1
#HOLECYCLE=0
@END99
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_CYCLEPOINTS      ÃÄÄÄ
;
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_CYCLEPOINTS
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_CYCLEPOINTS:%CALL=ENTER_PROCEDURE

* Blank null values generally not required
* Except for TNC
%IF $MACHINE="TNC" @CONTINUE
%IF DWELL=0 %THEN DWELL=#FUNNY
%IF #BOREOFFSET=0 %THEN #BOREOFFSET=#FUNNY
%IF #PITCH=0 %THEN #PITCH=#FUNNY
%IF #DEGR=0 %THEN #DEGR=#FUNNY
@CONTINUE

* Detect back cycles
%IF $CYCLETYPE=BACKBORE @BACK
%IF $CYCLETYPE=BACKFACE @BACK
%GOTO @POINTS

@BACK
* BackBore and BackFace may not require cycle points
%IF #BACKPOINTS=1 @POINTS ; use common codecon

* Use cycle definition or dedicated codecon for points
%IF #BACKPOINTS=0 %THEN %CALL=PT_CYCLDEF : %GOTO @END %ELSE %CALL=CODECON_BACK-CYCLEPOINTS : %GOTO @END

@POINTS
%CALL=CODECON_HOLE-CYCLEPOINTS

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_MULTI_LEVEL      ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_MULTI_LEVEL
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_MULTI_LEVEL:%CALL=ENTER_PROCEDURE

%IF ZLEVEL=#FUNNY @MULTI

@SINGLE
#ZLEVEL=ZLEVEL
#ZDEPTH=ZDEPTH
#RPLANE=RPLANE
%GOTO @ZINC

@MULTI
%IF #LOOP>2 @SKIPWARN
%IF $OUTPUTSUBS=TRUE %THEN $WARNING="ERROR - Subroutines not supported for multi-level":#MASKKEEP=MASK:MASK=0:%CALL=CODECON_WARNING:MASK=#MASKKEEP
@SKIPWARN
#ZLEVEL=ZPOINT(#LOOP)
#ZDEPTH=MZDEPTH(#LOOP)
#RPLANE=MRPLANE(#LOOP)

@ZINC
%IF #ZRABSINCR=1 @RPLANE
* Incremental variations
%IF #ZRABSINCR2=1 %THEN #ZDEPTH=#ZDEPTH-ZCLEAR:%GOTO @ZINC2
%IF #ZRABSINCR2=2 %THEN #ZDEPTH=#ZDEPTH-#ZLEVEL:%GOTO @ZINC2
%IF #ZRABSINCR2=3 %THEN #ZDEPTH=#ZDEPTH-#RPLANE

@ZINC2
%IF #ZRABSINCR=3 %THEN #ZDEPTH=ABS(#ZDEPTH)	;	Incremental, Unsigned

@RPLANE
%IF #RTYPE=1 @END
%IF #RTYPE=2 %THEN #RPLANE=#RPLANE-ZCLEAR:%GOTO @END
%IF #RTYPE=3 %THEN #RPLANE=#RPLANE-#ZLEVEL

@END

* Set Hole Depth Offset 13/04/10
#ZLEVEL=#ZLEVEL+#HOLEOFFSET
%IF #RTYPE=1 %THEN #RPLANE=#RPLANE+#HOLEOFFSET
%IF #ZRABSINCR=1 %THEN #ZDEPTH=#ZDEPTH+#HOLEOFFSET

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = DATUM_HOLD           ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=DATUM_HOLD
%IF #PROCTRACE=1 %THEN $PROCEDURE=DATUM_HOLD:%CALL=ENTER_PROCEDURE

%IF #BASETYPE=1 @END ; Increment from Initial
* Set base positions for XSHIFT etc
#XBASE=XSUB
#YBASE=YSUB
#ZBASE=ZSUB

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = SET_TOOLING_DATA      ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=SET_TOOLING_DATA
%IF #PROCTRACE=1 %THEN $PROCEDURE=SET_TOOLING_DATA:%CALL=ENTER_PROCEDURE

#HEADER=1
@STARTLOOP
%LOAD=#HEADER

*	Remove duplicate tools from NC Code tool list
%IF #REMOVEDUPLICATES=0 @MISS_REMOVE_DUPLICATES
#TMP1=0:%CALL=PT_REMOVE_DUPLICATE_TOOLS:%IF #TMP1=1 @SKIP
@MISS_REMOVE_DUPLICATES

%LOAD=#HEADER
%IF TOOLNUM=0 %THEN $TOOLDESCRIPTION=USERDEFINEDSTRING %ELSE $TOOLDESCRIPTION=TOOLDESCRIPTION
%CALL=PT_SET_TLO
%CALL=CODECON_SET-TOOLING-DATA

@SKIP
#HEADER=#HEADER+1:%IF #HEADER>NUMTOOLS @END

%GOTO @STARTLOOP

@END

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = SET_WORK_DATUMS      ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=SET_WORK_DATUMS
%IF #PROCTRACE=1 %THEN $PROCEDURE=SET_WORK_DATUMS:%CALL=ENTER_PROCEDURE

; This procedure will capture all Absolute datum shifts and assign G Codes
;  INDEX            = Pallet angle position
;  GROUPDESCRIPTION = CPL name
;  STYPE            = Coord shift type  ABS = 1  INC = 0
;  ROT1             = Absolute primary angle
;  ROT2             = Absolute secondary angle
;  XSUB             = Absolute X datum origin
;  YSUB             = Absolute Y datum origin
;  ZSUB             = Absolute Z datum origin
;  SYSID            = Unique coord system identifier
;  DIRECTION        = Index direction
;  SUBFUNCT         = current CPL pointer ( used with %GETCPL )

#LOOP=2000
#TEMP=#DATUMMAX+2002
* Initialise array for datum IDs
@INIT
#LOOP=#LOOP+1
%IF #LOOP>#TEMP @DONE
UARRAY1(#LOOP)=-9
* <LOOP[#LOOP=1]>
%GOTO @INIT
@DONE

* Loop to get SYSID from list and store in uarray in order
#LOOP=0
#DATUMMAX=#DATUMMAX+2000
@STARTLOOP
#LOOP=#LOOP+1
#POINTER=2000


%GETCPL=#LOOP
#CURRENTCPL=#LOOP
$CPLNAME=GROUPDESCRIPTION
%IF SYSID=#FUNNY @END ; All datums have been loaded.
* <Loop [#LOOP=0]>
* <ID [SYSID=1]  Stype= [STYPE=1]>
%IF #LOOP=1 @FORCE ; Always assign first datum to ensure G54 setting
%IF STYPE=0 %THEN %GOTO @STARTLOOP	; Datum type is incremental, skip assignment.

@FORCE
%IF STYPE=2 %THEN #TMP=2 %ELSE #TMP=1
#SYSID=SYSID*1000000
%IF #UNIQUEDATUMS=1 %THEN #SYSID=((#SYSID+(ROT1*1000)+ROT2)*#TMP) ; Make Datum unique by XYZ and Rotation

%IF #SYSID=#FUNNY @STARTLOOP

@FIND
#POINTER=#POINTER+1
* <Pointer [#POINTER=1]>
#TEMP=UARRAY1(#POINTER)
%IF #SYSID=#TEMP @STARTLOOP  ; Skip if datum is already assigned.
%IF #POINTER>#DATUMMAX @ERROR
%IF #TEMP<>-9 @FIND
* Unused array element
* <Pointer [#POINTER=1]>
UARRAY1(#POINTER)=#SYSID

@UNIQUE-MPL

* Option to output first Datum (G54) as XYZHOME location
%IF #LOOP=1 %THEN %CALL=PT_OUTPUT_G54_TO_TABLE_CENTRE

#XSUB=XSUB:#YSUB=YSUB:#ZSUB=ZSUB


#COORDNUM=#POINTER-2000
#WORKGCODE=#DATUMSTART+(#DATUMINCR*#COORDNUM)
#DYNAMIC=#WORKGCODE
* Different variable holds the datum with override, to prevent regressions
#WORKGCODE2=#WORKGCODE
%IF WORKDATUMID=#FUNNY @NO-OVER
%IF WORKDATUMID=0 @NO-OVER
#WORKGCODE2=WORKDATUMID
@NO-OVER
%IF STYPE=2 %THEN $DATUMTYPE=$DYNAMIC %ELSE $DATUMTYPE=$ABSDATUM
%CALL=CODECON_SET-WORK-DATUMS
%GOTO @STARTLOOP

@END
* Reset to first datum position
WORKDATUMID=#FUNNY ; Clear previous value
#LOOP=1
%GETCPL=#LOOP
#CURRENTCPL=#LOOP
$CPLNAME=GROUPDESCRIPTION
%CALL=PT_ABS_DATUM_RECALL
%CALL=DATUM_HOLD
%GOTO @END2

@ERROR
$WARNING="Warning - Too Many Work Co-ordinate Systems programmed":%CALL=CODECON_WARNING
$WARNING="          Remaining Co-ordinate Systems will be output as incremental":%CALL=CODECON_WARNING:%GOTO @END

@END2
#XSUBHOLD=XSUB
#YSUBHOLD=YSUB
#ZSUBHOLD=ZSUB
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = SELECT_WORK_DATUMS	  ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=SELECT_WORK_DATUMS
%IF #PROCTRACE=1 %THEN $PROCEDURE=SELECT_WORK_DATUMS:%CALL=ENTER_PROCEDURE

* Temporary notes - actual and proposed changes.
************************************************************************

* 1) #CPLHOLD is same as #CURRENTCPL. Discontinue #CPLHOLD.             DONE 22/10/10
* 2) This procedure called by Macro=48 and by PT_INDEX_HANDLER          OK
* 3) NOTE - Translate uses XSUB/XINC differently. Also uses #XSUB etc.
*     Remove use of #XSUB from Translate, use new vars (#XTSUB).        Done 25/10/10
* 3a) Always use #XSUB in datum/index
* 4) Token sets in use                                                  OK DO NOT CHANGE
;    Token^XABSORIGIN^[#XSUB=0]^Absolute X Origin (CPL)         table/table
;    Token^XMCORIGIN^[XINC=0]^Absolute X Origin (MC DAT)        head/head
;    Token^XINC^[#XMOVE=0]^Incremental X Origin                 G92, I am here
;    Token^XSHIFT^[#XSHIFT=0]^Incremental X Shift               G52, shift by
*    XSHIFT added to TNC for baseline switching                         Done 01/11/10
;    Token^XINCR^[#XMOVE=0]^Incremental X Origin                TNC
;    Token^XORIGIN^[#XSUB=!FT_XORIG]^Absolute X Origin (CPL)            S840 addressing
;    Token^X840ORIGIN^[XINC=!FT_XORIG]^Absolute X Origin (MC DAT)       S840 addressing
* 5) Await DSA check on XCPL etc for Datum Shift                        OK - close task
*    Use XCPL etc for G92 in Incremental                                Done 28/10/10
* 6) System variables                                                   INFORMATION
;    XCPL etc - Tool position after index in current CPL coordinates
;    XSUB etc - Position of Machine Datum, in World co-ordinates
;    XINC etc - Position of current CPL origin, in Initial CPL co-ordinates
* 7) Template vars #XBASE etc - set to previous XSUB                    Done 28/10/10
;    Wrong for Incremental at least
;    For Siemens incremental is from previous datum
* 8) Do we need Update_Offset_Registers procedure ?                     Probably not, all calls removed
*
************************************************************************

%IF #MACRO<>15 %THEN #CURRENTCPL=SUBFUNCT ; Save CPL ID

* Set CPL offset for moves to Home and TC
#XTOOLREF=XSUB
#YTOOLREF=YSUB
#ZTOOLREF=ZSUB

#PRESETGCODE=DATA1(23)

%IF STYPE=0 @INCREMENTAL
* Absolute datum selected
%CALL=PT_ABS_DATUM_RECALL
%IF STYPE=0 @INCREMENTAL ; Reset to 0 if datums limit exceeded
* <#WORKGCODE=[#WORKGCODE=13] #WORKGCODEHOLD=[#WORKGCODEHOLD=13]>
%IF #WORKGCODE<>#WORKGCODEHOLD @CONTINUE1
%IF #MACRO=43 @INDEX
%IF #MACRO=48 @INDEX
%GOTO @END

@INDEX
* Index - same datum, check offset
%IF XSUB<>#XSUBHOLD @INCREMENTAL
%IF YSUB<>#YSUBHOLD @INCREMENTAL
%IF ZSUB<>#ZSUBHOLD @INCREMENTAL
%IF #CHECKCPLS=0 @CONTINUE1 ; 0909
%GOTO @END

@CONTINUE1
#XMOVE=XCPL ; Use XCPL etc.
#YMOVE=YCPL
#ZMOVE=ZCPL
<[#XMOVE=10][#YMOVE=10][#ZMOVE=10]> ; Initialise
#XKEEP=#XMOVE  ; Update current position
#YKEEP=#YMOVE
#ZKEEP=#ZMOVE
%CALL=CODECON_SELECT-WORK-DATUMS
%GOTO @END

@INCREMENTAL
* Now at
#XMOVE=XCPL ; Use XCPL etc.
#YMOVE=YCPL
#ZMOVE=ZCPL
#XKEEP=#XMOVE  ; Update current position
#YKEEP=#YMOVE
#ZKEEP=#ZMOVE
* Shift By
#XSHIFT=XSUB-#XBASE
#YSHIFT=YSUB-#YBASE
#ZSHIFT=ZSUB-#ZBASE
*
#XMOVE=#XMOVE*#XREVERSE ; axis reversals
#YMOVE=#YMOVE*#YREVERSE
#ZMOVE=#ZMOVE*#ZREVERSE
#XSHIFT=#XSHIFT*#XREVERSE
#YSHIFT=#YSHIFT*#YREVERSE
#ZSHIFT=#ZSHIFT*#ZREVERSE

%CALL=CODECON_INCR_DATUM_SHIFT

@END

%IF #FORCEXYZ=1 %THEN %CANCEL=#XMOVE,#YMOVE,#ZMOVE

%CALL=DATUM_HOLD
#WORKGCODEHOLD=#WORKGCODE

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = UPDATE_OFFSET_REGISTERS
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=UPDATE_OFFSET_REGISTERS
%IF #PROCTRACE=1 %THEN $PROCEDURE=UPDATE_OFFSET_REGISTERS:%CALL=ENTER_PROCEDURE

#XMOVE=#XMOVE-#XBASE
#YMOVE=#YMOVE-#YBASE
#ZMOVE=#ZMOVE-#ZBASE
#XMOVE=#XHOLD-#XMOVE
#YMOVE=#YHOLD-#YMOVE
#ZMOVE=#ZHOLD-#ZMOVE
#XHOLD=#XMOVE
#YHOLD=#YMOVE
#ZHOLD=#ZMOVE

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_ABS_DATUM_RECALL
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=PT_ABS_DATUM_RECALL                                          ; Make Datum unique by XYZ and Rotation
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ABS_DATUM_RECALL:%CALL=ENTER_PROCEDURE

#WORKGCODE=#FUNNY
%IF STYPE=2 %THEN #TMP=2 %ELSE #TMP=1
#SYSID=SYSID*1000000:%IF #UNIQUEDATUMS=1 %THEN #SYSID=((#SYSID+(ROT1*1000)+ROT2)*#TMP)

@FIND
#LOOP=0
@FIND2
#LOOP=#LOOP+1
#POINTER=#LOOP+2000
* <Loop [#LOOP=0] [#POINTER=1]>
%IF #SYSID=UARRAY1(#POINTER) @FOUND
%IF #LOOP<#DATUMMAX @FIND2
* Datum not found
STYPE=0
* $WARNING="ERROR - SYSID for CPL not found in Datum List":%CALL=CODECON_WARNING
%GOTO @END

@FOUND
#POINTER=#POINTER-2000
#WORKGCODE=#DATUMSTART+(#DATUMINCR*#POINTER)
#DYNAMIC=#WORKGCODE
#COORDNUM=#POINTER

* For head machines, user setting at toolchange needs to be reinstated here
%IF #MACRO<>15 @NO-TC
%IF USERVAR2=1 @NO-TC
%IF USERVAR2=#FUNNY @NO-TC
%IF USERVAR2=0 @NO-TC
#WORKGCODE=USERVAR2
@NO-TC

* <WDM [WORKDATUMID=0]>
%IF WORKDATUMID=0 @END
%IF WORKDATUMID=#FUNNY @END
#WORKGCODE=WORKDATUMID

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = HOLD                 ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=HOLD
%IF #PROCTRACE=1 %THEN $PROCEDURE=HOLD:%CALL=ENTER_PROCEDURE

* Speed
#SPEEDHOLD=#SPEED
#DIRECTIONHOLD=#DIRECTION

*
%IF #INCRXYZ=0 @ABSOLUTE_XYZ
#XMOVE=#XSTOREABS:#YMOVE=#YSTOREABS:#ZMOVE=#ZSTOREABS		;	 Retrieve current absolute position
@ABSOLUTE_XYZ

;#XHOLD=#XMOVE:#YHOLD=#YMOVE:#ZHOLD=#ZMOVE
%IF #XMOVE<>#FUNNY %THEN #XHOLD=#XMOVE


%IF #YMOVE<>#FUNNY %THEN #YHOLD=#YMOVE
%IF #HOLECYCLE=1 @HOLES

%IF MASK=1 @NOT-INC ; 0108
%IF #ROT1<>#FUNNY %THEN #TMPRH1=#ROT1
%IF #ROT2<>#FUNNY %THEN #TMPRH2=#ROT2

%IF #ROTTYPE<>3 @NOT-INC
* Incremental angles need the raw angle to calculate correctly
%IF ROT1<>#FUNNY %THEN #TMPRH1=ROT1
%IF ROT2<>#FUNNY %THEN #TMPRH2=ROT2
@NOT-INC

%IF #ZMOVE<>#FUNNY %THEN #ZHOLD=#ZMOVE
%IF #SKIPROT=1 @END
%IF MASK<>1 %THEN #ROT1HOLD=ROT1 : #ROT2HOLD=ROT2
%GOTO @END

@HOLES
%IF #SKIPROT=1 @END
%IF $PLANAR=YES @END
*  Rot1/Rot2 are not set from drill array
%IF $ACTIVEROTAXIS=$ROT1 %THEN #ROT1HOLD=YPOINT(#LOOP) %ELSE #ROT2HOLD=YPOINT(#LOOP)

%IF CAXIS<>1 @END
%IF ACTIVELINEARAXIS<1 @END
%IF ACTIVELINEARAXIS>2 @END
%IF #ROTARYCARTESIANHOLE=1 @END
* Use new array pointer when possible
%IF $ACTIVEROTAXIS=$ROT1 %THEN #ROT1HOLD=PANGLE(#LOOP) %ELSE #ROT2HOLD=PANGLE(#LOOP)

@END

#ROT1RAW=#FIRSTANGLE : #ROT2RAW=#SECONDANGLE ; hold raw output values 1806

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*
%PROCEDURE=PT_REVERSE_XYZ
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_REVERSE_XYZ:%CALL=ENTER_PROCEDURE

#XMOVE=#XMOVE*#XREVERSE
#YMOVE=#YMOVE*#YREVERSE
#ZMOVE=#ZMOVE*#ZREVERSE

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
%PROCEDURE=PT_REVERSE_XYZ_ARC
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_REVERSE_XYZ_ARC:%CALL=ENTER_PROCEDURE

#IVALUE=#IVALUE*#XREVERSE:#XCENTRE=#XCENTRE*#XREVERSE
#JVALUE=#JVALUE*#YREVERSE:#YCENTRE=#YCENTRE*#YREVERSE
#KVALUE=#KVALUE*#ZREVERSE:#ZCENTRE=#ZCENTRE*#ZREVERSE

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*
%PROCEDURE=PT_CALC_VECTOR_DISTANCE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_CALC_VECTOR_DISTANCE:%CALL=ENTER_PROCEDURE

*	Calculate vector distance from current to next coordinate
*   Use to determine if rapid move should be converted to feedrate move
*
*	XY distance
#XINC=#XMOVE-#XHOLD:#YINC=#YMOVE-#YHOLD:#ZINC=#ZMOVE-#ZHOLD
#ABSXINC=ABS(#XINC):#ABSYINC=ABS(#YINC)
#ABSXINC=#ABSXINC^2:#ABSYINC=#ABSYINC^2:#TMP=#ABSXINC+#ABSYINC:#TMP=SQR(#TMP):#XINC=#TMP	; Store XY distance
*	3D distance i.e. incorporate Z axis
#ZINC=#ZMOVE-#ZHOLD:#ABSZINC=ABS(#ZINC)
#ABSZINC=#ABSZINC^2:#XINC=#XINC^2:#TMP=#XINC+#ABSZINC:#TMP=SQR(#TMP)


*	If move is smaller than the specified amount then convert to a feedrate at highfeed.
%IF #TMP<=#RAPDIST %THEN #GCODE=DATA1(2):#FEED=#RAPIDFEEDRATE:#CONVERTEDMOVE=1:%CALL=PT_OUTPUT_FEED:%GOTO @END	; Rapids converted to feed
#GCODE=DATA1(1):#FEED=#FUNNY	;	#TMP is vector distance returned

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = MILLHEADER           ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=SET_UP_SHEET
%IF #PROCTRACE=1 %THEN $PROCEDURE=SET_UP_SHEET:%CALL=ENTER_PROCEDURE

*	#TOOLSHEET	1=Output with Main NC program	2=Output as seperate file	3=None
%OUTPUT=STANDARD
%IF #TOOLSHEET=1 @OUTPUT_WITH_NC_CODE
APPEND=1:%OUTPUT=$NAME

@OUTPUT_WITH_NC_CODE

%CALL=CODECON_SET-UP-SHEET

%OUTPUT=STANDARD

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = NOMOTION             ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=NOMOTION
%IF #PROCTRACE=1 %THEN $PROCEDURE=NOMOTION:%CALL=ENTER_PROCEDURE
*******************************************************
* <Move End Point [XMOVE=0][YMOVE=1][ZMOVE=2]>
* <#..KEEP End Point [#XKEEP=0][#YKEEP=1][#ZKEEP=2]>
*******************************************************


* Check for 3D compensation
%IF CRC3D=#3DCRCKEEP @NO3DCOMP
%IF CRC3D=1 @3DCOMPON

* 3D CRC mode off
$3DCOMP=$3DCOMPOFF : #3DCRCGCODE=DATA1(64)
%CALL=CODECON_CANCEL-3D-COMP
#3DCRCKEEP=0
%GOTO @NO3DCOMP

@3DCOMPON
* 3D CRC mode on only before first feed
%IF #MACRO<>2 @NO3DCOMP
$3DCOMP=$3DCOMPON : #3DCRCGCODE=DATA1(63)
%CALL=CODECON_3D_CUTTER-COMP
#3DCRCKEEP=1

@NO3DCOMP
%IF CRC3D=1 @NO3DCOMP2
XPARTNORMAL=#FUNNY : YPARTNORMAL=#FUNNY : ZPARTNORMAL=#FUNNY
@NO3DCOMP2

* Keep circle start in case needed
#XSTART=#XSTOREABS
#YSTART=#YSTOREABS
#ZSTART=#ZSTOREABS
*
* Set Precision
%IF #XMOVE=#FUNNY @NO-X
#TEMPROUND=#XMOVE
%CALL=PT_ROUND_VALUE
#XMOVE=#TEMPROUND
#XSTOREABS=#XMOVE
@NO-X

%IF #YMOVE=#FUNNY @NO-Y
#TEMPROUND=#YMOVE
%CALL=PT_ROUND_VALUE
#YMOVE=#TEMPROUND
#YSTOREABS=#YMOVE
@NO-Y

%IF #ZMOVE=#FUNNY @NO-Z
#TEMPROUND=#ZMOVE
%CALL=PT_ROUND_VALUE
#ZMOVE=#TEMPROUND
#ZSTOREABS=#ZMOVE
@NO-Z

********************************************
* Check move content
#MOVE=0
%IF #XMOVE=#FUNNY @NOX
%IF #XMOVE=#XKEEP @NOX
#MOVE=#MOVE+1
@NOX
%IF #YMOVE=#FUNNY @NOY
%IF #YMOVE=#YKEEP @NOY
#MOVE=#MOVE+2
@NOY
%IF #ZMOVE=#FUNNY @NOZ
%IF #ZMOVE=#ZKEEP @NOZ
#MOVE=#MOVE+4
@NOZ


@INC
*
* Check feed type
%CALL=PT_CONTROL_FEEDTYPE
#THRDFEED=#FEED
**********************************************
*
* Assign Move Code for TNC
$TNCLINEAR=$LINEAR3
%IF FIVEAXIS=1 %THEN $TNCLINEAR=$LINEAR5
%IF CRC3D=1 %THEN $TNCLINEAR=$LINEAR3D

%IF #INCRXYZ=0 @END
* Make incremental
* Set Move for XYZ
#XMOVE=#XMOVE-#XKEEP
#YMOVE=#YMOVE-#YKEEP
#ZMOVE=#ZMOVE-#ZKEEP
%IF #XMOVE=0 %THEN #XMOVE=#FUNNY	;	Supress zero X move
%IF #YMOVE=0 %THEN #YMOVE=#FUNNY	;	Supress zero X move
%IF #ZMOVE=0 %THEN #ZMOVE=#FUNNY	;	Supress zero X move
%CANCEL=#XMOVE,#YMOVE,#ZMOVE		;	Necessary else incremental motion will be suppressed e.g.  X10, X10 (drilling)

@END
#XKEEP=#XSTOREABS
#YKEEP=#YSTOREABS
#ZKEEP=#ZSTOREABS

*******************************************************
*<#Move= [#MOVE=0]>
*******************************************************

%IF #PROCTRACE=0 @ALLEND
* Procedure trace is ON. Additional trace options
* #TRTHREAD,#TRHOLE control array dumps in CY procedure
* #TRX,#TRY,#TRZ,#TRC1,#TRC2,#TRB temporary output vars
%IF #MACRO=9 @EXIT
%IF #MACRO=10 @EXIT
%IF #MACRO=11 @EXIT
%IF #MACRO=12 @EXIT
%IF #MACRO=13 @EXIT
%IF #MACRO=37 @EXIT
%IF #MACRO=15 @EXIT
%IF #MACRO=43 @EXIT
* Not Drill, ToolChange, Index or Thread Mill
#TRX=XMOVE
#TRY=YMOVE
#TRZ=ZMOVE
%IF #MACRO=53 %THEN #TRX=XEND:#TRY=YEND:#TRZ=ZEND
%IF #MACRO=54 %THEN #TRX=XEND:#TRY=YEND:#TRZ=ZEND

%IF #TRENDS=0 @TRMODE
* Output End Points
<* Input Coordinates [#TRX=0][#TRY=1][#TRZ=2]>


@TRMODE
%IF #TRMODE=0 @EXIT
* Output Current Mode Settings
<* Move Evaluation Code #MOVE=[#MOVE=13]>

@EXIT
%CALL=EXIT_PROCEDURE

@ALLEND
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ PT_COMPENSATE_TLO            ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=PT_COMPENSATE_TLO
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_COMPENSATE_TLO:%CALL=ENTER_PROCEDURE

* <PT_COMPENSATE_TLO [HEAD2TURRETX=0] [HEAD2TURRETY=1] [HEAD2TURRETZ=2]>
%IF #TLOCOMP=0 @END
%IF MCOORD=0 @NOHEAD
%IF CPLPLANE=5 @NOHEAD ; Aligned with Spindle
*
* Angled head and machine coords in use
#XMOVE=#XMOVE+HEAD2TURRETX
#YMOVE=#YMOVE+HEAD2TURRETY
#ZMOVE=#ZMOVE+HEAD2TURRETZ
%GOTO @END
*
@NOHEAD
%IF #ADJZMOVE=#FUNNY %THEN #ADJZMOVE=0
#ZMOVE=#ZMOVE+#ADJZMOVE

%IF XYPLANE=0 @END
%IF #ARCTYPE=4 %THEN #KVALUE=#KVALUE+#ADJZMOVE

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ FIND_PRECISION                   ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=FIND_PRECISION
%IF #PROCTRACE=1 %THEN $PROCEDURE=FIND_PRECISION:%CALL=ENTER_PROCEDURE

#PRECISION=1
#TMP=#INCR
@LOOP
%IF #TMP=>1 @END
#PRECISION=#PRECISION*10
#TMP=#TMP*10
%GOTO @LOOP

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ FIND_ANGULAR_PRECISION           ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=FIND_ANGULAR_PRECISION
%IF #PROCTRACE=1 %THEN $PROCEDURE=FIND_ANGULAR_PRECISION:%CALL=ENTER_PROCEDURE

#ANGPRECISION=1
#TMP=#ANGINCR
@LOOP
%IF #TMP=>1 @END
#ANGPRECISION=#ANGPRECISION*10
#TMP=#TMP*10
%GOTO @LOOP

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_ARC_CENTRE        ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;

%PROCEDURE=PT_ARC_CENTRE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ARC_CENTRE:%CALL=ENTER_PROCEDURE

*
* Round Arc Centre values

#TEMPROUND=XCENTRE
%CALL=PT_ROUND_VALUE
#XCENTRE=#TEMPROUND

#TEMPROUND=YCENTRE
%CALL=PT_ROUND_VALUE
#YCENTRE=#TEMPROUND

#TEMPROUND=ZCENTRE
%CALL=PT_ROUND_VALUE
#ZCENTRE=#TEMPROUND

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_ARC_IJK        ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;

%PROCEDURE=PT_ARC_IJK
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ARC_IJK:%CALL=ENTER_PROCEDURE

*	Determines the method of fixing arc centre
*	NOTE!  Thread Milling uses %PROCEDURE=PT_THRD_ARC_CENTRE for simplicity
*
*	Setvar^#ARCTYPE
*						Signed Start to Centre	1
*						Signed Centre to start	2
*						Unsigned Start / Centre	3
*						Centre					4
*
* Setvar^#USERADS^Use Radius: 0 Never, 1 When Possible, 2 When Possible (XY), 3 Always, 4 Always except 360
* #XSTART etc set in Nomotion
* #XCENTRE etc set in PT_ARC_CENTRE

#IVALUE=#XCENTRE-#XSTART
#JVALUE=#YCENTRE-#YSTART
#KVALUE=#ZCENTRE-#ZSTART
%IF #ARCTYPE=1 @END																			;	Signed Start to Centre
%IF #ARCTYPE=4 %THEN #IVALUE=#XCENTRE:#JVALUE=#YCENTRE:#KVALUE=#ZCENTRE:%GOTO @END				;	Centre
%IF #ARCTYPE=2 %THEN #IVALUE=-1*#IVALUE:#JVALUE=-1*#JVALUE:#KVALUE=-1*#KVALUE:%GOTO @END		;	Signed Centre to start (reverse of type 1)
%IF #ARCTYPE=3 %THEN #IVALUE=ABS(#IVALUE):#JVALUE=ABS(#JVALUE):#KVALUE=ABS(#KVALUE) 				;	Unsigned Start / Centre

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


*
*							*********************
*							*	Thread Milling	*
*							*********************
*
*
%PROCEDURE=PT_THRD_MOVE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_THRD_MOVE:%CALL=ENTER_PROCEDURE

#OUTPUTMOVE=0
%IF USERVAR8=0 %THEN #OUTPUTMOVE=1:%GOTO @GO
%IF #THREADCANNED<2 %THEN #OUTPUTMOVE=1:%GOTO @GO
* Full canned cycle
%IF #PREPOSITION=0 @GO
*  <BC [#BEFORECYCLE=0]>
%IF #BEFORECYCLE=0 @GO
%IF #PREPOSITION=1 %THEN #OUTPUTMOVE=1:%GOTO @GO
* Preposition after toolchange
%IF #TOOLCHANGE=1 %THEN #OUTPUTMOVE=1

@GO
#BEFORECYCLE=0
%IF XPOINT(#LOOP)=0 %THEN #GCODE=DATA1(1) %ELSE #GCODE=DATA1(2)
#FEED=YPOINT(#LOOP)
#LOOP=#LOOP+1
#XMOVE=XPOINT(#LOOP):#YMOVE=YPOINT(#LOOP):#ZMOVE=RADIUS(#LOOP)
ZMOVE=#ZMOVE ; For THISZMOVE Token (Siemens)
*
* Next Z for first move
%IF #TOOLCHANGE=0 @SECOND
#TEMP=#LOOP+2
NEXTZMOVE=RADIUS(#TEMP)
%IF #3DAFTERTC=1 %THEN #ZMOVE=NEXTZMOVE ; NEXTZ for Rapid after TC

@SECOND
* Set canned cycle variables
#HELIXCOUNT=0
%IF #THRDSTARTZ=#FUNNY %THEN #THRDPLUNGE=#ZMOVE
%IF #THRDCLEAR=#FUNNY %THEN #THRDCLEAR=#ZHOLD
%IF #THRDPOSFEED=#FUNNY %THEN #THRDPOSFEED=#FEED
#THRDX=#XMOVE
#THRDY=#YMOVE
*
$MOVETYPE=MOVE
%IF #XHOLD<>#XMOVE @NOT-PLUNGE1
%IF #YHOLD<>#YMOVE @NOT-PLUNGE1
* <Vertical Move>
#OUTPUTPOINT=1
#THRDXPLUNGE=#THRDX
#THRDYPLUNGE=#THRDY
* %IF #ZMOVE<#ZHOLD %THEN <PLUNGE> %ELSE <LIFT>
$MOVETYPE=PLUNGE

#COMPON=0
#THREADMOVE=0

%IF #OUTPUTMOVE=0 @NOBLOCK
* #BEFORECYCLE=0
%IF #GCODE=DATA1(1) %THEN %CALL=PT_OUTPUT_RAPID %ELSE %CALL=PT_OUTPUT_FEED
%GOTO @NOBLOCK


@NOT-PLUNGE1
* <Not PL>
* %IF USERVAR8=1 @NOBLOCK
%IF #GCODE=DATA1(2) @FEED
* <Rapid  XY>
%IF #OUTPUTMOVE=1 %THEN %CALL=PT_OUTPUT_RAPID
%GOTO @NOBLOCK

@FEED
* <Feed Move XY>
#COMPGCODE=#THRDCOMPCODE
#THREADMOVE=1
%IF #LOOP=LAST %THEN #THREADMOVE=2
#NEXTLOOP=#LOOP+1
#NEXTTYPE=XPOINT(#NEXTLOOP)
%IF #NEXTTYPE=0 %THEN #THREADMOVE=2 ; G01 followed by G00
%IF #OUTPUTMOVE=1 %THEN %CALL=PT_OUTPUT_FEED

@NOBLOCK
%IF $MOVETYPE<>PLUNGE @NOT-PLUNGE2
#COMPON=#COMPCYCLE
%IF #COMPON=0 @NOT-PLUNGE2
#THREADMOVE=1
$COMPOUTPUT=FALSE

@NOT-PLUNGE2
#LOOP=#LOOP+1

#XHOLD=#XMOVE:#YHOLD=#YMOVE:#ZHOLD=#ZMOVE
#ZLINEAR=#ZMOVE
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*


%PROCEDURE=PT_THRD_ARC
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_THRD_ARC:%CALL=ENTER_PROCEDURE

#GCODE=DATA1(4) ; ISO G02 or G03
$ARCDIRN=$CCLWARC ; TNC
%IF XPOINT(#LOOP)=2 %THEN #GCODE=DATA1(3):$ARCDIRN=$CLWARC

#COMPGCODE=#THRDCOMPCODE
%CANCEL=#GCODE
#FEED=YPOINT(#LOOP)
#LOOP=#LOOP+1
#XCENTRE=XPOINT(#LOOP):#YCENTRE=YPOINT(#LOOP):#RADIUS=RADIUS(#LOOP)
#KVALUE=#FUNNY:		;Suppress output of this variables
#LOOP=#LOOP+1
#XMOVE=XPOINT(#LOOP):#YMOVE=YPOINT(#LOOP)
%CALL=PT_THRD_ARC_CENTRE	;	Select Arc centre method
%IF #LOOP=LAST %THEN #THREADMOVE=2
%IF $COMPOUTPUT=FALSE %THEN %CALL=CRC_HANDLER

%IF USERVAR8=0 @OUT
%IF #THREADCANNED=2 @NOBLOCK
@OUT
%CALL=PT_OUTPUT_ARC
@NOBLOCK

#LOOP=#LOOP+1

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*

%PROCEDURE=PT_THRD_ARC_HELICAL
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_THRD_ARC_HELICAL:%CALL=ENTER_PROCEDURE

#COMPGCODE=#THRDCOMPCODE

* Are all helical blocks required
%IF USERVAR8=1 %THEN #THREADSINGLE=1
%IF #THREADSINGLE<>1 %THEN #OUTPUTHELIX=1:%GOTO @CONTINUE

* Output leads & one main helical block only, Find last main helix block
* ZMOVE = Total Movement, KVALUE = Lead
#HELIXCOUNT=#HELIXCOUNT+1
%IF #HELIXCOUNT=1 %THEN #HELIXZHOLD=#ZHOLD
#OUTPUTHELIX=0
#TYPE=XPOINT(#LOOP)
#THISRAD=#LOOP+3
#THISRAD=XPOINT(#THISRAD)
#RADIUS=#THISRAD
#NEXTLOOP=#LOOP+4
#NEXTTYPE=XPOINT(#NEXTLOOP)
%IF #NEXTTYPE<4 @OUTPUT
#NEXTRADIUS=#NEXTLOOP+3
#NEXTRADIUS=XPOINT(#NEXTRADIUS)
%IF #STARTRAD=#FUNNY %THEN #STARTRAD=#ARCRADIUS
%IF #THISRAD=#FUNNY @OUTPUT

%IF #NEXTRADIUS<>#THISRAD @CHANGE ;Arc rad change
%IF #TYPE<>#NEXTTYPE @CHANGE ;Arc direction change
%GOTO @CONTINUE

@CHANGE
* Suppress first main helix, uless it is also the last
%IF #THISRAD<>#NEXTRADIUS @OUTPUT
%IF #TYPE<>#NEXTTYPE @OUTPUT
%GOTO @CONTINUE

@OUTPUT
#OUTPUTHELIX=1 ; Set to 1 when output block required
%IF USERVAR8=0 @CONTINUE
* Canned Cycles only
%IF #HELIXCOUNT=1 @FIRSTHELIX
* <Not First>
#OUTPUTCYCLE=1
%GOTO @CONTINUE

@FIRSTHELIX
* <Next [#NEXTTYPE=1]>
#OUTPUTCYCLE=0
%IF #NEXTTYPE=4 @CONTINUE
%IF #NEXTTYPE=5 @CONTINUE
* Only 1 helix
#OUTPUTCYCLE=1

@CONTINUE
#THISRAD=#LOOP+3
#THISRAD=XPOINT(#THISRAD)
#RADIUS=#THISRAD
#GCODE=DATA1(4) ; ISO G02 or G03
$ARCDIRN=$CCLWARC ; TNC
%IF XPOINT(#LOOP)=4 %THEN #GCODE=DATA1(3):$ARCDIRN=$CLWARC

#FEED=YPOINT(#LOOP)
#LOOP=#LOOP+1
#XCENTRE=XPOINT(#LOOP):#YCENTRE=YPOINT(#LOOP)
#LOOP=#LOOP+1
#XMOVE=XPOINT(#LOOP):#YMOVE=YPOINT(#LOOP):#ZMOVE=RADIUS(#LOOP)
#KVALUE=#ZMOVE-#ZKEEP

* #THRDLEAD=#KVALSAVE ; Lead of thread, Z move of last helical block
#KVALSAVE=#KVALUE ; Save KVALUE
#THRDLEAD=#ZMOVE-#ZKEEP

#LOOP=#LOOP+1
#STARTRAD=XPOINT(#LOOP):#ENDRAD=YPOINT(#LOOP)
%IF #STARTRAD=#ENDRAD @NOTAPER
* Helix inaccurate for Taper thread
%IF #TAPERWARN=0 @NOTAPER
$WARNING="Warning - Helix for taper threading may be inaccurate":%CALL=CODECON_WARNING
@NOTAPER
*
* Extract canned cycle parameters
#THRDARCDIR=#GCODE
%IF #THRDLEAD<0 @DOWNCUT

* Cutting upwards
* %IF #THRDENDZ=#FUNNY %THEN #THRDENDZ=#ZHOLD ; Start of first helix
#THRDPLUNGE=5

%GOTO @UPDOWN

@DOWNCUT
* Cutting Down
%IF #THRDPLUNGE=#FUNNY %THEN #THRDPLUNGE=#ZHOLD+5

@UPDOWN
#THRDENDZ=#ZMOVE ; End height last helix
%IF #THREADCANNED<>2 %THEN #THRDFEED=#FEED
#PLUNGERAD=(#THRDXPLUNGE-#XCENTRE)*(#THRDXPLUNGE-#XCENTRE)
#PLUNGERAD=#PLUNGERAD+((#THRDYPLUNGE-#YCENTRE)*(#THRDYPLUNGE-#YCENTRE))
#PLUNGERAD=SQR(#PLUNGERAD)
* <INOUT #PLUNGERAD=[#PLUNGERAD=0] #STARTRAD=[#STARTRAD=0]>
#THRDINOUT=#THRDINCODE
%IF #PLUNGERAD>#STARTRAD %THEN #THRDINOUT=#THRDOUTCODE
%IF #HELIXCOUNT>2 @DIAFIXED
#THREADDIA=(#THISRAD+TOOLRAD)*2
%IF #PLUNGERAD>#STARTRAD %THEN #THREADDIA=(#THISRAD-TOOLRAD)*2
@DIAFIXED
*

%CANCEL=#XMOVE,#YMOVE,#ZMOVE,#GCODE

%CALL=PT_THRD_ARC_CENTRE			;	Select Arc centre method
%IF #LOOP=LAST %THEN #THREADMOVE=2

%IF $COMPOUTPUT=FALSE %THEN %CALL=CRC_HANDLER

%IF USERVAR8=0 @CONTINUE2
%IF #THREADCANNED<2 @CONTINUE2
%IF #OUTPUTCYCLE=0 @CONTINUE2

* Canned cycle output
* #MODALCYCLE=DATA2(48)
* %CANCEL=#MODALCYCLE
#XMOVE=#XCENTRE
#YMOVE=#YCENTRE

%IF #MILLPOINTS=1 @NOPOINTS
%IF #CYCOUT>0 @COUNT
%CALL=PT_THRD_CANNED37
#BEFORECYCLE=0
@COUNT
%IF #OUTPUTPOINT=0 @CONTINUE2
#ZMOVE=#FUNNY
%CALL=CODECON_HOLE-CYCLEPOINTS
#OUTPUTPOINT=0
#CYCOUT=1
%GOTO @CONTINUE2

@NOPOINTS
* Always output cycle definition, not hole point
%IF #OUTPUTPOINT=0 @CONTINUE2
%CALL=PT_THRD_CANNED37
#BEFORECYCLE=0
#CYCOUT=1
#OUTPUTPOINT=0

@CONTINUE2
* Count arc blocks skipped
%IF #OUTPUTHELIX=0 %THEN #BLOCKSMISSED=#BLOCKSMISSED+1
*Suppress intermediate helical blocks if instructed. Maintain #ZHOLD
%IF #OUTPUTHELIX=0 %THEN #ZHOLD=#ZMOVE:%GOTO @SKIP
*Set K word to full circle pitch for multi-pass block
%IF #BLOCKSMISSED=0 @OUTPUT2
#KVALUE=#THRDLEAD

@OUTPUT2
%IF USERVAR8=0 %THEN %CALL=PT_OUTPUT_HELIX
* reset helical block count
#BLOCKSMISSED=0

@SKIP


#LOOP=#LOOP+1

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=PT_THRD_ARC_CENTRE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_THRD_ARC_CENTRE:%CALL=ENTER_PROCEDURE

*	Handle Arc centre for Thread milling - force I&J output
*	Setvar^#ARCTYPE
*						Signed Start to Centre	1
*						Signed Centre to start	2
*						Unsigned Start / Centre	3
*						Centre					4
* Setvar^#USERADS^Use Radius: 0 Never, 1 When Possible, 2 When Possible (XY), 3 Always, 4 Always except 360
#ARCRADIUS=#RADIUS

%IF #USERADS=3 @USERADS
* IJK method of arc output
#IVALUE=#XCENTRE-#XKEEP:#JVALUE=#YCENTRE-#YKEEP
#RADIUS=#FUNNY

%IF #ARCTYPE=1 @END																	;	Signed Start to Centre
%IF #ARCTYPE=2 %THEN #IVALUE=-1*#IVALUE:#JVALUE=-1*#JVALUE:#KVALUE=-1*#KVALUE:		;	Signed Centre to start (reverse of type 1)
%IF #ARCTYPE=3 %THEN #IVALUE=ABS(#IVALUE):#JVALUE=ABS(#JVALUE):#KVALUE=ABS(#KVALUE) ;	Unsigned Start / Centre
%IF #ARCTYPE=4 %THEN #IVALUE=#XCENTRE:#JVALUE=#YCENTRE							    ;	Centre
%GOTO @END

@USERADS
#IVALUE=#FUNNY
#JVALUE=#FUNNY

@END
%CALL=PT_REVERSE_XYZ_ARC
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*
%PROCEDURE=PT_SKIP_RECORD
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SKIP_RECORD:%CALL=ENTER_PROCEDURE

* This procedure is called when an unknown move type is detected and
* the record is skipped.

#SKIP=RADIUS(#LOOP)
* #RECORD=XPOINT(#LOOP)
#LOOP=#LOOP+#SKIP:#LOOP=#LOOP+1

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_THRD_CANNED37
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_THRD_CANNED37:%CALL=ENTER_PROCEDURE
* Sets remaining token variables for old (Macro37) cycle and calls code constructor
* Some vars are set with helical processing from thread mill array values

%CALL=PT_CONTROL_FEEDTYPE ; Cutting feed from helix
#THRDFEED=#FEED

#FEED=#THRDPOSFEED ; For Lead Feed Type conversion
%CALL=PT_CONTROL_FEEDTYPE
#THRDPOSFEED=#FEED
#FEED=#THRDFEED  ; Reset

* Number of turns
#TURNS=FIELD4-FIELD7
#TURNS=ABS(#TURNS)
#TURNS=#TURNS/FIELD6

* Set values direct from macro
* <Field 1  Clearance [FIELD1=2]>
* <Field 2  Retract   [FIELD2=2]>
* <Field 3  Diameter  [FIELD3=0]> ;#FUNNY if geometry picked
* <Field 4  Level     [FIELD4=0]>
* <Field 5  D of T    [FIELD5=0]>
* <Field 6  Pitch     [FIELD6=2]>
* <Field 7  Depth     [FIELD7=2]>

#THRDCLEAR=FIELD1  ; Z Clear
#THRDPLUNGE=FIELD2 ; Retract
#THRDLEVEL=FIELD4  ; Level
#THRDSTARTZ=#HELIXZHOLD
#THRDPITCH=FIELD6   ; Pitch
STARTS=1 ; Not set by old cycle
; Do not set #THRDENDZ to FIELD7

#THRDEPTH=FIELD7+FIELD4
%IF #THRDEPMODE2=1 %THEN #THRDEPTH=#THRDEPTH-FIELD4
%IF #THRDEPMODE2=2 %THEN #THRDEPTH=#THRDEPTH-FIELD2
%IF #THRDEPMODE>0 %THEN #THRDEPTH=ABS(#THRDEPTH)

* <* Retract [#RTYPE=1]>
%IF #RTYPE=3 @HAND
#THRDPLUNGE=FIELD2+FIELD4 ; Absolute
%IF #RTYPE=2 %THEN #THRDPLUNGE=#THRDPLUNGE-FIELD1

@HAND
* <Retract= [#THRDPLUNGE=2]>
*%IF DIRECTION=1 %THEN #DIRECTION=DATA2(4) ; Stop
*%IF DIRECTION=2 %THEN #DIRECTION=DATA2(5) ; Fwd
*%IF DIRECTION=3 %THEN #DIRECTION=DATA2(6) ; Rev
*%IF DIRECTION=4 %THEN #DIRECTION=DATA2(14)
*%IF DIRECTION=5 %THEN #DIRECTION=DATA2(15)
*
* Arc Direction plus Climb or Upcut
#TMILLUPWARD=0 ; Default cut downward
%IF #THRDARCDIR=DATA1(4) @CCLW
* CLW
* <CLW>
#THRDARCOUT=#THRDCLW
#THRDMILL=#THRDUPCUT
%IF #DIRECTION=DATA2(6) %THEN #THRDMILL=#THRDCLIMB
%IF #DIRECTION=DATA2(15) %THEN #THRDMILL=#THRDCLIMB
%IF #THRDSTARTZ<#THRDENDZ @CLW_UP

* CLW and Downward
* <CLW DOWN>
$THRDHAND=$THRDRIGHT
%IF #THRDPITCHMODE=2 %THEN #THRDPITCH=#THRDPITCH*-1
%IF #THRDEPMODE=3 %THEN #THRDEPTH=#THRDEPTH*-1
%GOTO @CALL

@CLW_UP
* CLW and Upward
* <CLW UP [#THRDLEAD=2]>
#TMILLUPWARD=1 ; Cut upward
$THRDHAND=$THRDLEFT
%IF #THRDPITCHMODE=1 %THEN #THRDPITCH=#THRDPITCH*-1
%IF #THRDEPMODE=2 %THEN #THRDEPTH=#THRDEPTH*-1
%GOTO @CALL

@CCLW
* <CCLW>
#THRDARCOUT=#THRDCCLW
#THRDMILL=#THRDCLIMB
%IF #DIRECTION=DATA2(6) %THEN #THRDMILL=#THRDUPCUT
%IF #DIRECTION=DATA2(15) %THEN #THRDMILL=#THRDUPCUT
%IF #THRDSTARTZ<#THRDENDZ @CCLW_UP

* CCLW and Downward
* <CCLW DOWN>
$THRDHAND=$THRDLEFT
%IF #THRDPITCHMODE=1 %THEN #THRDPITCH=#THRDPITCH*-1
%IF #THRDEPMODE=3 %THEN #THRDEPTH=#THRDEPTH*-1
%GOTO @CALL

@CCLW_UP
* CCLW and Upward
* <CCLW UP>
#TMILLUPWARD=1 ; Cut upward
$THRDHAND=$THRDRIGHT
%IF #THRDPITCHMODE=2 %THEN #THRDPITCH=#THRDPITCH*-1
%IF #THRDEPMODE=2 %THEN #THRDEPTH=#THRDEPTH*-1

@CALL
* Reverse climb/conventional for external thread
%IF #PLUNGERAD<#STARTRAD @CALL2
* <EXTERNAL>
%IF #THRDMILL=#THRDCLIMB %THEN #THRDMILL=#THRDUPCUT %ELSE #THRDMILL=#THRDCLIMB
@CALL2
* <[$THRDHAND]>
#THRDLEAD=#THRDPITCH*STARTS
%CALL=CODECON_THREAD_CYCLE

* 25/03
#XKEEP=#XMOVE; /#XREVERSE
#YKEEP=#YMOVE; /#YREVERSE
#ZMOVE=FIELD1:<[#ZMOVE=10]>
#ZKEEP=#ZMOVE ; /#ZREVERSE

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



%PROCEDURE=PT_THRD_CANNED675
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_THRD_CANNED675:%CALL=ENTER_PROCEDURE
* <MILLMODE=       [MILLMODE=13]   0=climb 1=conventional>

%GOTO @JUMP
************  Diagnostic printout
< >
<* Hole Cycle Parameters>
<ZCLEAR=         [ZCLEAR=13]>
<RPLANE=         [RPLANE=13]>
<ZLEVEL=         [ZLEVEL=13]>
%IF ZLEVEL=#FUNNY %THEN <* Multi-Level-Depth>
<ZDEPTH=         [ZDEPTH=13]>
* %IF ZDEPTH=#FUNNY %THEN <* Multi-Depth>
<ZFEED=           [ZFEED=13]>
<XYFEED=           [XYFEED=13]>
<FEED=           [FEED=13]>
<SPEED=          [SPEED=13]>
< >
<LEFTRIGHT=      [LEFTRIGHT=13]> ; Climb or conventional
<HOLEDIAM=       [HOLEDIAM=13]>
<THREADDIAM=     [THREADDIAM=13]>
<PITCH2=         [PITCH2=13]> ; Sign gives direction up/down
<INCLUDEDANGLE=  [INCLUDEDANGLE=13]>
<THREADDEPTH=    [THREADDEPTH=13]>
<THREADINOUT=    [THREADINOUT=13]>
<HANDOFTHREAD=   [HANDOFTHREAD=13]>
<STARTS=         [STARTS=13]>
<STARTANGLE=     [STARTANGLE=13]>
<FEEDADJUSTED=   [FEEDADJUSTED=13]>
<THREADCANNED=   [THREADCANNED=13]>
<PLUNGEZ=        [PLUNGEZ=13]    difference in z between start and end of lead >

< >
<* Array Content>
<* Loop   XPOINT  YPOINT  ZPOINT>


#LOOP=1
@NEXT2
#TRX=XPOINT(#LOOP):#TRY=YPOINT(#LOOP):#TRZ=RADIUS(#LOOP)
#TRDEPTH=MZDEPTH(#LOOP)
#TRPLANE=MRPLANE(#LOOP)
<* [#LOOP=14]     [#TRX=0] [#TRY=1] [#TRZ=2] MZdepth=[#TRDEPTH=13] MRplane=[#TRPLANE=13]>
#LOOP=#LOOP+1
%IF #LOOP<=LAST @NEXT2
< >
************

@JUMP
#THRDLEVEL=ZLEVEL
%IF ZLEVEL=#FUNNY %THEN #THRDLEVEL=ZPOINT(#LOOP)
#THRDSTARTZ=#THRDLEVEL
#THRDPITCH=ABS(PITCH2)
#THREADDIA=THREADDIAM
#THRDLEAD=#THRDPITCH*STARTS
*
#THRDFEED=#FEED
XYFEED=LEADFEED ; For Feed Type conversion
%CALL=PT_CONTROL_FEEDTYPE
#THRDPOSFEED=#FEED
#FEED=#THRDFEED ; Reset
XYFEED=FEED ; Reset

* Feed adjust here
%IF FEEDADJUSTED=1 @DEPTH
* #MINFEEDADJ  Adjust Feedrate Maximum Decrease (%)
* #MAXFEEDADJ  Adjust Feedrate Maximum Increase (%)

@DEPTH
* Depth
#THRDEPTH=ZDEPTH
%IF ZLEVEL=#FUNNY %THEN #THRDEPTH=MZDEPTH(#LOOP)
%IF #THRDEPMODE2=1 %THEN #THRDEPTH=#THRDEPTH-#ZLEVEL
%IF #THRDEPMODE2=2 %THEN #THRDEPTH=#THRDEPTH-RPLANE
%IF #THRDEPMODE>0 %THEN #THRDEPTH=ABS(#THRDEPTH)

* Number of Turns
#TURNS=#THRDLEVEL-ZDEPTH
#TURNS=ABS(#TURNS)
#TURNS=#TURNS/#THRDLEAD

* Retract
#THRDPLUNGE=#RPLANE ; From PT_MULTI_LEVEL

@HAND
* Hand of Thread
%IF HANDOFTHREAD=2 @LEFT
$THRDHAND=$THRDRIGHT
%IF #THRDPITCHMODE=2 %THEN #THRDPITCH=#THRDPITCH*-1
%GOTO @CLIMB

@LEFT
$THRDHAND=$THRDLEFT
%IF #THRDPITCHMODE=1 %THEN #THRDPITCH=#THRDPITCH*-1

@CLIMB
* Climb or Upcut
#THRDMILL=#THRDUPCUT
%IF LEFTRIGHT=1 %THEN #THRDMILL=#THRDCLIMB ; Climb

@ARCDIRN
* Arc Direction
#THRDARCOUT=#THRDCLW
%IF #DIRECTION=DATA2(5) @FWD
%IF #DIRECTION=DATA2(14) @FWD
* Spindle reversed
%IF THREADINOUT=2 @REVOUT
* Reverse Internal
%IF LEFTRIGHT=0 %THEN #THRDARCOUT=#THRDCCLW
%GOTO @UPDOWN

@REVOUT
* Reverse External
%IF LEFTRIGHT=1 %THEN #THRDARCOUT=#THRDCCLW
%GOTO @UPDOWN

@FWD
* Spindle Forward
%IF THREADINOUT=2 @FWDOUT
* Forward Internal
%IF LEFTRIGHT=1 %THEN #THRDARCOUT=#THRDCCLW
%GOTO @UPDOWN

@FWDOUT
* Forward External
%IF LEFTRIGHT=0 %THEN #THRDARCOUT=#THRDCCLW

@UPDOWN
* Ascending/Descending
* New variable settings, LEFTRIGHT and PITCH2 with +-sign
%IF PITCH2<0 @BOT-UP
* Cut from top
#TMILLUPWARD=0 ; Cut downward
%IF #THRDEPMODE=3 %THEN #THRDEPTH=#THRDEPTH*-1
%GOTO @INOUT

@BOT-UP
* Cut from bottom
#TMILLUPWARD=1 ; Cut upward
%IF #THRDEPMODE=2 %THEN #THRDEPTH=#THRDEPTH*-1

@INOUT
* Internal/External
#THRDINOUT=#THRDINCODE
%IF THREADINOUT=2 %THEN #THRDINOUT=#THRDOUTCODE ; External

*Axis reversals
* Depth also reversed by setting up/down direction signs
#XMOVE=#XMOVE*#XREVERSE
#YMOVE=#YMOVE*#YREVERSE
#THRDPLUNGE=#THRDPLUNGE*#ZREVERSE
#THRDSTARTZ=#THRDSTARTZ*#ZREVERSE
#TMPCLEAR=#TMPCLEAR*#ZREVERSE
#THRDEPTH=#THRDEPTH*#ZREVERSE
#THRDLEVEL=#THRDLEVEL*#ZREVERSE
#THRDLEAD=#THRDPITCH*STARTS ; Reset with correct sign

%CALL=CODECON_THREAD_CYCLE

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



*
*							*******************
*							Block No. Increment
*							*******************
*
%PROCEDURE=PT_BINC
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_BINC:%CALL=ENTER_PROCEDURE

;				Use Block numbers					(#USEBNUM>=1)
%IF #USEBNUM=0 @END ; Quick exit
%IF MASK=1 @END

;				Block No. Start						(#BNUM)
;				Block Number increment				(#BNUMINC)
;				Only Safe block numbers 			(#ONLYSBNUM=1)

#BNUM=#BNUM+#BNUMINC
*
* Check top limit, reset if exceeded
%IF #USEBNUM=1 @END ; Reset not required
%IF #BNUM>#USEBNUM %THEN #BNUM=#BNUMSTART
*
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*							******************************
*							Safe Start Block No. Increment
*							******************************
*
%PROCEDURE=PT_SBINC
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SBINC:%CALL=ENTER_PROCEDURE

%IF MASK=1 @END
%IF #ONLYSBNUM=1 %THEN #SBNUM=#SBNUM+#BNUMINC %ELSE #BNUM=#BNUM+#BNUMINC:#SBNUM=#BNUM
*	Output Block Number same as Tool Number (POSITION)
%IF #SBNUMPOSITION=1 %THEN #SBNUM=POSITION

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*							********************************
*									Set Tooling data
*							********************************
*
%PROCEDURE=PT_SET_TOOL_DATA
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SET_TOOL_DATA:%CALL=ENTER_PROCEDURE

#LOOP=1
@LOOPS
%LOAD=#LOOP:%IF #LOOP>NUMTOOLS @ELOOP
%CALL=PT_SET_TLO
%CALL=CODECON_SET-TOOLING-DATA
#LOOP=#LOOP+1:%GOTO @LOOPS
@ELOOP

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*
*		            		*************************************
*									Subroutine Start / Header
*							*************************************
*
*  Note  #incrxyz is current abs/inc setting
*        #incrxyzhold is main program setting
*        #incrsubs is subroutine setting

%PROCEDURE=PT_OUTPUT_SUBSTART
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_SUBSTART:%CALL=ENTER_PROCEDURE

%IF MASK=1 %THEN #BNUMVAR=0 %ELSE #BNUMVAR=#BNUMINC
STARTSUB=#BNUM+#BNUMVAR

%IF MASK=1 %THEN %GOTO @SKIP
%IF #RESTARTSUBSBNUM=1 %THEN #BNUMHOLD=#BNUM:#BNUM=0			;	Restart Block numbering for Subprograms

*	If Increment Subroutines by ... is not set then start at Progid & increment by one else use the increment.
%IF #INCRSUBNUMBER=#FUNNY %THEN #SUBROUTINE=SUBROUTINE+#SUBNOSTART %ELSE #SUBROUTINE=(SUBROUTINE*#INCRSUBNUMBER)+#SUBNOSTART

* Force feedrate if required
%IF #FORCEFEED=1 %THEN %CANCEL=#FEED

*Reset HOLD values for incremental first move
#XHOLD=NEXTXMOVE
#YHOLD=NEXTYMOVE
#ZHOLD=NEXTZMOVE
* Initialise position for absolute subroutines
* Removed changes 10-08-10
* #XMOVE=#XHOLD*#XREVERSE
* #YMOVE=#YHOLD*#YREVERSE
* #ZMOVE=#ZHOLD*#ZREVERSE
* <[#XMOVE=10][#YMOVE=10][#ZMOVE=10]>

*	If using incremental subroutines only, it is necessary to hardcode a G91 on extra Sequence definition line
%IF #INCRXYZHOLD=1 @MAIN_PROG_IS_INCREMENTAL
%IF #INCRSUBS=1 %THEN #INCRXYZ=1	; Set subs to incr if specified
@MAIN_PROG_IS_INCREMENTAL
%IF #INCRXYZ=1 %THEN #ABSINC=DATA1(48) %ELSE #ABSINC=DATA1(47)

%CALL=CODECON_SUBROUTINE-START
* Force GCodes on next move
%CANCEL=#GCODE
%CANCEL=#PLANEGCODE

@SKIP

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*
*		            		********************************
*									Subroutine Call
*							********************************
*
%PROCEDURE=PT_OUTPUT_SUBCALL
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_SUBCALL:%CALL=ENTER_PROCEDURE

*	If Increment Subroutines by ... is not set then start at Progid & increment by one else use the increment.
%IF #INCRSUBNUMBER=#FUNNY %THEN #SUBROUTINE=SUBROUTINE+#SUBNOSTART %ELSE #SUBROUTINE=(SUBROUTINE*#INCRSUBNUMBER)+#SUBNOSTART

%IF MASK=1 @SKIP
%IF #MACRO=32 @SKIP; Translate
%IF #MACRO=35 @SKIP; Repeat Machining

*Check for hole cyclesub, retrieve stored value
#HOLECYCLE2=SUBROUTINE+1000
#HOLECYCLE2=UARRAY1(#HOLECYCLE2)
%IF #HOLECYCLE2=0 @CONTINUE ; Not Canned Holes
%IF #CYCLEPOINTS=3 @SKIP ; All points
%IF LAST<2 @END
%GOTO @SKIP

*Output approach move for first call, not translated calls
@CONTINUE
#XMOVE=NEXTXMOVE
#YMOVE=NEXTYMOVE
#ZMOVE=NEXTZMOVE
#FEED=NEXTXYFEED

* Force output if coordinate has changed
* Found to be necessary for some templates, inculding S840
%IF #MACRO<>59 @SKIP59
%IF #XMOVE<>#XHOLD %THEN %CANCEL=#XMOVE
%IF #YMOVE<>#YHOLD %THEN %CANCEL=#YMOVE
%IF #ZMOVE<>#ZHOLD %THEN %CANCEL=#ZMOVE
@SKIP59

%IF #INCRSUBS=0 @SKIP
* Inserted move, only for incremental subroutines
#ROT2=ROT2
#ROT1=ROT1
%CALL=PT_OUTPUT_FEED


@SKIP

%CANCEL=STARTSUB,ENDSUB
%CALL=CODECON_SUBROUTINE-CALL

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*
*		            		********************************
*									Subroutine End
*							********************************
*
%PROCEDURE=PT_OUTPUT_SUBEND
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_SUBEND:%CALL=ENTER_PROCEDURE

*	If Increment Subroutines by ... is not set then start at Progid & increment by one else use the increment.
%IF #INCRSUBNUMBER=#FUNNY %THEN #SUBROUTINE=SUBROUTINE+#SUBNOSTART %ELSE #SUBROUTINE=(SUBROUTINE*#INCRSUBNUMBER)+#SUBNOSTART

%IF MASK=1 %THEN %GOTO @SKIP
*	If using incremental subroutines only, it is necessary to hardcode a G90 on extra Sequence definition line

%IF #INCRXYZHOLD=1 %THEN #ABSINC=DATA1(48) %ELSE #ABSINC=DATA1(47)

%CALL=CODECON_SUBROUTINE-END

%IF #INCRXYZHOLD=1 %THEN #INCRXYZ=1 %ELSE #INCRXYZ=0	;	Reset main program to original abs/incr state

%IF #RESTARTSUBSBNUM=1 %THEN #BNUM=#BNUMHOLD			;	Restart Block numbering for Subprograms - re-instate sequence number
@SKIP
ENDSUB=#BNUM
* Store HOLECYCLE2 flag for this subroutine
%IF MASK=0 @ENDALL
#TEMP=SUBROUTINE+1000
UARRAY1(#TEMP)=#HOLECYCLE2

@ENDALL
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*
*

%PROCEDURE=PT_OUTPUT_G54_TO_TABLE_CENTRE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_OUTPUT_G54_TO_TABLE_CENTRE:%CALL=ENTER_PROCEDURE

*	Procedure only applicable to Rotary Table configurations.
*	Must be in Procmill.cgi since called from within Set Work Datums
*
%IF #G54FROMHOME=0 @END		;	Option not required.

XSUB=XHOME*-1:YSUB=YHOME*-1:ZSUB=ZHOME*-1

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=PT_REMOVE_DUPLICATE_TOOLS
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_REMOVE_DUPLICATE_TOOLS:%CALL=ENTER_PROCEDURE

#TMP=1:#TMP2=POSITION

@TOP
%IF #HEADER=#TMP @END
%LOAD=#TMP

%IF #TMP2=POSITION %THEN #TMP1=1:%GOTO @END
#TMP=#TMP+1
%GOTO @TOP

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*************************************************************


%PROCEDURE=PT_LEAD_OUT
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_LEAD_OUT:%CALL=ENTER_PROCEDURE
*************************************************************
*	Purpose	:	To set number of moves in Lead out sequence	*
*	Called	:	when processing a Feed or Arc move which is	*
*				the first move of the Lead out sequence		*
*				Subfunct=2									*
*															*
*************************************************************
**************************************
*	Lead Out permutations
**************************************
*
#LEADOUTCOUNT=FIELD12
*
* Check FIELD12 lies in range 1-3
%IF FIELD12<1 @ERROR
%IF FIELD12>3 @ERROR
%GOTO @CONTINUE

@ERROR
$WARNING="Warning - Cutter Compensation active - Lead out invalid":%CALL=CODECON_WARNING


@CONTINUE
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

*************************************************************

%PROCEDURE=PT_SET_ATTACHMENT
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SET_ATTACHMENT:%CALL=ENTER_PROCEDURE
* Called from Core Toolchange, Manual Toolchange and Index

#MOUNTANG=MOUNTANGLE ; Attachment Mounting Angle
#HEADANG=HEADANGLE  ; Head Attachment Angle

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_CYCLDEF        ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=PT_CYCLDEF
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_CYCLDEF:%CALL=ENTER_PROCEDURE

%IF $OUTPUTSUBS=TRUE @FINISH-CYCLDEF	;	Miss CYCL DEF if expanding subroutine
* <Type  [$CYCLETYPE]>
*	Call CYCL DEF for each cycle type
%IF $CYCLETYPE=DRILL %THEN %CALL=CODECON_DRILL-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=COUNTERBORE %THEN %CALL=CODECON_COUNTERBORE-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=PECKDRILL %THEN %CALL=CODECON_PECK-DRILL-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=TAPPING %THEN %CALL=CODECON_TAPPING-CYCLE:%GOTO @FINISH-CYCLDEF
* %IF $CYCLETYPE=RIGIDTAPPING %THEN %CALL=CODECON_RIGID-TAP-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=REAMBORE %THEN %CALL=CODECON_REAM-BORE-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=BORE %THEN %CALL=CODECON_BORE-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=CHIPBREAK %THEN %CALL=CODECON_CHIPBREAK-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=BACKBORE %THEN %CALL=CODECON_BACKBORE-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=BACKFACE %THEN %CALL=CODECON_BACKFACE-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=HELICAL %THEN %CALL=CODECON_HELICAL-CYCLE:%GOTO @FINISH-CYCLDEF
%IF $CYCLETYPE=THREAD %THEN %CALL=PT_THRD_CANNED675

@FINISH-CYCLDEF

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_BBORE_CHANGE        ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=PT_BBORE_CHANGE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_BBORE_CHANGE:%CALL=ENTER_PROCEDURE
* Called by Attribute macro to control spindle for backbore and backface


%IF SUBFUNCT=203 @FACE

%IF FIELD5=2 %THEN %CALL=CODECON_BBCHANGE_A:#SPINWARN=0:%GOTO @ENDM
%IF FIELD5=3 %THEN %CALL=CODECON_BBCHANGE_C:#SPINWARN=#SPINWARNSAVE:%GOTO @ENDM
%IF FIELD5=1 %THEN %CALL=CODECON_BBCHANGE_R:#SPINWARN=0
%GOTO @ENDM

@FACE
%IF FIELD5=2 %THEN %CALL=CODECON_BFCHANGE_A:#SPINWARN=0:%GOTO @ENDM
%IF FIELD5=3 %THEN %CALL=CODECON_BFCHANGE_C:#SPINWARN=#SPINWARNSAVE:%GOTO @ENDM
%IF FIELD5=1 %THEN %CALL=CODECON_BFCHANGE_R:#SPINWARN=0

@ENDM
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_RAPID_TO_HOME_TOOLCHANGEÃÄÄÄ
;                                ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_RAPID_TO_HOME_TOOLCHANGE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_RAPID_TO_HOME_TOOLCHANGE:%CALL=ENTER_PROCEDURE


*
* Modified for adaptive templates to have a procedure for first leg
* and a second procedure called by a token for the second leg
*
*	Handles Rapid to Home strategies e.g. Xfirst, Zfirst
*	No automation depending on tool type i.e. User must program Xfirst
*
* Axis Fixed
* FIELD 1 = 1 = X FIXED	(remain at current location	)
* FIELD 3 = 1 = Z FIXED	(	"		"		"		)
*
* Axis Priority
* FIELD 4 = 0 = None
*			1 = XFIRST
*			2 = YFIRST
*           3 = ZFIRST

%IF #FEEDRAPIDS=1 %THEN #GCODE=DATA1(2):#FEED=#RAPIDFEEDRATE %ELSE #GCODE=DATA1(1):#FEED=#FUNNY   ;	All Rapids are being converted to feeds

#XZERO=0:#YZERO=0:#ZZERO=0 ; For G28 style

*;IF TEMPLATE=MPLMILL^4AXMILL^5AXMILL
*%IF MILLMODE=1 @PLANAR
*%IF CAXIS<>1 @PLANAR
** Holes differ from mill - use separate flags to determine
** if the move to tc should be rotary or planar
*%IF #HOLECYCLE3=1 @HOLES
** Milling
*%IF #ROTARYCARTESIAN=1 @PLANAR
*%GOTO @MILLING
*@HOLES
*%IF #ROTARYCARTESIANHOLE=1 @PLANAR
*@MILLING
*%IF ACTIVELINEARAXIS<1 @PLANAR
*%IF ACTIVELINEARAXIS>2 @PLANAR
*%IF ACTIVELINEARAXIS=1 %THEN #XKEEP=#RKEEP*ACTIVELINEARAXISSIDE : #YKEEP=0 %ELSE #XKEEP=0 : #YKEEP=#RKEEP*ACTIVELINEARAXISSIDE ; the static axis was at 0
*@PLANAR
*;ENDIF

* Fixed coords
%IF FIELD1=1 %THEN #XMOVE=#XKEEP:#XZERO=#FUNNY ; no move
%IF FIELD2=1 %THEN #YMOVE=#YKEEP:#YZERO=#FUNNY ; no move
%IF FIELD3=1 %THEN #ZMOVE=#ZKEEP:#ZZERO=#FUNNY ; no move

#TMP1=#XMOVE:#TMP2=#YMOVE:#TMP3=#ZMOVE

;********* FIELD4 0=NO PRIORITY, 1=X FIRST, 2=Y FIRST, 3=Z FIRST
%IF FIELD4=0 %THEN #MOVE=1:%GOTO @CALL ; No preference - one move only
%IF FIELD4=1 %THEN #YMOVE=#YKEEP:#YZERO=#FUNNY:#ZMOVE=#ZKEEP:#ZZERO=#FUNNY:#MOVE=1
%IF FIELD4=2 %THEN #XMOVE=#XKEEP:#XZERO=#FUNNY:#ZMOVE=#ZKEEP:#ZZERO=#FUNNY:#MOVE=1
%IF FIELD4=3 %THEN #XMOVE=#XKEEP:#XZERO=#FUNNY:#YMOVE=#YKEEP:#YZERO=#FUNNY:#MOVE=1
*

@CALL
%CALL=NOMOTION
%CALL=PT_REVERSE_XYZ
%IF #MACRO=40 %THEN %CALL=CODECON_RAPID-TO-HOME
%IF #MACRO=41 %THEN %CALL=CODECON_RAPID-TO-TOOLCHANGE

@END
#XMOVE=#TMP1:#YMOVE=#TMP2:#ZMOVE=#TMP3
%CALL=HOLD
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_RAPID_TO_HOME_TOOLCHANGE_2
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_RAPID_TO_HOME_TOOLCHANGE_2:%CALL=ENTER_PROCEDURE
* Called via token to create second leg of move


%IF #FEEDRAPIDS=1 %THEN #GCODE=DATA1(2):#FEED=#RAPIDFEEDRATE %ELSE #GCODE=DATA1(1):#FEED=#FUNNY   ;	All Rapids are being converted to feeds

#XZERO=0:#YZERO=0:#ZZERO=0 ; For G28 style

%CALL=HOLD
#XMOVE=#TMP1:#YMOVE=#TMP2:#ZMOVE=#TMP3
;********* FIELD4 0=NO PRIORITY, 1=X FIRST, 2=Y FIRST, 3=Z FIRST
%IF FIELD4=0 %THEN #MOVE=1:%GOTO @END ; No preference - one move only

#MOVE=2
%IF FIELD1=1 %THEN #XMOVE=#XKEEP:#XZERO=#FUNNY
%IF FIELD2=1 %THEN #YMOVE=#YKEEP:#YZERO=#FUNNY
%IF FIELD3=1 %THEN #ZMOVE=#ZKEEP:#ZZERO=#FUNNY
%IF FIELD4=1 %THEN #XZERO=#FUNNY
%IF FIELD4=2 %THEN #YZERO=#FUNNY
%IF FIELD4=3 %THEN #ZZERO=#FUNNY

#MOVE=0
%IF #XMOVE<>#XKEEP %THEN #MOVE=#MOVE+1
%IF #YMOVE<>#YKEEP %THEN #MOVE=#MOVE+1
%IF #ZMOVE<>#ZKEEP %THEN #MOVE=#MOVE+1
%IF #MOVE=0 @END ; No move needed
*
%CALL=NOMOTION
%CALL=PT_REVERSE_XYZ
%IF #MACRO=40 %THEN %CALL=CODECON_RAPID-TO-HOME-2
%IF #MACRO=41 %THEN %CALL=CODECON_RAPID-TO-TOOLCHANGE-2

@END
#XMOVE=#TMP1:#YMOVE=#TMP2:#ZMOVE=#TMP3
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_COUNT_PECKS    ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_COUNT_PECKS
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_COUNT_PECKS:%CALL=ENTER_PROCEDURE

* Calculates number of pecks/chipbreaks in cycle
* Called from Token
#NPECKS=1
%IF DEGR=0 @END
%IF DEGR=#FUNNY @END

#TMP1=ABS(#ZMOVE-ZLEVEL)  ; Remaining depth
#TMP2=ABS(DEPTH)  ; This peck
%IF #TMP2>#TMP1 @END

#TMP1=#TMP1-#TMP2

@LOOP
#TMP2=#TMP2-DEGR
%IF #TMP2<DEGR %THEN #TMP2=DEGR
#TMP1=#TMP1-#TMP2
#NPECKS=#NPECKS+1
%IF #TMP1>0 @LOOP

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_SET_TLO        ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_SET_TLO
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SET_TLO:%CALL=ENTER_PROCEDURE

%IF TOOLOFFSET=0 @DEFAULTS
%IF TOOLOFFSET=#FUNNY @DEFAULTS
#HCODE=TOOLOFFSET ;Use entered value if available
%GOTO @END

@DEFAULTS
* Nothing specified, use defaults
%IF #AUTOTLO=1 %THEN #HCODE=POSITION+#MAXTOOLS1
%IF #AUTOTLO=2 %THEN #HCODE=POSITION
%IF #AUTOTLO=3 %THEN #HCODE=#MAXTOOLS1+#TOOLCOUNT

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_WARNING_COUNT  ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_WARNING_COUNT
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_WARNING_COUNT:%CALL=ENTER_PROCEDURE

%IF #WARNCOUNT=0 @END
$TEMP=99
%OPTIONS=Errors or Warnings in NC data file^OK=#TMP

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_SPINDLE        ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_GEAR_MCODE     ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=PT_GEAR_MCODE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_GEAR_MCODE:%CALL=ENTER_PROCEDURE

#TEMP=GEAR(0) ; Set sys var for gears
%IF #TEMP=0 %THEN $WARNING="ERROR : Gear ranges not set":%CALL=CODECON_WARNING

* Check speed
* Get machine maximum speed from highest gear
#TEMP=GEAR(NUMGEARS)
#MACHINEMAXRPM=GEARMAXRPM
#GEARMCODE=GEARCODE
* Check speed in range for spindle
%IF #SPEED>#MACHINEMAXRPM %THEN $WARNING="Error - Speed out of range":%CALL=CODECON_WARNING:%GOTO @END

* Get details for first gear
#GEAR=1
#TEMP=GEAR(#GEAR)
#MACHINEMINRPM=GEARMINRPM
#GEARMCODE=GEARCODE
* Check speed in range for spindle
%IF #SPEED<#MACHINEMINRPM %THEN $WARNING="Error - Speed out of range":%CALL=CODECON_WARNING:%GOTO @END

*Reset to current gear
#TEMP=GEAR(GEAR)
* <NUMGEARS [NUMGEARS=0]  GEARMINRPM [GEARMINRPM=0]>
#GEARMCODE=#FUNNY
%IF NUMGEARS=1 @END

%IF #AUTOGEAR<>1 @SELECT_GEAR_MCODE

@FIND_GEAR
#GEAR=1

@RPM_LOOP
#TEMP=GEAR(#GEAR)                    ; Select gear
%IF #SPEED<=GEARMAXRPM @SELECT_GEAR_MCODE ; Speed in range ?
%IF #GEAR=NUMGEARS @SELECT_GEAR_MCODE  ; Last gear ?

#GEAR=#GEAR+1:%GOTO @RPM_LOOP	   ; Select next gear

@SELECT_GEAR_MCODE
#GEARMCODE=#FUNNY
%IF NUMGEARS=1 @END
#GEARMCODE=GEARCODE

*	Warn if Gear Range selected greater than defined in Spindle Tab
%IF #GEAR>NUMGEARS %THEN $WARNING="ERROR : Higher gear selected than is configured for this machine":%CALL=CODECON_WARNING

* Check speed in range for gear
* GEARMAXRPM,GEARMINRPM  limits for this gear on this spindle
%IF #SPEED<GEARMINRPM %THEN $WARNING="Warning - Speed out of range for selected gear.":%CALL=CODECON_WARNING
%IF #SPEED>GEARMAXRPM %THEN $WARNING="Warning - Speed out of range for selected gear.":%CALL=CODECON_WARNING


@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_TAPPING_REVERSE    ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_TAPPING_REVERSE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_TAPPING_REVERSE:%CALL=ENTER_PROCEDURE
* Called by Attribute macro to reverse spindle when longhand tapping

#DWELLGCODE=DATA1(5)
%IF FIELD5=2 %THEN %CALL=CODECON_TAPREV_T:%GOTO @ENDM
%IF FIELD5=1 %THEN %CALL=CODECON_TAPREV_B
#SKIPTAP=1
@ENDM
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_ZCLEAR            ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_ZCLEAR
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ZCLEAR:%CALL=ENTER_PROCEDURE
* Called by token to calculate clearance value

%IF #MACRO=37 @THREADMILL

* Hole cycles
#TMPCLEAR=ZCLEAR*#ZREVERSE
%IF #CLEARTYPE=2 %THEN #TMPCLEAR=#TMPCLEAR-#ZLEVEL
%GOTO @ENDM

@THREADMILL
* Threadmill has different system variables
#TMPCLEAR=FIELD1*#ZREVERSE
%IF #CLEARTYPE=2 %THEN #TMPCLEAR=#TMPCLEAR-FIELD4

@ENDM
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM



;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Circle centre checking proceduresÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

%PROCEDURE=CENTRE_TOL
%IF #PROCTRACE=1 %THEN $PROCEDURE=CENTRE_TOL:%CALL=ENTER_PROCEDURE
* Control procendure for centre position checking
%IF #CENTREFIX=0 @ENDALL
%IF MILLMODE=0 @ENDALL ; not checking rotary arcs for now
* Set temporary variables according to plane of arc
%IF XYPLANE=0 @G17
%IF XYPLANE=1 @G18
@G19
#XTEMP1=#YSTART
#XTEMP2=#YMOVE
#TEMPXCENTRE=#YCENTRE
#YTEMP1=#ZSTART
#YTEMP2=#ZMOVE
#TEMPYCENTRE=#ZCENTRE
* <G19 Start [#XTEMP1=0][#YTEMP1=1]>
* <End [#XTEMP2=0][#YTEMP2=1]>
* <Centre [#TEMPXCENTRE=0][#TEMPYCENTRE=1]  Radius=[#RADIUS=13]>
%GOTO @READY

@G18
#XTEMP1=#XSTART
#XTEMP2=#XMOVE
#TEMPXCENTRE=#XCENTRE
#YTEMP1=#ZSTART
#YTEMP2=#ZMOVE
#TEMPYCENTRE=#ZCENTRE
* <G18 Start [#XTEMP1=0][#YTEMP1=1]>
* <End [#XTEMP2=0][#YTEMP2=1]>
* <Centre [#TEMPXCENTRE=0][#TEMPYCENTRE=1]  Radius=[#RADIUS=13]>
%GOTO @READY

@G17
#XTEMP1=#XSTART
#XTEMP2=#XMOVE
#TEMPXCENTRE=#XCENTRE
#YTEMP1=#YSTART
#YTEMP2=#YMOVE
#TEMPYCENTRE=#YCENTRE
* <G17 Start [#XTEMP1=0][#YTEMP1=1]>
* <End [#XTEMP2=0][#YTEMP2=1]>
* <Centre [#TEMPXCENTRE=0][#TEMPYCENTRE=1]  Radius=[#RADIUS=13]>

@READY
#CENTRETOL=RESOLUTION/2
%CALL=CENTRE_TOL_SHIFT:%IF #BADRAD=0 @END
#CENTRETOL=RESOLUTION
%CALL=CENTRE_TOL_SHIFT:%IF #BADRAD=0 @END
#CENTRETOL=RESOLUTION*1.5
%CALL=CENTRE_TOL_SHIFT:%IF #BADRAD=0 @END
$WARNING="Warning ARC CENTRE OUT OF TOLERANCE, Unable to Correct":%CALL=CODECON_WARNING
%GOTO @ENDALL

@END
* Reset Output Variables according to plane of arc
%IF XYPLANE=0 %THEN #XCENTRE=#TEMPXCENTRE:#YCENTRE=#TEMPYCENTRE
%IF XYPLANE=1 %THEN #XCENTRE=#TEMPXCENTRE:#ZCENTRE=#TEMPYCENTRE
%IF XYPLANE=2 %THEN #YCENTRE=#TEMPXCENTRE:#ZCENTRE=#TEMPYCENTRE
*
@ENDALL
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=CENTRE_TOL_SHIFT
%IF #PROCTRACE=1 %THEN $PROCEDURE=CENTRE_TOL_SHIFT:%CALL=ENTER_PROCEDURE
*
* Shifts centre by +- Precision alternately to improve fit
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
* Output message if in Con Debug mode
%IF $CONDEBUG=N @NO_CON-DEBUG
<*****	Arc Centre Nudging activated *****>
@NO_CON-DEBUG
#TEMPXCENTRE=#TEMPXCENTRE+#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
#TEMPYCENTRE=#TEMPYCENTRE+#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
#TEMPXCENTRE=#TEMPXCENTRE-#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
#TEMPXCENTRE=#TEMPXCENTRE-#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
#TEMPYCENTRE=#TEMPYCENTRE-#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
#TEMPYCENTRE=#TEMPYCENTRE-#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
#TEMPXCENTRE=#TEMPXCENTRE+#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
#TEMPXCENTRE=#TEMPXCENTRE+#INCR
%CALL=CHECK_CENTRE_TOL:%IF #BADRAD=0 @END
*
** Set centre back to original position **
* Changes here for W43524
%IF XYPLANE=0 %THEN #TEMPXCENTRE=#XCENTRE:#TEMPYCENTRE=#YCENTRE
%IF XYPLANE=1 %THEN #TEMPXCENTRE=#XCENTRE:#TEMPYCENTRE=#ZCENTRE
%IF XYPLANE=2 %THEN #TEMPXCENTRE=#YCENTRE:#TEMPYCENTRE=#ZCENTRE

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=CHECK_CENTRE_TOL
%IF #PROCTRACE=1 %THEN $PROCEDURE=CHECK_CENTRE_TOL:%CALL=ENTER_PROCEDURE
* Checks distances from start to centre and from end to centre against radius
* <Centre [#TEMPXCENTRE=0][#TEMPYCENTRE=1]>
* <CHECK_CENTRE_START>
#BADRAD=0
#XDIST=#XTEMP1-#TEMPXCENTRE:#XDIST=ABS(#XDIST):#XDIST=#XDIST*#XDIST
#YDIST=#YTEMP1-#TEMPYCENTRE:#YDIST=ABS(#YDIST):#YDIST=#YDIST*#YDIST
#DIST=#XDIST+#YDIST:#DIST=SQR(#DIST)
#DIST=#DIST/RESOLUTION:#DIST=#DIST+0.5:#DIST=INT(#DIST):#DIST=#DIST*RESOLUTION
* <DIST1= [#DIST=0]>
#RADERROR=#ABSRADIUS-#DIST:#RADERROR=ABS(#RADERROR)
%IF #RADERROR>=#CENTRETOL %THEN #BADRAD=1:%GOTO @END
* <* WARNING - ROUNDED START RAD ERROR =[#RADERROR=5] - RETRY......>
* <* CC [XCENTRE=3] [YCENTRE=4]>
* <* C [XEND=3] [YEND=4]>
*
* <CHECK_CENTRE_END>
#XDIST=#XTEMP2-#TEMPXCENTRE:#XDIST=ABS(#XDIST):#XDIST=#XDIST*#XDIST
#YDIST=#YTEMP2-#TEMPYCENTRE:#YDIST=ABS(#YDIST):#YDIST=#YDIST*#YDIST
#DIST=#XDIST+#YDIST:#DIST=SQR(#DIST)
#DIST=#DIST/RESOLUTION:#DIST=#DIST+0.5:#DIST=INT(#DIST):#DIST=#DIST*RESOLUTION
* <DIST2= [#DIST=0]>
#RADERROR=#ABSRADIUS-#DIST:#RADERROR=ABS(#RADERROR)
%IF #RADERROR>=#CENTRETOL %THEN #BADRAD=1
* <* WARNING - ROUNDED END RAD  ERROR =[#RADERROR=5] - RETRY......>
* <* CC2 [XCENTRE=3] [YCENTRE=4]>
* <* C [XEND=3] [YEND=4]>
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%DECLARE=$DEPTHDIR

%PROCEDURE=PT_GET_HOLE_POSITION
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_GET_HOLE_POSITION:%CALL=ENTER_PROCEDURE
* Reads hole array and modifies data for angled head and planar/rotary setting
* #LOOP array pointer must be set before calling

#XMOVE=XPOINT(#LOOP)
#YMOVE=YPOINT(#LOOP)
#ZMOVE=ZCLEAR
$DEPTHDIR="Z"
#PLANEGCODE=DATA1(13)


*******************************************
@PLANAR
*******************************************
#ROT1=ROT1
#ROT2=ROT2
*
*
%IF CPLPLANE=5 @END ; Aligned with Spindle
%IF CPLPLANE=6 @END
#CUBICCOORDS=0 @END
%IF MCOORD=0 @END
%IF CPLPLANE=0 @END ; Non-orthogonal
*
* For angled heads and MC coordinates
* XY axes may be XZ or YZ on machine
%IF CPLPLANE=1 %THEN #ZMOVE=XPOINT(#LOOP):#XMOVE=ZCLEAR*#XREVERSE:$DEPTHDIR="X":#PLANEGCODE=DATA1(15):%GOTO @END
%IF CPLPLANE=2 %THEN #ZMOVE=XPOINT(#LOOP):#XMOVE=ZCLEAR*#XREVERSE:$DEPTHDIR="X":#PLANEGCODE=DATA1(15):%GOTO @END
%IF CPLPLANE=3 %THEN #ZMOVE=YPOINT(#LOOP):#YMOVE=ZCLEAR*#YREVERSE:$DEPTHDIR="Y":#PLANEGCODE=DATA1(14):%GOTO @END
%IF CPLPLANE=4 %THEN #ZMOVE=YPOINT(#LOOP):#YMOVE=ZCLEAR*#YREVERSE:$DEPTHDIR="Y":#PLANEGCODE=DATA1(14)
*

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_SET_HOLE_OFFSET
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SET_HOLE_OFFSET:%CALL=ENTER_PROCEDURE
* Sets hole offset for machine coordinates
* Called from tool change, index and move angular
*
#HOLEOFFSET=0
%IF #TLOCOMP=0 @END
#HOLEOFFSET=HEAD2TURRETZ
%IF MCOORD=0 @END
%IF CPLPLANE=1 %THEN #HOLEOFFSET=HEAD2TURRETX:%GOTO @END
%IF CPLPLANE=2 %THEN #HOLEOFFSET=HEAD2TURRETX:%GOTO @END
%IF CPLPLANE=3 %THEN #HOLEOFFSET=HEAD2TURRETY:%GOTO @END
%IF CPLPLANE=4 %THEN #HOLEOFFSET=HEAD2TURRETY
*
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_RESET_SPINDLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_RESET_SPINDLE:%CALL=ENTER_PROCEDURE
* Intermediate procedure for token call
* Avoids +- error when token action interpreted

%CALL=PMACRO-252

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_CHECK_TAPPING
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_CHECK_TAPPING:%CALL=ENTER_PROCEDURE
* Check that cycle tap type matches tool tap type if set.
* USERVAR3 set by cycle 1=Float, 2=Rigid
* TAPTYPE set by Toolchange, 0=Unset, 1=Float, 2=Rigid

#DEPTH=DEPTH
%IF #DEPTH=0 %THEN #DEPTH=#FUNNY
%IF #DEPTH=#FUNNY @NOPECK
%IF #LHPECKTAP=1 %THEN %NOCYCLE

@NOPECK
#TAPTYPE=USERVAR3 ; Cycle value
%IF TAPTYPE=0 @END ; Tool not set
%IF TAPTYPE=USERVAR3 @END ; Compatible
* TAPTYPE over-rules USERVAR3
#TAPTYPE=TAPTYPE
%IF #TAPWARN=0 @END
$WARNING="Warning - Tap cycle type incompatible":%CALL=CODECON_WARNING

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


%PROCEDURE=PT_ROUND_VALUE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ROUND_VALUE:%CALL=ENTER_PROCEDURE
*  #TEMPROUND - value being worked on
*  #TEMPSIGN - holding variable for sign
* general purpose routine to round a value within precision limit
* Created to allow for positive and negative values

%IF #TEMPROUND<0 @NEG
* Round positive values
#TEMPROUND=#TEMPROUND*#PRECISION
#TEMPROUND=#TEMPROUND+0.5
#TEMPROUND=INT(#TEMPROUND)
#TEMPROUND=#TEMPROUND/#PRECISION
%GOTO @END

@NEG
* Round negative values
#TEMPSIGN=-1
#TEMPROUND=#TEMPROUND*#TEMPSIGN
#TEMPROUND=#TEMPROUND*#PRECISION
#TEMPROUND=#TEMPROUND+0.5
#TEMPROUND=INT(#TEMPROUND)
#TEMPROUND=#TEMPROUND/#PRECISION
#TEMPROUND=#TEMPROUND*#TEMPSIGN

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

%PROCEDURE=PT_ROUND_ANGLE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_ROUND_ANGLE:%CALL=ENTER_PROCEDURE
*  #TEMPROUND - value being worked on
*  #TEMPSIGN - holding variable for sign
* general purpose routine to round a value within precision limit
* Created to allow for positive and negative values
* Angular values should not be subjected to linear precision, since the linear varies for inch and metric

%IF #TEMPROUND<0 @NEG
* Round positive values
#TEMPROUND=#TEMPROUND*#ANGPRECISION
#TEMPROUND=#TEMPROUND+0.5
#TEMPROUND=INT(#TEMPROUND)
#TEMPROUND=#TEMPROUND/#ANGPRECISION
%GOTO @END

@NEG
* Round negative values
#TEMPSIGN=-1
#TEMPROUND=#TEMPROUND*#TEMPSIGN
#TEMPROUND=#TEMPROUND*#ANGPRECISION
#TEMPROUND=#TEMPROUND+0.5
#TEMPROUND=INT(#TEMPROUND)
#TEMPROUND=#TEMPROUND/#ANGPRECISION
#TEMPROUND=#TEMPROUND*#TEMPSIGN

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_CONTROL_FEEDTYPE    ÃÄÄÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
%PROCEDURE=PT_CONTROL_FEEDTYPE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_CONTROL_FEEDTYPE:%CALL=ENTER_PROCEDURE
* Force Feedtype if required
* Unchanged, Force FPR, Force FPM
* might need -- #THRDFLAG is set 0 at toolchange and 1 for tap cycle, 2 for threading cycle


* Skip for 5AX Inverse time feed
%IF FIVEAXIS=1 @5ON
%GOTO  @CONTINUE  ; Not 5 axis
@5ON
%IF #AX5INVTIME=1 @ENDM   ; Inverse time feeds

@CONTINUE
* Defaults
#FEEDMODEGCODE=DATA1(45)
%IF FEEDTYPE=2 %THEN #FEEDMODEGCODE=DATA1(46)

* Split by #MACRO and process
%IF #MACRO=2 @MILL  ; Linear
%IF #MACRO=53 @MILL ; Arc
%IF #MACRO=54 @MILL ; Arc
%IF #MACRO=1 @MILL  ; Uncoverted rapid
%IF #MACRO=9 %THEN #FEED=ZFEED:%GOTO @DRILL   ; Drill
%IF #MACRO=10 %THEN #FEED=ZFEED:%GOTO @DRILL  ; Chip Break
%IF #MACRO=11 %THEN #FEED=ZFEED:%GOTO @DRILL  ; Ream/Bore
%IF #MACRO=12 %THEN #FEED=ZFEED:%GOTO @BORE   ; Bore
%IF #MACRO=13 %THEN #FEED=ZFEED:%GOTO @TAP    ; Tap
%IF #MACRO=671 %THEN #FEED=ZFEED:%GOTO @BORE  ; Back Bore
%IF #MACRO=675 %THEN #FEED=XYFEED:%GOTO @THRD  ; Thread Mill Canned
%IF #MACRO<>37 @MILL
; #MACRO=672 ; Helical Hole @MILL
* Old Thread Mill
%IF #THREADCANNED=2 @THRD

@MILL
* <Mill>
%IF #FTYPEMILL=0 @NOCH ; No Change
%IF #FTYPEMILL=1 @CONVERT_FPR
%GOTO @CONVERT_FPM
*
@TAP
* Tapping cycles and longhand
* Longhand might need another flag of some kind
%IF #TAPTYPE=1 @FLOAT-TAP
* Rigid tap
%IF #FTYPETAPRIG=0 @ENDM ; No Change
%IF #FTYPETAPRIG=1 @CONVERT_FPR
%IF #FTYPETAPRIG=2 @CONVERT_FPM
* #FTYPETAPRIG=3 as floating

@FLOAT-TAP
* Floating tap
%IF #FTYPETAP=0 @ENDM ; No Change
%IF #FTYPETAP=1 @CONVERT_FPR
%GOTO @CONVERT_FPM
*
@THRD
* <Thread Mill Canned #FTYPETHRD=[#FTYPETHRD=13]>
* Drilling cycles and longhand
%IF #FTYPETHRD=0 @NOCH ; No Change
%IF #FTYPETHRD=1 @CONVERT_FPR
%GOTO @CONVERT_FPM
*
@DRILL
* <drill>
* Drilling cycles and longhand
%IF #FTYPEDRILL=0 @NOCH ; No Change
%IF #FTYPEDRILL=1 @CONVERT_FPR
%GOTO @CONVERT_FPM
*
@BORE
* <bore>
* Boring cycles and longhand
%IF #FTYPEBORE=0 @NOCH ; No Change
%IF #FTYPEBORE=1 @CONVERT_FPR
%GOTO @CONVERT_FPM

*
* FPM Wanted
@CONVERT_FPM
* <@CONVERT_FPM #SPEED=[#SPEED=13]>
#FEEDMODEGCODE=DATA1(45)

%IF FEEDTYPE=1 @END_FPM
%IF #CONVERTEDMOVE=1 @END_FPM ; Converted move already FPM
%IF #MACRO=37 @END_FPM ; Thread mill already FPM
* Convert Feed
#FEED=#FEED*#SPEED
%GOTO @END_FPM
*
@CONVERT_FPR
* <@CONVERT_FPR  #SPEED=[#SPEED=13]>
%IF #SPEED=0 @ENDM ; Protect against spindle stop
* FPR Wanted
#FEEDMODEGCODE=DATA1(46)
%IF #CONVERTEDMOVE=1 @JUMP ; Converted move in FPM
%IF #MACRO=37 @JUMP ; Thread mill already FPM
%IF FEEDTYPE=2 @END_FPR
@JUMP
* Convert Feed
#FEED=#FEED/#SPEED
%GOTO @END_FPR
*
@NOCH
%IF FEEDTYPE=2 @END_FPR
*
@END_FPM
#FEED=#FEED*#TIMESFPM
%GOTO @ENDM
*
@END_FPR
#FEED=#FEED*#TIMESFPR
*
@ENDM
%IF #FEED=0 %THEN #FEED=#FUNNY ; Suppress F0 output
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_SPINDLE_REVERSE ÃÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

%PROCEDURE=PT_SPINDLE_REVERSE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SPINDLE_REVERSE:%CALL=ENTER_PROCEDURE
*	Reverse the current spindle direction : called from Tapping when emulating a cycle

%IF #DIRECTION=DATA2(6) %THEN #DIRECTION=DATA2(5):%GOTO @END 	;	Forward	->	Reverse
%IF #DIRECTION=DATA2(5) %THEN #DIRECTION=DATA2(6):%GOTO @END 	;	Reverse	->	Forward
%IF #DIRECTION=DATA2(14) %THEN #DIRECTION=DATA2(15):%GOTO @END
%IF #DIRECTION=DATA2(15) %THEN #DIRECTION=DATA2(14)

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_PLANE_INIT      ÃÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

%PROCEDURE=PT_PLANE_INIT
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_PLANE_INIT:%CALL=ENTER_PROCEDURE
*	Initialise Plane G code according to Spindle Orientation

%IF MCOORD=0 %THEN #PLANEGCODE=DATA1(13):%GOTO @END
%IF CPLPLANE=5 %THEN  #PLANEGCODE=DATA1(13):%GOTO @END
%IF CPLPLANE=0 %THEN  #PLANEGCODE=DATA1(13):%GOTO @END
%IF CPLPLANE=1 %THEN  #PLANEGCODE=DATA1(15):%GOTO @END
%IF CPLPLANE=2 %THEN  #PLANEGCODE=DATA1(15):%GOTO @END
%IF CPLPLANE=3 %THEN  #PLANEGCODE=DATA1(14):%GOTO @END
%IF CPLPLANE=4 %THEN  #PLANEGCODE=DATA1(14):%GOTO @END
%IF CPLPLANE=6 %THEN  #PLANEGCODE=DATA1(13)
*
@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = C_AXIS_SELECT      ÃÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
%PROCEDURE=C_AXIS_SELECT
%IF #PROCTRACE=1 %THEN $PROCEDURE=C_AXIS_SELECT:%CALL=ENTER_PROCEDURE

#HOLECYCLE3=0 ; reset holes flag for rotary processing

%IF MILLMODE=1 %THEN %NOCYCLE		;	Planar mode selected

* Detect if milling is radial or axial rotary
%IF CAXIS<>1 %THEN %NOCYCLE ; non-axial always nocycle
%IF ACTIVELINEARAXIS=#FUNNY %THEN %NOCYCLE ; protect
%IF ACTIVELINEARAXIS=0 %THEN %NOCYCLE ; protect
%IF ACTIVELINEARAXIS>2 %THEN %NOCYCLE ;  protect

* If axial rotary but cartesian output, force nocycle
%IF #ROTARYCARTESIAN=1 %THEN %NOCYCLE

* Decide axial rotary output based on user setting - interpolated or end point
%IF #CAXINTERP=1 %THEN %NOCYCLE %ELSE %CXCYCLE

* If we come here after all, force nocycle to avoid regressions
%NOCYCLE

%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_SPEED_DWELL     ÃÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
%PROCEDURE=PT_SPEED_DWELL
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SPEED_DWELL:%CALL=ENTER_PROCEDURE

* Calculate dwell based on speed change and
* how much RPMs per second the machine can change - #DWELLTIME

%IF #MACRO=1 @END
%IF #DWELLTIME=0 @END

%IF #MACRO=15 %THEN #TMP1=0 %ELSE #TMP1=#SPEEDHOLD
%IF #TMP1=#FUNNY %THEN #TMP1=0
#TMP=#TMP1-#SPEED
#TMP=ABS(#TMP)
#TMP=INT(#TMP)
DWELL=#TMP/#DWELLTIME
%IF DWELL>0 %THEN %CALL=CODECON_DWELL

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM

;                                      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_BREAK_MOVE      ÃÄ
;                                      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
%PROCEDURE=PT_BREAK_MOVE
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_BREAK_MOVE:%CALL=ENTER_PROCEDURE

*** Exit if not appropriate
%IF #MAXMOVE=0 @END
%IF #MAXMOVE=#FUNNY @END
%IF FIVEAXIS=1 @END
%IF #INCRXYZ=1 @END
%IF MILLMODE=0 @END
%IF #EXECMACRO=45 @END

*** Calculate vetorial distance
@DOAGAIN

#XINC=XMOVE-#XKEEP:#YINC=YMOVE-#YKEEP:#ZINC=ZMOVE-#ZKEEP
#ABSXINC=ABS(#XINC):#ABSYINC=ABS(#YINC)
#ABSXINC=#ABSXINC^2:#ABSYINC=#ABSYINC^2:#MLENGTH=#ABSXINC+#ABSYINC:#MLENGTH=SQR(#MLENGTH):#XINC=#MLENGTH	; Store XY distance
#ZINC=ZMOVE-#ZKEEP:#ABSZINC=ABS(#ZINC)
#ABSZINC=#ABSZINC^2:#XINC=#XINC^2:#MLENGTH=#XINC+#ABSZINC:#MLENGTH=SQR(#MLENGTH)

*** End if smaller then specified or if last move
%IF #MLENGTH<=#MAXMOVE %THEN #XMOVE=XMOVE:#YMOVE=YMOVE:#ZMOVE=ZMOVE:%GOTO @END

#PARAMETER=#MLENGTH/#MAXMOVE
#PARAMETER=INT(#PARAMETER)+1

*** Now, break it for one increment

#ABSXINC=XMOVE-#XKEEP:#ABSYINC=YMOVE-#YKEEP:#ABSZINC=ZMOVE-#ZKEEP
#XP1=#ABSXINC/#PARAMETER : #YP1=#ABSYINC/#PARAMETER : #ZP1=#ABSZINC/#PARAMETER

#XMOVE=#XKEEP+#XP1 : #YMOVE=#YKEEP+#YP1 : #ZMOVE=#ZKEEP+#ZP1
#MLENGTH=#MLENGTH-#MAXMOVE

%CALL=NOMOTION
%IF #TOOLCHANGE=0 @CHECK
%IF #FORCEAFTERTC=1 @CHECK2
@CHECK
%IF #MOVE=0 @END
@CHECK2


@COMP
%CALL=PT_COMPENSATE_TLO
%CALL=PT_REVERSE_XYZ

* Checks for CRC
%IF $COMPOUTPUT=TRUE @NO_COMP

%IF #MOVE<>4 @CALL

#COMPDCODE=#FUNNY
%IF #COMPGCODE<>DATA1(20) %THEN #COMPGCODE=#FUNNY ; G41/42 held
%GOTO @NO_COMP  ;Never on Z only move, hold for next move

@CALL
* Turn CRC Off only at the very last move
%IF SUBFUNCT=2 @NO_COMP
%CALL=CRC_HANDLER

@NO_COMP

*	Output Feed move
#COMPTEMP=#COMPDCODE
%IF #COMPGCODE=DATA1(21) @OUTPUT
%IF #COMPGCODE=DATA1(22) @OUTPUT
#COMPDCODE=#FUNNY

@OUTPUT
%IF #TOOLCHANGE=1 @AFTER
%CALL=CODECON_LINEAR-INTERPOLATION
%GOTO @MVCHECK

@AFTER
%IF #3DAFTERTC=1 %THEN %CALL=CODECON_FE-AFTER-TOOLCHANGE:%GOTO @G43DONE
* Output G43 on first Z
#TEMP=#MOVE
%IF #TEMP>16 %THEN #TEMP=#TEMP-16 ; Remove rotary
%IF #TEMP>8 %THEN #TEMP=#TEMP-8
%IF #TEMP<4 %THEN %CALL=CODECON_LINEAR-INTERPOLATION:%GOTO @MVCHECK
* Z Component in move
%CALL=CODECON_Z-AFTER-TC-FEED

@G43DONE
#TOOLCHANGE=0

@MVCHECK
%IF #MOVE=4 %THEN #COMPDCODE=#COMPTEMP

* Loop until complete move is created
%GOTO @DOAGAIN

@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM


;                                  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Procedure = PT_SET_STOP     ÃÄÄÄ
;                                  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

%PROCEDURE=PT_SET_STOP
%IF #PROCTRACE=1 %THEN $PROCEDURE=PT_SET_STOP:%CALL=ENTER_PROCEDURE

** If called by token from Turn_Cycle_Stop code constructor
** %IF #MACRO=4 %THEN #MCODE=DATA2(1):%GOTO @CALL
** %IF #MACRO=501 %THEN #MCODE=DATA2(1):%GOTO @CALL

%IF CWNVAR402=2 %THEN #STOPMCODE=DATA2(1)	  :%GOTO @CALL		;	M00
%IF CWNVAR402=3 %THEN #STOPMCODE=DATA2(2)	:%GOTO @CALL		;	M01
%GOTO @END


@CALL
%CALL=CODECON_PROGRAM-STOP


@END
%IF #PROCTRACE=1 %THEN %CALL=EXIT_PROCEDURE
%ENDM
*** End of include file A:\Pams\cam\machdef\template\mill-procedures-basic.cgi ***
*** Start of include file mill-procedures-rotary.cgi ***
*** End of include file A:\Pams\cam\machdef\template\mill-procedures-rotary.cgi ***

