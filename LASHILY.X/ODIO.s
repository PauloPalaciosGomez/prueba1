PROCESSOR 18F57Q84
#include "CONFIGbit.inc" // config statements should precede project file includes.
#include <xc.inc>

PSECT resetVect, class=CODE, reloc=2
resetVect:
    goto Main
    
PSECT CODE
Main:
    CALL Config_OSC,1
    CALL Config_Port,1
    
LED_on:
    BANKSEL LATF
    BCF LATF,3,1
    BSF LATF,3,1
    goto LED_on
    
Config_OSC:
    BANKSEL OSCCON1
    MOVLW 0x60
    MOVWF OSCCON1
    MOVLW 0x03
    MOVWF OSCFRQ
    RETURN

Config_Port:
    BANKSEL PORTF
    CLRF PORTF,1
    BSF  LATF,3,1
    CLRF ANSELF,1
    BCF  TRISF,3,1
    RETURN
  
END resetVect
